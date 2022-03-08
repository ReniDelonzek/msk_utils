import 'package:sprintf/sprintf.dart';

extension NumbersExtension on num? {
  String? string({int? decimalPlaces}) {
    return sprintf("%.${decimalPlaces}f", [this?.toDouble() ?? 0.0]);
  }
}
