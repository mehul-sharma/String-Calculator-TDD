import 'package:test/test.dart';

void main() {
  final calculator = StringCalculator();

  test('Empty string should return 0', () {
    expect(calculator.add(''), equals(0));
  });

  test('Single number should return itself', () {
    expect(calculator.add('1'), equals(1));
  });
}

class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }
    return int.parse(numbers);
  }
}
