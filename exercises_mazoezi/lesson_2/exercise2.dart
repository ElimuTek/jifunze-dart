import 'dart:io'; // Importing Dart's IO library for input/output operations.

// Global variables for available currencies, their symbols, names, and conversion rates. 
// Update rates, add currencies, or fetch via API here!

// List of available currency codes.
List<String> currencies = ['USD', 'NGN', 'ZAR', 'TZS', 'KES', 'EUR'];

// Mapping of currency codes to their symbols.
Map<String, String> currencySymbols = {
  'USD': '\$',
  'NGN': '\u20A6',
  'ZAR': 'R',
  'TZS': 'TSh',
  'KES': 'KSh',
  'EUR': '\u20AC'
};

// Mapping of currency codes to their full names.
Map<String, String> currencyNames = {
  'USD': 'US Dollar',
  'NGN': 'Nigerian Naira',
  'ZAR': 'South African Rand',
  'TZS': 'Tanzanian Shilling',
  'KES': 'Kenyan Shilling',
  'EUR': 'Euro'
};

// Mapping of currency codes to their conversion rates against USD.
Map<String, double> conversionRates = {
  'USD': 1.0,
  'NGN': 1595.50,
  'ZAR': 18.80,
  'TZS': 2550.00,
  'KES': 143.00,
  'EUR': 0.92
};

void main() {
  // User input is validated using custom functions.
  String sourceCurrency = getValidCurrencyInput("Enter the three-letter code of the currency you want to convert FROM:");
  double amountToConvert = getValidAmountInput("Enter the AMOUNT of ${currencyNames[sourceCurrency]}s ($sourceCurrency) you wish to convert:");
  String targetCurrency = getValidCurrencyInput("Enter the three-letter code of the currency you want to convert TO:");

  // The conversion logic is encapsulated in a separate function for clarity.
  double convertedAmount = convertCurrency(amountToConvert, sourceCurrency, targetCurrency);

  // Outputting the conversion result in a user-friendly format.
  print("RESULT: ${amountToConvert.toStringAsFixed(2)} $sourceCurrency = ${convertedAmount.toStringAsFixed(2)} $targetCurrency\n${currencySymbols[sourceCurrency]}${amountToConvert.toStringAsFixed(2)} ${currencyNames[sourceCurrency]}s is equal to approximately ${currencySymbols[targetCurrency]}${convertedAmount.toStringAsFixed(2)} ${currencyNames[targetCurrency]}s.\nNOTE: Rates set 7 March 2024. Please update rates for more accurate results.");
}

// Function to ensure the user inputs a valid currency code.
String getValidCurrencyInput(String prompt) {
  String? inputCurrency;
  do {
    print(prompt);
    printCurrencies();
    inputCurrency = stdin.readLineSync()?.toUpperCase();
    if (!currencies.contains(inputCurrency)) {
      // Error message for invalid currency code input.
      print("ERROR: Invalid currency selection. Please select one of the currencies from the list below using the three-letter code given.");
    }
  } while (!currencies.contains(inputCurrency));
  return inputCurrency!;
}

// Function to get a valid amount for conversion.
double getValidAmountInput(String prompt) {
  double? amount;
  do {
    print(prompt);
    String? input = stdin.readLineSync();
    try {
      amount = double.parse(input!);
      if (amount < 0) throw FormatException("Negative amount is not allowed");
    } catch (e) {
      // Error message for invalid amount input.
      print("ERROR: Invalid amount. Please enter a positive number.");
    }
  } while (amount == null || amount < 0);
  return amount;
}

// Function to display the currencies for user selection.
void printCurrencies() {
  for (String currency in currencies) {
    print("Type \"$currency\" for ${currencyNames[currency]} (${currencySymbols[currency]})");
  }
}

// Function to convert an amount from one currency to another.
double convertCurrency(double amount, String source, String target) {
  double amountInBase = amount / conversionRates[source]!;
  return amountInBase * conversionRates[target]!;
}