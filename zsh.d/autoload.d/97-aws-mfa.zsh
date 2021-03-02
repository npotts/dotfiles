export SAM_CLI_TELEMETRY=0

function aws-mfa-login {
    set -o pipefail
    profile=${1:-mfa}
    mfa_arn="$(aws iam list-mfa-devices | jq -r ".MFADevices[0].SerialNumber")"
    token="$(ykman oath code AWS -s)"
    if [[ $? -ne 0 ]]; then
      echo "Using MFA with ARN: '${mfa_arn}'"
      echo -n "MFA Code from Device: "
      read -s token
      echo "Ok"
    else
      echo "Using MFA from Yuibikey"
    fi

    ntoken="$(aws sts get-session-token --duration-seconds 86400 --serial-number "${mfa_arn}" --token-code "${token}")"
    # set +e
    # ENV Vars
    export AWS_ACCESS_KEY_ID="$(echo $ntoken | jq -r ".Credentials.AccessKeyId")"
    export AWS_SECRET_ACCESS_KEY="$(echo $ntoken | jq -r ".Credentials.SecretAccessKey")"
    export AWS_SESSION_TOKEN="$(echo $ntoken | jq -r ".Credentials.SessionToken")"

    aws --profile $profile configure set aws_access_key_id "$(echo $ntoken | jq -r ".Credentials.AccessKeyId")"
    aws --profile $profile configure set aws_secret_access_key "$(echo $ntoken | jq -r ".Credentials.SecretAccessKey")"
    aws --profile $profile configure set aws_session_token "$(echo $ntoken | jq -r ".Credentials.SessionToken")"
    aws --profile $profile configure set region us-east-1
    aws --profile $profile configure set output json
    echo "Keys expire at $(echo $ntoken | jq -r ".Credentials.Expiration")"
    return 0
}

function aws-mfa-export {
   set -o pipefail
   profile=${1:-mfa}
   export AWS_ACCESS_KEY_ID="$(aws --profile ${profile} configure get aws_access_key_id)"
   export AWS_SECRET_ACCESS_KEY="$(aws --profile ${profile} configure get aws_secret_access_key)"
   export AWS_SESSION_TOKEN="$(aws --profile ${profile} configure get aws_session_token)"
 }

function aws-ecr-login {
    # Attempt to login to Docker using ecr.  Optional argument of the aws profile to use, which
    # defaults to MFA unless changed.
    profile=${1:-mfa}
    region="$(aws --profile $profile configure get region)"
    account="$(aws sts get-caller-identity | jq -r ".Account")"
    aws --profile "$profile" ecr get-login-password | docker login --username AWS --password-stdin $account.dkr.ecr.$region.amazonaws.com
}

function aws-mfa { aws --profile mfa $@ }
# function awslocal { aws --endpoint-url=http://localhost:4566 $@ }

function aws-ssh {
  #mfaws ssm describe-instance-information | jq ".InstanceInformationList[] | {.InstanceId "
  mfaws  ssm start-session --target $@
}


function saw-mfa {
  saw --profile mfa $@
}

function saw-watch-rzexposure {
  set -o pipefail
  rzenv=$1
  pipeline="$(echo rzexposure-$rzenv)"
  tmux kill-session -t $pipeline || echo "Already dead"
  tmux new-session -d -s ${pipeline}
  tmux new-window -d -t ${pipeline} -n "${rzenv}::Lambda" "saw --profile mfa watch /aws/lambda/rzexposure-${rzenv}"
  tmux new-window -d -t ${pipeline} -n "${rzenv}::ECS"    "saw --profile mfa watch /ecs/${rzenv}-rzexposure"
  tmux attach -t ${pipeline}
}

function saw-batch {
  set -o pipefail
  pipeline="risk4"
  tmux kill-session -t $pipeline || echo "Already dead"
  tmux new-session -d -s ${pipeline}
  tmux new-window -d -t ${pipeline} -n "Batch" "saw --profile mfa watch /aws/batch/job"
  tmux attach -t ${pipeline}
}

