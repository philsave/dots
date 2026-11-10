# make Terminus font work
xset +fp /usr/share/fonts/local
xset fp rehash

xset -b # disable bell

xset r rate 300 50

while true
do
        VOL="| VOL: $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')"
        LOCALTIME="| $(date)"
        TEMP="| TEMP: $(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"
        MEM="| MEM: $(free -h | awk '(NR==2){ print $4 }')"
        KB="| $(setxkbmap -query | awk '/layout/{ print $2 }')"
        BAT="BAT: $(cat /sys/class/power_supply/BAT0/capacity)"

        xsetroot -name "$BAT $VOL $MEM $KB $TEMP $LOCALTIME"
        sleep 20s
done &

exec dwm
