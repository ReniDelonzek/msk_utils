import 'package:flutter_test/flutter_test.dart';
import 'package:msk_utils/data/models/item_select.dart';

void main() {
  test('Test ItemSelect', () {
    expect(ItemSelect(isDeleted: true, id: null).save(), false);
    expect(ItemSelect(isDeleted: true, id: 0).save(), false);
    expect(ItemSelect(isDeleted: true, id: 1).save(), true);

    expect(ItemSelect().isSelected, false);
    expect(ItemSelect().isDeleted, false);
    expect(ItemSelect().id, isNull);
    expect(ItemSelect().object, isNull);
    expect(ItemSelect().strings, Map<String, dynamic>());
  });
}
