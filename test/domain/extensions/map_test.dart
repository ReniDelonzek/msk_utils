import 'package:flutter_test/flutter_test.dart';
import 'package:msk_utils/domain/extensions/map.dart';

void main() {
  test('Test Map', () {
    Map<String, dynamic> data = {
      'person': {
        'name': 'Mike',
        'age': 22,
        'address': {'street': 'xyz'}
      }
    };
    expect(data.getLineValue('person/name'), 'Mike');
    expect(data.getLineValue('person/age'), 22);
    expect(data.getLineValue('person/address/street'), 'xyz');
  });
}
