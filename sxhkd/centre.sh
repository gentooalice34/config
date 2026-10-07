#!/bin/bash

# Получаем ID активного окна
wid=$(bspc query -N -n focused)

# Получаем информацию о мониторе
monitor=$(bspc query -M -m focused --names)
monitor_geom=$(bspc query -M -m $monitor -D | grep -oP '(?<=geometry: )\S+')
monitor_x=$(echo $monitor_geom | cut -d',' -f1)
monitor_y=$(echo $monitor_geom | cut -d',' -f2)
monitor_w=$(echo $monitor_geom | cut -d',' -f3)
monitor_h=$(echo $monitor_geom | cut -d',' -f4)

# Получаем размеры окна
window_geom=$(bspc query -T -n $wid | grep -oP '(?<="geometry": \{)[^}]+')
window_w=$(echo $window_geom | grep -oP '(?<="width": )\d+')
window_h=$(echo $window_geom | grep -oP '(?<="height": )\d+')

# Вычисляем координаты для центрирования
new_x=$(( (monitor_w - window_w) / 2 + monitor_x ))
new_y=$(( (monitor_h - window_h) / 2 + monitor_y ))

# Перемещаем окно
bspc node $wid -v "$new_x" "$new_y"
