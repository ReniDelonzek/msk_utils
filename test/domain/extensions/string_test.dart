import 'package:flutter_test/flutter_test.dart';
import 'package:msk_utils/msk_utils.dart';

void main() {
  group('Test string', () {
    test('Test add zeros', () {
      expect('10'.addLeadingZerosLengthLessThan(5), '00010');
      String s = '453';
      expect(s.addZeros(10 - s.length), '0000000453');
      // Não deve alterar a string em si
      expect(s, '453');
    });
    test('Test toDouble', () {
      expect('10'.toDouble(), 10.0);
      expect('actual'.toDouble(), 0.0);
      expect('actual'.toDouble(defaultValue: 10), 10.0);
      expect('10,0'.toDouble(), 10.0);
    });

    test('Test toDoubleOrNull', () {
      expect('10'.toDoubleOrNull(), 10.0);
      expect('actual'.toDoubleOrNull(), isNull);
      expect('10,0'.toDoubleOrNull(), 10.0);
      expect('10,0,0'.toDoubleOrNull(), isNull);
    });

    test('Test toInt', () {
      expect('10'.toInt(), 10);
      expect('actual'.toInt(), 0);
      expect('10,0'.toInt(), 10);
      expect('10,0,0'.toInt(), 0);
    });

    test('Test toIntOrNull', () {
      expect('10'.toIntOrNull(), 10.0);
      expect('actual'.toIntOrNull(), isNull);
      expect('10,0'.toIntOrNull(), 10.0);
      expect('10,0,0'.toIntOrNull(), isNull);
    });

    test('Test isNullOrEmpty', () {
      expect('actual'.isNullOrEmpty, false);
      expect(''.isNullOrEmpty, true);
      String? s;
      expect(s.isNullOrEmpty, true);
    });

    test('Test lowerCaseFirst', () {
      expect('ACTUAL'.lowerCaseFirst(), 'aCTUAL');
      expect('A'.lowerCaseFirst(), 'a');
      expect('actual'.lowerCaseFirst(), 'actual');
      String? s;
      expect(s.lowerCaseFirst(), isNull);
    });

    test('Test upperCaseFirst', () {
      expect('actuaL'.upperCaseFirst(), 'ActuaL');
      expect('A'.upperCaseFirst(), 'A');
      expect('a'.upperCaseFirst(), 'A');
      String? s;
      expect(s.upperCaseFirst(), isNull);
    });

    test('Test upperCaseFirstLower', () {
      expect('ACTUAL'.upperCaseFirstLower(), 'Actual');
      expect('A'.upperCaseFirstLower(), 'A');
      expect('a'.upperCaseFirstLower(), 'A');
      expect('actual'.upperCaseFirstLower(), 'Actual');
      String? s;
      expect(s.upperCaseFirstLower(), isNull);
    });

    test('Test isNullOrBlank', () {
      expect('actual'.isNullOrBlank, false);
      expect('  '.isNullOrBlank, true);
      expect(''.isNullOrBlank, true);
      String? s;
      expect(s.isNullOrEmpty, true);
    });

    test('Test toDate', () {
      String format = 'yyyy-MM-dd';
      String date = '2020-01-01';
      expect(date.toDate(format).string(format), date);

      format = 'dd/MM/yyyy HH:mm:ss';
      date = '23/11/1993 22:34:22';
      expect(date.toDate(format).string(format), date);
      expect('actual'.toDate(format), isNull);
    });

    test('Test firstWord', () {
      expect('actual word'.firstWord(), 'actual');
      expect('first and last'.firstWord(), 'first');
    });

    test('Test lastWord', () {
      expect('actual word'.lastWord(), 'word');
      expect('first and last'.lastWord(), 'last');
    });
  });
}
