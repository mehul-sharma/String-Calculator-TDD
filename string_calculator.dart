import 'package:test/test.dart';
import 'string_calculator.dart';

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

  test('Custom delimiter should be supported', () {
    expect(calculator.add('//;\n1;2'), equals(3));
  });
}

class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = ',|\n';
    if (numbers.startsWith('//')) {
      var parts = numbers.split('\n');
      delimiter = RegExp.escape(parts[0].substring(2));
      numbers = parts.sublist(1).join('\n');
    }

    List<int> numList = numbers.split(RegExp(delimiter)).map(int.parse).toList();
    return numList.reduce((sum, num) => sum + num);
  }
}
