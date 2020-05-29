import 'package:intl/intl.dart';

extension St on String {
  double toDouble({double defaultValue}) {
    return double.tryParse(this.replaceAll(',', '.')) ?? defaultValue ?? 0.0;
  }

  double toDoubleOrNull() {
    return double.tryParse(this.replaceAll(',', '.'));
  }

  int toInt({int defaultValue}) {
    //faz um to double, pq se tentar dar um parse em um decimal direto pra int resulta em erro
    return this.toDouble(defaultValue: defaultValue?.toDouble() ?? 0.0).toInt();
  }

  String addZeros(int quantidade) {
    var string = '';
    for (int i = 0; i < quantidade; i++) {
      string += "0";
    }
    return string + this;
  }

  bool isNullOrEmpty() {
    return this == null || this.isEmpty;
  }

  String lowerCaseFirst() {
    if (this != null) {
      if (this.length > 1) {
        return this.substring(0, 1).toLowerCase() + this.substring(1);
      } else
        return this.toLowerCase();
    } else
      return this;
  }

  String upperCaseFirst() {
    if (this != null) {
      if (this.length > 1) {
        return this.substring(0, 1).toUpperCase() + this.substring(1);
      } else
        return this.toLowerCase();
    } else
      return this;
  }

  String upperCaseFirstLower() {
    if (this != null) {
      if (this.length > 1) {
        return this.substring(0, 1).toUpperCase() +
            this.substring(1).toLowerCase();
      } else
        return this.toLowerCase();
    } else
      return this;
  }

  bool get isNullOrBlank {
    return this == null || this.trim().isEmpty;
  }

  DateTime toDate(String format, {DateTime defaultDate}) {
    try {
      return DateFormat(format).parse(this);
    } catch (e) {
      print(e);
      return defaultDate ?? null;
    }
  }
}
