import 'package:flutter_test/flutter_test.dart';
import 'package:msk_utils/msk_utils.dart';

void main() {
  test('Test UtilsQuery', () {
    /// Não tem o ???
    expect(
        () => UtilsQuery.addFilterQuery(
            'select 1 from table where', 'id', [1, 4, 6]),
        throwsAssertionError);

    expect(
        UtilsQuery.addFilterQuery(
            'select 1 from table where ???', 'id', [1, 4, 6]),
        'select 1 from table where id NOT IN(1, 4, 6)');
    expect(
        UtilsQuery.addFilterQuery('select 1 from table ???', 'id', [1, 4, 6]),
        'select 1 from table where id NOT IN(1, 4, 6)');

    expect(
        UtilsQuery.addFilterQuery(
            'select 1 from table where ???', 'id', [1, 4, null, 6]),
        'select 1 from table where id NOT IN(1, 4, 6)');

    expect(UtilsQuery.addFilterQuery('select 1 from table where ???', 'id', []),
        'select 1 from table');

    expect(
        UtilsQuery.addFilterQuery(
            'select 1 from table where ??? and 1 = 1', 'id', []),
        'select 1 from table where 1 = 1');
    expect(
        UtilsQuery.addFilterQuery(
            'SELECT 1 FROM table WHERE ??? AND 1 = 1', 'id', []),
        'SELECT 1 FROM table WHERE 1 = 1');
    expect(
        UtilsQuery.addFilterQuery(
            'SELECT 1 FROM table WHERE 1 = 1 AND ???', 'id', []),
        'SELECT 1 FROM table WHERE 1 = 1');
    expect(
        UtilsQuery.addFilterQuery(
            'select 1 from table where 1 = 1 and ???', 'id', []),
        'select 1 from table where 1 = 1');
  });
}
