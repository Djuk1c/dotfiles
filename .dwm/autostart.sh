#!/bin/bash
xset r rate 280 50
#xinput set-prop 13 "Coordinate Transformation Matrix" 2.0 0 0 0 2.0 0 0 0 1
nitrogen --restore &
picom -f &
#setxkbmap -option caps:escape
redshift -P -O 4000
numlockx on
xhost +

#cd /home/djukic/code/kp_thinkpad_scraper/
#./kp_scrape.sh &

while true; do
	date="$(date "+%a %d/%m/%Y | %H:%M")"
	sensorsOut=$(sensors)
	cpuTemp="$(printf '%s\n' "$sensorsOut"| grep 'temp1:' | awk '{print $2}' | cut -c2-)"
	gpuTemp="$(printf '%s\n' "$sensorsOut"| grep 'edge:' | awk '{print $2}' | cut -c2-)"
	cpuUsage="$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]%"
	ramUsage="$(free -m | grep '^Mem' | awk '{print $3"MB"}')"
	spaceAvaliable="$(df -h | sed '4!d' | awk '{print $4}')B"
	#temperature="$(curl wttr.in | grep '.--.' | head -1 | awk '{print $4}') °C"

	xsetroot -name " CPU: $cpuTemp | GPU: $gpuTemp | $cpuUsage | $ramUsage | $spaceAvaliable | $date "
	sleep 10s
done &
