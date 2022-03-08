import 'package:flutter_test/flutter_test.dart';
import 'package:msk_utils/msk_utils.dart';

void main() {
  test('Test ItemSelect', () {
    expect(ItemSelect(deletado: true, id: null).save(), false);
    expect(ItemSelect(deletado: true, id: 0).save(), false);
    expect(ItemSelect(deletado: true, id: 1).save(), true);
  });
}
