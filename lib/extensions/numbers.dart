import 'package:sprintf/sprintf.dart';

extension Numbers on num {
  String string({int casas}) {
    return sprintf("%.${casas}f", [this.toDouble() ?? 0.0]);
  }
}
