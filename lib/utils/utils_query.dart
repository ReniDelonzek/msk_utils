class UtilsQuery {
  /// Adiciona um filtro no lugar dos ??? na query
  /// de acordo com o id e a lista de ints especificada
  static String addFilterQuery(String query, String id, List<int?> list) {
    if (list.isEmpty) {
      // Não usar lowerCase pq isso altera a query original, o que pode trazer problemas nos nomes das colunas
      if (query.contains('and ???') || query.contains('AND ???')) {
        return query.replaceAll('and ???', '').replaceAll('AND ???', '');
      } else {
        return query.replaceAll('???', '');
      }
    } else {
      String wheres = '';
      for (int i = 0; i < list.length; i++) {
        if (list[i] != null) {
          wheres += '$id != ${list[i]}';
          if (i < list.length - 1) {
            wheres += ' and ';
          }
        }
      }
      return query.replaceAll(
          '???',
          ((!query.contains('where') && !query.contains('WHERE'))
                  ? 'where '
                  : '') +
              wheres);
    }
  }
}
