#!/bin/bash

BLUEZCARD=`pactl list cards short | egrep -o bluez.*[[:space:]]`
echo "Cycling card: ${BLUEZCARD}"
pactl set-card-profile $BLUEZCARD off
pactl set-card-profile $BLUEZCARD a2dp_sink
