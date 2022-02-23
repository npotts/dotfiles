#!/bin/bash


while pgrep -u $UID -x polybar >/dev/null;do killall -9 polybar; done
polybar top -r &
