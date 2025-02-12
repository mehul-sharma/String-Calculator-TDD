import 'package:test/test.dart';
void main() {
  final calculator = StringCalculator();

  // Test case for an empty string, should return 0
  test('Empty string should return 0', () {
    expect(calculator.add(''), equals(0));
  });

  // Test case for a single number, should return itself
  test('Single number should return itself', () {
    expect(calculator.add('1'), equals(1));
  });

  // Test case for two numbers, should return their sum
  test('Two numbers should return their sum', () {
    expect(calculator.add('1,5'), equals(6));
  });

  // Test case for multiple numbers, should return their sum
  test('Multiple numbers should return their sum', () {
    expect(calculator.add('1,2,3,4'), equals(10));
  });

  // Test case for handling new line as a delimiter
  test('Newline should be treated as a delimiter', () {
    expect(calculator.add('1\n2,3'), equals(6));
  });

  // Test case for supporting custom delimiters
  test('Custom delimiter should be supported', () {
    expect(calculator.add('//;\n1;2'), equals(3));
  });
}

class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0; // Return 0 if the input string is empty
    }

    String delimiter = ',|\n'; // Default delimiters: comma and newline

    // Check if the string starts with a custom delimiter
    if (numbers.startsWith('//')) {
      var parts = numbers.split('\n');
      delimiter = RegExp.escape(parts[0].substring(2)); // Extract custom delimiter
      numbers = parts.sublist(1).join('\n'); // Remove delimiter declaration
    }

    // Split numbers using the determined delimiter and parse them into a list of integers
    List<int> numList = numbers.split(RegExp(delimiter)).map(int.parse).toList();

    // Return the sum of all parsed numbers
    return numList.reduce((sum, num) => sum + num);
  }
}
