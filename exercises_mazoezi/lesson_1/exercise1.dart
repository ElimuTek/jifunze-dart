  import 'dart:io';
  import 'dart:math';
  
  //Task 1
  //Write a function called addTwo that takes two numbers as arguments and returns the sum of those two numbers.
  
  //This function takes two values from user input and adds them
  num addTwo(){
    try {
      print("Hello and welcome! Let's test out some simple dart functions.\nLet's ADD numbers!\nEnter first number:");
      //read the text from the standard input stream and stores it to the variable num
      num num1 = num.parse(stdin.readLineSync()!);
      print("Enter second number (to be added to first number above):");
      num num2 = num.parse(stdin.readLineSync()!);
      num sum = num1 + num2;
      return sum;
    } catch (e) {
      print("Error: It looks like you entered an invalid number. Function has failed and will return 0. Please restart the program to try again.");
      return 0;
    }
  }

  //Task 2
  //Write a function called subtractTwo that takes two numbers as arguments and returns the difference of those two numbers.
  num subtractTwo() {
    try {
      print("\n\nLet's SUBTRACT numbers!\nEnter first number:");
      num num1 = num.parse(stdin.readLineSync()!);
      print("Enter second number (to be subtracted from first number above):");
      num num2 = num.parse(stdin.readLineSync()!);
      return num1 - num2;
    } catch (e) {
      print("Error: Invalid number or input error. Function will return 0.");
      return 0;
    }
  }

  //Task 3
  //Write a function called multiplyTwo that takes two numbers as arguments and returns the product of those two numbers.
  num multiplyTwo() {
    try {
      print("\n\nLet's MULTIPLY numbers!\nEnter first number:");
      num num1 = num.parse(stdin.readLineSync()!);
      print("Enter second number (to be multiplied by the first number above):");
      num num2 = num.parse(stdin.readLineSync()!);
      return num1 * num2;
    } catch (e) {
      print("Error: Invalid number or input error. Function will return 0.");
      return 0;
    }
  }

  //Task 4
  //Write a function called divideTwo that takes two numbers as arguments and returns the quotient of those two numbers.
  num divideTwo() {
    try {
      print("\n\nLet's DIVIDE numbers!\nEnter Dividend:");
      num num1 = num.parse(stdin.readLineSync()!);
      print("Enter Divisor:");
      num num2 = num.parse(stdin.readLineSync()!);
      if (num2 == 0) throw Exception('Cannot divide by zero');
      return num1 / num2;
    } catch (e) {
      print("Error: ${e}. Function will return 0.");
      return 0;
    }
  }

  //Task 5
  //Write a function called stringLength that takes an argument of type String and returns the length of that string.
  int stringLength(){
    print("\n\nLet's find the LENGTH of a STRING\nEnter any string:");
    //read the text from the standard input stream and stores it to the variable num
    String userString = (stdin.readLineSync()!);
    int stringLength = userString.length;
    return stringLength;
  }

  //Task 6
  //Write a function called getFirstElement that takes a list as an argument and returns the first element of that list.
  dynamic getFirstElement(List<dynamic> list) {
  if (list.isNotEmpty) {
    return list.first;
  } else {
    throw Exception('List is empty');
  }
  }

  void main(){
    print("The sum is:\n${addTwo()}");
    print("The difference is:\n${subtractTwo()}");
    print("The product is:\n${multiplyTwo()}");
    print("The quotient is:\n${divideTwo()}");
    print("The length of your string is:\n${stringLength()}");

    var rng = Random();
    var randomIntList = <int>[]; // Declaring an empty list of integers
    for (var i = 0; i < 5; i++) {
      int randomNumber = rng.nextInt(100) + 1; // Generates a number between 1 and 100
      randomIntList.add(randomNumber); // Adds the number to the list);
    }
    print("\n\nHere's a list of 5 random numbers:\n$randomIntList");

    print("\nThe first element in the above list is:\n${getFirstElement(randomIntList)}");
  }