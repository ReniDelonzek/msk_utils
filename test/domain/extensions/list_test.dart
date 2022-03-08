import 'package:flutter_test/flutter_test.dart';
import 'package:msk_utils/msk_utils.dart';

void main() {
  test('Test Iterable', () {
    List<int> list = [3, 4, 1, 3, 5, 9, 0];
    List listDouble = [4.3, 2.1, 7.4, 1.3, 2.3];
    expect(list.sortedBy((e) => e), [0, 1, 3, 3, 4, 5, 9]);
    expect(list.sortedByDesc((e) => e), [9, 5, 4, 3, 3, 1, 0]);
    expect(list.distinctBy((element) => element), [3, 4, 1, 5, 9, 0]);
    expect(list.getMax((element) => element), 9);
    expect(listDouble.getMaxDouble((element) => element), 7.4);
    expect(list.sumBy((element) => element), 25);
    expect(listDouble.sumByDouble((element) => element), 17.400000000000002);
    expect(
        listDouble.sumByDouble((element) => element, fractionDigits: 2), 17.40);

    expect(list.firstOrNull, 3);
    expect([null, 3, 5].firstOrNull, isNull);
    expect(list.lastOrNull, 0);
    expect([4, 3, 1, null].lastOrNull, isNull);

    expect(list.firstWhereOrNull((element) => element == 1), 1);
    expect(list.firstWhereOrNull((element) => element == 10), isNull);

    List listMap = [
      {'id': 1, 'name': 'Name1'},
      {'id': 1, 'name': 'Name2'},
    ];
    expect(listMap.lastWhereOrNull((element) => element['id'] == 1)!['name'],
        'Name2');
    expect(listMap.lastWhereOrNull((element) => element['id'] == 10), isNull);
  });

  test('Test iterable with null', () {
    List<int?> list = [3, 4, 1, 3, 5, 9, 0, null];
    List listDouble = [4.3, 2.1, 7.4, 1.3, 2.3];
    expect(list.sortedBy((e) => e), [0, 1, 3, 3, 4, 5, 9, null]);
    expect(list.sortedByDesc((e) => e), [9, 5, 4, 3, 3, 1, 0, null]);
    expect(list.distinctBy((element) => element), [3, 4, 1, 5, 9, 0, null]);
    expect(list.getMax((element) => element), 9);
    expect(listDouble.getMaxDouble((element) => element), 7.4);
    expect(list.sumBy((element) => element), 25);
    expect(listDouble.sumByDouble((element) => element), 17.400000000000002);
    expect(
        listDouble.sumByDouble((element) => element, fractionDigits: 2), 17.40);

    expect(list.firstOrNull, 3);
    expect([null, 3, 5].firstOrNull, isNull);
    expect(list.lastOrNull, null);
    expect([4, 3, 1, 9].lastOrNull, 9);

    expect(list.firstWhereOrNull((element) => element == 1), 1);
    expect(list.firstWhereOrNull((element) => element == 10), isNull);

    List listMap = [
      {'id': 1, 'name': 'Name1'},
      {'id': 1, 'name': 'Name2'},
      {'id': null, 'name': 'Name2'},
    ];
    expect(listMap.lastWhereOrNull((element) => element['id'] == 1)!['name'],
        'Name2');
    expect(listMap.lastWhereOrNull((element) => element['id'] == 10), isNull);
  });
}
