extension ExList<E> on Iterable<E> {
  /// Returns max int value in Irarable on [collum] specified
  /// If Iterable is null or empty, return [defaultValue]
  int getMax(int Function(E element) collum, {int defaultValue}) {
    if (this == null || this.isEmpty) return defaultValue;
    int max;
    this.forEach((element) {
      int pMax = collum(element);
      if (pMax != null) {
        if (max == null || pMax > max) {
          max = pMax;
        }
      }
    });
    return max;
  }

  /// Returns max int value in Irarable on [collum] specified
  /// If Iterable is null or empty, return null
  double getMaxDouble(double Function(E element) collumMax) {
    if (this.isEmpty) return null;
    double max;
    this.forEach((element) {
      double pMax = collumMax(element);
      if (pMax != null) {
        if (max == null || pMax > max) {
          max = pMax;
        }
      }
    });
    return max;
  }

  /// Sum values [collum] specified in Iterable
  double sumByDouble(double Function(E element) collum) {
    double sum = 0;
    this?.forEach((element) {
      double c = collum(element);
      if (c != null) {
        sum += c;
      }
    });
    return sum;
  }

  /// Sort list use to Comparable colums
  Iterable<E> sortedBy(Comparable key(E e)) =>
      toList()..sort((a, b) => key(a)?.compareTo(key(b)));

  /// Sort list desc use to Comparable colums
  Iterable<E> sortedByDesc(Comparable key(E e)) =>
      toList()..sort((b, a) => key(a)?.compareTo(key(b)));

  E get firstOrNull {
    if (this == null || this.isEmpty)
      return null;
    else
      return this.first;
  }

  E get lastOrNull {
    if (this == null || this.isEmpty)
      return null;
    else
      return this.last;
  }

  E firstWhereOrNull(bool test(E element)) {
    if (this == null || this.isEmpty) return null;
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  E lastWhereOrNull(bool test(E element)) {
    if (this == null || this.isEmpty) return null;
    E result;
    bool foundMatching = false;
    for (E element in this) {
      if (test(element)) {
        result = element;
        foundMatching = true;
      }
    }
    if (foundMatching) return result;
    return null;
  }
}
