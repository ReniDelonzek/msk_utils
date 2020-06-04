typedef CollumMax<T> = int Function(T obj);

typedef CollumMaxDouble<T> = double Function(T obj);

typedef CollumSumDouble<T> = double Function(T obj);

extension ExList on List {
  int getMax(CollumMax collumMax, {int defaultValue}) {
    if (this.isEmpty) return defaultValue;
    int max = 0;
    this.forEach((element) {
      int pMax = collumMax(element);
      if (pMax != null) {
        if (pMax > max) {
          max = pMax;
        }
      }
    });
    return max;
  }

  double getMaxDouble(CollumMaxDouble collumMax) {
    double max = 0;
    this.forEach((element) {
      double pMax = collumMax(element);
      if (pMax != null) {
        if (pMax > max) {
          max = pMax;
        }
      }
    });
    return max;
  }

  double sumByDouble(CollumSumDouble collum) {
    double sum = 0;
    this?.forEach((element) {
      double c = collum(element);
      if (c != null) {
        sum += c;
      }
    });
    return sum;
  }
}
