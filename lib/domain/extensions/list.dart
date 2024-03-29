import 'dart:collection';

import 'package:msk_utils/domain/extensions/string.dart';

extension ExListNotNull<E> on Iterable<E> {
  /// Sort list use to Comparable colums
  Iterable<E> sortedBy(Comparable? key(E e)) => toList()
    ..sort((a, b) => (a != null && b != null ? key(a)!.compareTo(key(b)) : 0));

  /// Sort list desc use to Comparable colums
  Iterable<E> sortedByDesc(Comparable? key(E? e)) => toList()
    ..sort((b, a) => (a != null && b != null ? key(a)!.compareTo(key(b)) : 0));

  // Apply a distinct per specific column
  List<E> distinctBy(Function(E element) a) {
    HashSet idServers = new HashSet();
    List<E> newList = List.from(this);
    for (int i = 0; i < newList.length; i++) {
      final value = a(newList[i]);
      if (!idServers.add(value)) {
        /// Do the -- no i because removing an item from the list and not doing that it will skip the next one
        newList.removeAt(i--);
      }
    }
    return newList;
  }
}

extension ExIterable<E> on Iterable<E>? {
  /// Returns max int value in Irarable on [collum] specified
  /// If Iterable is null or empty, return [defaultValue]
  int? getMax(int? Function(E? element) collum, {int? defaultValue}) {
    if (this == null || this!.isEmpty) return defaultValue;
    int? max;
    this!.forEach((element) {
      int? pMax = collum(element);
      if (pMax != null) {
        if (max == null || pMax > max!) {
          max = pMax;
        }
      }
    });
    return max;
  }

  /// Returns max int value in Irarable on [collum?] specified
  /// If Iterable is null or empty, return null
  double? getMaxDouble(double? Function(E? element) collumMax) {
    if (this == null || this!.isEmpty) return null;
    double? max;
    this!.forEach((element) {
      double? pMax = collumMax(element);
      if (pMax != null) {
        if (max == null || pMax > max!) {
          max = pMax;
        }
      }
    });
    return max;
  }

  /// Sum values [collum] specified in Iterable
  double sumByDouble(double? Function(E? element) collum,
      {int? fractionDigits}) {
    double sum = 0;
    this?.forEach((element) {
      double? c = collum(element);
      if (c != null) {
        sum += c;
      }
    });
    if (fractionDigits != null) {
      sum = sum.toStringAsFixed(fractionDigits).toDouble();
    }
    return sum;
  }

  /// Sum values [collum] specified in Iterable
  double sumBy(int? Function(E? element) collum) {
    double sum = 0;
    this?.forEach((element) {
      int? c = collum(element);
      if (c != null) {
        sum += c;
      }
    });
    return sum;
  }

  E? get firstOrNull {
    if (this == null || this!.isEmpty)
      return null;
    else
      return this!.first;
  }

  E? get lastOrNull {
    if (this == null || this!.isEmpty)
      return null;
    else
      return this!.last;
  }

  E? firstWhereOrNull(bool test(E element)) {
    if (this == null || this!.isEmpty) return null;
    for (E element in this!) {
      if (test(element)) return element;
    }
    return null;
  }

  E? lastWhereOrNull(bool test(E element)) {
    if (this == null || this!.isEmpty) return null;
    E? result;
    bool foundMatching = false;
    for (E element in this!) {
      if (test(element)) {
        result = element;
        foundMatching = true;
      }
    }
    if (foundMatching) return result;
    return null;
  }
}
