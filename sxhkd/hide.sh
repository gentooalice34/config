#!/bin/bash
for node in $(bspc query -N -n .hidden -d focused); do
    # Снять флаг hidden с каждого найденного окна
    bspc node "$node" -g hidden=off
done
