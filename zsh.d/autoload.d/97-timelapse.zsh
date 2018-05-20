# This provides some shell functions to deal with time lapse photos via
# connected cameras.
#

function timelapse {
    if [[ -z "$1" ]]; then
        echo "timelapse: use gphoto2 to capture a picture sequence until Ctrl-C is hit"
        echo "Usage: timelapse <seq-name>"
        echo
        echo "<seq-name> is a dir to be created and images stored."
        return
    fi
    mkdir -p "$1"
    #gphoto2 --set-config flashmode=0 -I 10 -F 3600 --capture-image-and-download --force-overwrite --filename "$1/%Y%m%d%H%M%S.jpg"
    gphoto2 --set-config flashmode=0 -I 10 --capture-image-and-download --force-overwrite --filename "$1/%Y%m%d%H%M%S.jpg"
}

function timelapse-compile {
    if [[ -z "$1" ]]; then
        echo "timelapse-compile: use mencoder to turn a pile of jpgs into a avi"
        echo "Usage: timelapse-comile <output>"
        return
    fi
    mencoder "mf://*.jpg" -mf fps=12:type=jpg -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell:vbitrate=7000 -vf scale=640:480 -oac copy -o $1
}

function timestamp-image {
    if [[ -z "$1" ]]; then
        echo "timestamp-image: insert a timestamp in the lower right corner of an image" 
        echo "Usage: timestamp-image <filename_in> <filename_out>"
        echo
        echo "<filename_in> <filename_out>"
        return
    fi

    if [ ! -f $1 ]; then
        echo "$1 not found"
        return
    fi

    text=`identify -format "%[EXIF:DateTime]" $1`
    width=`identify -format %w $1`
    convert $1 -gravity southeast -pointsize 40 \
        -stroke black -strokewidth 4 -annotate 0 "${text}" \
        -stroke white -strokewidth 1 -fill white -annotate 0 "${text}" \
        "$2"
}


