extension MapEx on Map? {
  dynamic getLineValue(String coluna) {
    if (this == null) return this;
    Map? map = this;
    List<String> collums = coluna.split('/');
    for (int i = 0; i < collums.length - 1; i++) {
      // go to the penultimate
      if (map![collums[i]] != null) {
        map = map[collums[i]];
      } else {
        return map[collums[i]];
      }
    }
    return map![collums.last];
  }
}
