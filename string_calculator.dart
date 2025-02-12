import 'package:test/test.dart';
import 'string_calculator.dart';

void main() {
  final calculator = StringCalculator();

  test('Empty string should return 0', () {
    expect(calculator.add(''), equals(0));
  });
}

class StringCalculator {
  int add(String numbers) {
    return 0;
  }
}