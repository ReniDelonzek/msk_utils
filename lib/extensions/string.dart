import 'package:intl/intl.dart';

extension St on String {
  double toDouble({double defaultValue}) {
    return double.tryParse(this?.replaceAll(',', '.')?.trim()) ??
        defaultValue ??
        0.0;
  }

  double toDoubleOrNull() {
    return double.tryParse(this.replaceAll(',', '.'));
  }

  /// Retorna um int da string
  ///
  /// [defaultValue] Caso o parse falhe, assume o valor indicado
  int toInt({int defaultValue}) {
    // Faz um toDouble, pq se tentar dar um parse em um decimal direto pra int resulta em erro
    return this.toDouble(defaultValue: defaultValue?.toDouble() ?? 0.0).toInt();
  }

  /// Adiciona zeros a esquerda de acordo com a [quantidade] indicada
  String addZeros(int quantidade) {
    var string = '';
    for (int i = 0; i < quantidade; i++) {
      string += "0";
    }
    return string + this;
  }

  bool get isNullOrEmpty {
    return this == null || this.isEmpty;
  }

  /// Deixa a primeira letra da palavra em minusculo, e o restantante como estava
  String lowerCaseFirst() {
    if (this != null) {
      if (this.length > 1) {
        return this.substring(0, 1).toLowerCase() + this.substring(1);
      } else
        return this.toLowerCase();
    } else
      return this;
  }

  /// Deixa a primeira letra da palavra em maiusculo, e o restantante como estava
  String upperCaseFirst() {
    if (this != null) {
      if (this.length > 1) {
        return this.substring(0, 1).toUpperCase() + this.substring(1);
      } else
        return this.toLowerCase();
    } else
      return this;
  }

  /// Deixa a primeira letra da palavra em maiusculo, e o restantante em minúsculo
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

  /// Retorna true caso a string seja nula ou vazia
  bool get isNullOrBlank {
    return this == null || this.trim().isEmpty;
  }

  /// Covente string para DateTime
  ///
  /// [format] Indica o formato que a data está
  DateTime toDate(String format, {DateTime defaultDate}) {
    try {
      return DateFormat(format).parse(this);
    } catch (e) {
      print(e);
      return defaultDate ?? null;
    }
  }

  /// Retorna a primeira palavra de uma stirng
  String firstWord() {
    if (this != null) {
      return this.split(' ').first;
    } else
      return this;
  }
}
