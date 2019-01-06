#!/bin/env sh

pkill polybar

sleep 1;

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
     if [[ $m == "eDP-1" ]]; then
        export TRAY_POSITION=right
    else
        export TRAY_POSITION=none
    fi
    MONITOR=$m polybar --reload i3wmthemer_bar &
  done
else
  polybar --reload i3wmthemer_bar &
fi

