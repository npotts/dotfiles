function aws-mfa {
    profile=${1:-mfa}
    # set -euo pipe
    mfa_arn="$(aws iam list-mfa-devices | jq -r ".MFADevices[0].SerialNumber")"
    echo "Using MFA with ARN: '${mfa_arn}'"
    echo -n "MFA Code from Device: "
    read -s token
    echo "Ok"
    ntoken="$(aws sts get-session-token --duration-seconds 86400 --serial-number "${mfa_arn}" --token-code "${token}")"
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
    unset token
    unset mfa_arn
    unset ntoken
    unset profile
}