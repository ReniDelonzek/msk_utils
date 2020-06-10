import 'package:intl/intl.dart';
import 'package:msk_utils/utils/utils_sentry.dart';

extension Date on DateTime {
  String string(String format, {String defaultValue}) {
    try {
      return DateFormat(format).format(this);
    } catch (e, stackTrace) {
      UtilsSentry.reportError(e, stackTrace);
      return defaultValue ?? '';
    }
  }

  String stringOrNull(String format, {String defaultValue}) {
    try {
      return DateFormat(format).format(this);
    } catch (e, stackTrace) {
      UtilsSentry.reportError(e, stackTrace);
      return defaultValue;
    }
  }
}
