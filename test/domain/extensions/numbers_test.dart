import 'package:flutter_test/flutter_test.dart';
import 'package:msk_utils/domain/extensions/numbers.dart';

void main() {
  test('Test numbers extension', () {
    expect(1.string(decimalPlaces: 2), '1.00');
    expect(4.23233.string(decimalPlaces: 2), '4.23');
    expect(4.23233.string(decimalPlaces: 0), '4');
    expect(4.1.string(decimalPlaces: 5), '4.10000');
  });
}
