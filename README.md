# String Calculator TDD
I have generated this readme.md file with the help of chatGPT :)

## Introduction
This project implements a **String Calculator** using **Test-Driven Development (TDD)** in Dart. It follows a step-by-step approach, where test cases are written first and then implemented to pass them.

## Features
- Handles an empty string and returns `0`
- Supports single and multiple numbers
- Allows newline (`\n`) as a delimiter
- Supports custom delimiters specified in the format `//[delimiter]\n[numbers]`
- Supports multiple custom delimiters of different lengths (`//[*][%]\n1*2%3`)
- Throws an exception for negative numbers, listing all negative values found

## Setup & Requirements
1. Ensure you have **Dart SDK** installed.
2. Install the **test** package using:
   ```sh
   dart pub add test
   ```

## Running Tests
To execute the test cases, run:
```sh
dart test string_calculator_test.dart
```

## Example Usage
```dart
final calculator = StringCalculator();
print(calculator.add("1,2,3")); // Output: 6
print(calculator.add("//[***]\n1***2***3")); // Output: 6
```

## Test Cases
The implementation is tested with various inputs, including:
- Empty string (`""`) → `0`
- Single number (`"1"`) → `1`
- Two numbers (`"1,2"`) → `3`
- Multiple numbers (`"1,2,3,4"`) → `10`
- Newline as a delimiter (`"1\n2,3"`) → `6`
- Custom delimiter (`"//;\n1;2"`) → `3`
- Multiple delimiters (`"//[*][%]\n1*2%3"`) → `6`
- Longer delimiters (`"//[***]\n1***2***3"`) → `6`
- Negative numbers (`"1,-2,3,-4"`) → Exception `negative numbers not allowed -2,-4`

## Contributing
Feel free to fork this repository and submit pull requests to improve or extend the project.

## License
This project is open-source and available under the MIT License.

