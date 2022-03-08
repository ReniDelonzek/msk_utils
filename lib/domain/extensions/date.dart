import 'package:intl/intl.dart';
import 'package:msk_utils/msk_utils.dart';

extension Date on DateTime? {
  String string(String format, {String? defaultValue}) {
    if (this == null) return defaultValue ?? '';
    try {
      return DateFormat(format).format(this!);
    } catch (e, stackTrace) {
      UtilsSentry.reportError(e, stackTrace);
      return defaultValue ?? '';
    }
  }

  String? stringOrNull(String format, {String? defaultValue}) {
    try {
      if (this == null) {
        return defaultValue ?? null;
      }
      return DateFormat(format).format(this!);
    } catch (e) {
      return defaultValue;
    }
  }
}
