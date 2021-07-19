extension MapEx on Map? {
  dynamic getLineValue(String coluna) {
    if (this == null) return this;
    Map? map = this;
    List<String> colunas = coluna.split('/');
    for (int i = 0; i < colunas.length - 1; i++) {
      //vai ate o penultimo
      if (map![colunas[i]] != null) {
        map = map[colunas[i]];
      } else {
        return map[colunas[i]];
      }
    }
    return map![colunas.last];
  }
}
