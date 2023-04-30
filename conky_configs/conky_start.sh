#!/bin/sh
sleep 8s
conky -q -d -c ~/.config/conky_configs/conky_old &
sleep 1s
conky -q -d -c ~/.config/conky_configs/conky_time &
sleep 1s
conky -q -d -c ~/.config/conky_configs/conky_todo &
