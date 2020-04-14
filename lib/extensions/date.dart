import 'package:intl/intl.dart';
import 'package:msk_utils/utils/utils_sentry.dart';

extension Date on DateTime {
  String string(String format) {
    try {
      return DateFormat(format).format(this);
    } catch (e, stackTrace) {
      UtilsSentry.reportError(e, stackTrace);
      return '';
    }
  }
}
