#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <mosquitto.h>

// Replace these with the IP address and port of your MQTT broker
#define BROKER_IP "195.27.52.255"
#define BROKER_PORT 1883

int main(void) {
  // Seed the random number generator with the current time
  srand(time(NULL));

  // Generate a random number
  int r = rand();

  // Initialize Mosquitto library
  mosquitto_lib_init();

  // Create a new Mosquitto client instance
  struct mosquitto *client = mosquitto_new("random_number_client", true, NULL);

  // Set callback function for messages received from the broker
  mosquitto_message_callback_set(client, message_callback);

  // Connect to the broker
  mosquitto_connect(client, BROKER_IP, BROKER_PORT, 60);

  // Publish the random number to the "random_number" topic
  mosquitto_publish(client, NULL, "random_number", sizeof(r), &r, 0, false);

  // Disconnect from the broker and clean up
  mosquitto_disconnect(client);
  mosquitto_destroy(client);
  mosquitto_lib_cleanup();

  return 0;
}