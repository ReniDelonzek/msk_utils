class UtilsString {
  static String addZeros(int quantidade) {
    var string = "";
    for (int i = 0; i < quantidade; i++) {
      string += "0";
    }
    return string;
  }
}
