#!/bin/bash

# Replace this with the IP address of your MQTT broker
broker_ip="195.27.52.255"
#define BROKER_PORT 1883


# Replace this with the name of your bash script
bash_script="script.sh"
bash_script="script2.sh"

# Set timer for 20 seconds
timeout=20

echo "Waiting for user input or MQTT message (timeout: $timeout seconds)..."

# Subscribe to the "play" topic
mosquitto_sub -h $broker_ip -t "play" | while read line
do
  # Check if "play" message was received
  if [ "$line" = "play" ]; then
    # Start the bash script
    bash $bash_script &
    break
  fi
done

# Wait for user input or timeout
read -t $timeout -p "Press any key to start the script..."

# Check if user input was received
if [ $? -eq 0 ]; then
  # Start the bash script
  bash $bash_script &
else
  echo "Timeout reached, starting script..."
  bash $bash_script &
fi