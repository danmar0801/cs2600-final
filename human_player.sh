#!/bin/bash

# Prompt the user to enter a number from 1 to 9
echo "Enter a number from 1 to 9:"
read num

# Send the number to the broker using mosquitto_pub
mosquitto_pub -t "my_topic" -m "$num"

echo "Sent $num to the broker."