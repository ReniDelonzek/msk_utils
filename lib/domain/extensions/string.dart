import 'package:intl/intl.dart';

extension StNotNull on String {
  /// Add leading zeros according to the indicated [quantity]
  String addZeros(int quantity) {
    String string = '';
    for (int i = 0; i < quantity; i++) {
      string += "0";
    }
    return string + this;
  }

  /// Add leading zeros if the string length is less than the indicated [length]
  String addLeadingZerosLengthLessThan(int length) {
    if (this.length >= length) {
      return this;
    }
    return this.addZeros(length - this.length);
  }
}

extension St on String? {
  /// Convert to double or [defaultValue]
  double toDouble({double defaultValue = 0.0}) {
    if (this == null) {
      return defaultValue;
    }
    return double.tryParse(this!.replaceAll(',', '.').trim()) ?? defaultValue;
  }

  /// Convert to double or null
  double? toDoubleOrNull() {
    if (this == null) {
      return null;
    }
    return double.tryParse(this!.replaceAll(',', '.'));
  }

  /// Convert to int or [defaultValue]
  int toInt({int defaultValue = 0}) {
    // Faz um toDouble, pq se tentar dar um parse em um decimal direto pra int resulta em erro
    return this.toDouble(defaultValue: defaultValue.toDouble()).toInt();
  }

  /// Convert to int or null
  int? toIntOrNull() {
    if (this == null) return null;
    // Faz um toDouble, pq se tentar dar um parse em um decimal direto pra int resulta em erro
    return this.toDoubleOrNull()?.toInt();
  }

  /// Check if string is null or empty
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  /// Leave the first letter of the word in lower case, and the rest as it was.
  String? lowerCaseFirst() {
    if (this != null) {
      if (this!.length > 1) {
        return this!.substring(0, 1).toLowerCase() + this!.substring(1);
      } else
        return this!.toLowerCase();
    } else
      return this;
  }

  /// Deixa a primeira letra da palavra em maiusculo, e o restantante como estava
  String? upperCaseFirst() {
    if (this != null) {
      if (this!.length > 1) {
        return this!.substring(0, 1).toUpperCase() + this!.substring(1);
      } else
        return this!.toUpperCase();
    } else
      return this;
  }

  /// Make the first letter of the word uppercase and the rest lowercase.
  String? upperCaseFirstLower() {
    if (this != null) {
      if (this!.length > 1) {
        return this!.substring(0, 1).toUpperCase() +
            this!.substring(1).toLowerCase();
      } else
        return this!.toUpperCase();
    } else
      return this;
  }

  /// Retorna true caso a string seja nula ou vazia
  bool get isNullOrBlank {
    return this == null || this!.trim().isEmpty;
  }

  /// Convert string to dateTime, if fail, returns [defaultDate] or null
  DateTime? toDate(String format, {DateTime? defaultDate}) {
    if (this == null) return defaultDate ?? null;
    try {
      return DateFormat(format).parse(this!);
    } catch (e) {
      print(e);
      return defaultDate ?? null;
    }
  }

  /// Return firt word from string
  String? firstWord() {
    if (this != null) {
      return this!.split(' ').first;
    } else
      return this;
  }

  /// Return last word from string
  String? lastWord() {
    if (this != null) {
      return this!.split(' ').last;
    } else
      return this;
  }
}
