#!/bin/sh
conky -q -d -c ~/.conky_configs/.conky_old &
conky -q -d -c ~/.conky_configs/.conky_time &
conky -q -d -c ~/.conky_configs/.conky_todo &
