How the process works:

THE esp32 is constantly running a game of tic tac toe waiting for the user 1 to hit a key on the matrix keypad, user 1 will click on 1 -9 that will coralate with the tic tac toe board

1|2|3
_____
4|5|6
_____
7|8|9

once the user clicks on a number the board will send a single to the broker to activate a daemon file that will wait 20 seconds, if the user clicks on any key, it will activate the human player script which will take the suer input (from 1-9 ) and send it to the broker which will send it to esp32
the esp32 check the input, if notvalid will keep asking till valid input provided
if no key press is detected the scipt.sh will run and will pick a random number from 1-9 which will be sent to the esp32 that will check the input is valid, if its not it will keep asking till a valid input is provided

