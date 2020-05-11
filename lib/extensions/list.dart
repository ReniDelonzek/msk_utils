typedef CollumMax<T> = int Function(T obj);

typedef CollumMaxDouble<T> = double Function(T obj);

extension ExList on List {
  int getMax(CollumMax collumMax) {
    int max = 0;
    this.forEach((element) {
      int pMax = collumMax(element);
      if (max != null) {
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
      if (max != null) {
        if (pMax > max) {
          max = pMax;
        }
      }
    });
    return max;
  }
}
