import 'package:flutter_test/flutter_test.dart';
import 'package:msk_utils/domain/extensions/date.dart';

void main() {
  test('Test date string', () {
    DateTime dateTime = DateTime(2020, 03, 15, 12, 23, 54);
    expect(dateTime.string('dd/MM/yyyy'), '15/03/2020');
    expect(dateTime.string('dd-MM-yyyy'), '15-03-2020');
    expect(dateTime.string('dd/MM/yyyy HH:mm:ss'), '15/03/2020 12:23:54');
    expect(dateTime.string('yyyy-MM-dd'), '2020-03-15');
  });
  test('Test date stringOrNull', () {
    DateTime? dateTime;
    expect(DateTime(2020, 03, 15, 12, 23, 54).stringOrNull('dd/MM/yyyy'),
        '15/03/2020');
    expect(dateTime.stringOrNull('dd-MM-yyyy'), isNull);
  });
}
