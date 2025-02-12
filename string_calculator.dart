import 'package:test/test.dart';

void main() {
  final calculator = StringCalculator();

  test('Empty string should return 0', () {
    expect(calculator.add(''), equals(0));
  });

  test('Single number should return itself', () {
    expect(calculator.add('1'), equals(1));
  });

  test('Two numbers should return their sum', () {
    expect(calculator.add('1,5'), equals(6));
  });

  test('Multiple numbers should return their sum', () {
    expect(calculator.add('1,2,3,4'), equals(10));
  });

  test('Newline should be treated as a delimiter', () {
    expect(calculator.add('1\n2,3'), equals(6));
  });
}

class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    List<int> numList = numbers.split(RegExp(',|\n')).map(int.parse).toList();
    return numList.reduce((sum, num) => sum + num);
  }
}
