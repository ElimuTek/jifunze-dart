/*


Dart Control Flow Assignment


Create a Dart program that prompts the user for a number and then prints a message to the console based on the following criteria:

    If the number is greater than 10, print "Your number is greater than 10"
    If the number is less than 10, print "Your number is less than 10"
    If the number is equal to 10, print "Your number is equal to 10"


Submit the solution via a Github link to https://forms.gle/wve1Lbk1ab8igLgQ9

*/

// Importing the dart library for input/output operations.
import 'dart:io';

void main() {
  // Print a message to the console asking the user to enter a number.
  // Note: The program will wait for the user's input on the next line.
  print('Please enter a number:');

  // Read the line from the standard input (console).
  // Note: All inputs in Dart come in as String type by default.
  String? input = stdin.readLineSync();

  // Try to parse the input string to an integer.
  // 'int.tryParse' attempts to convert the string to an integer. If the input is not a valid integer, 'tryParse' returns null.
  // The '??' operator is used to provide an empty string ('') if 'input' is null, so that 'tryParse' does not throw an error due to null input.
  int? number = int.tryParse(input ?? '');

  // Check if the parsed number is null, which indicates invalid input.
  if (number == null) {
    // If the input is not a valid number, print an error message.
    print('Invalid input. Please enter a valid number.');
  } else {
    // If the input is a valid number, compare it to 10 and print corresponding messages.
    // Check if the number is greater than 10.
    if (number > 10) {
      print('Your number is greater than 10');
    } 
    // Check if the number is less than 10.
    else if (number < 10) {
      print('Your number is less than 10');
    } 
    // If the number is neither greater than nor less than 10, it must be equal to 10.
    else {
      print('Your number is equal to 10');
    }
  }
}