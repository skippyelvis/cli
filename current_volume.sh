#!/bin/bash
amixer sget Master | sed '5q;d' | awk '{print $4}' | awk '{print substr($0, 2, length($0)-2)}'
