#!/bin/bash
brightnessctl -d "intel_backlight" | sed '2q;d' | awk '{print $4}' | awk '{print substr($0, 2, length($0)-2)}'
