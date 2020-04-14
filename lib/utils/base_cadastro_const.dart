class BaseCadastroConst {
  static const REGISTRO_CADASTRADO = 1;
  static const REGISTRO_ALTERADO = 2;
  static const REGISTRO_DELETADO = 3;

  static const REGISTRO_NAO_DEFINIDO = 0;
  static const REGISTRO_SALVAR = 1;
  static const REGISTRO_ALTERAR = 2;
  static const REGISTRO_DELETAR = 3;
  static const REGISTRO_DELETAR_ALTERAR = 4;
  static const REGISTRO_SALVAR_ALTERAR = 5;
  static const REGISTRO_N_EDITAVEL = 6;

  static bool deletavel(int status) {
    return status == REGISTRO_DELETAR_ALTERAR || status == REGISTRO_DELETAR;
  }

  static bool alteravel(int status) {
    return status == REGISTRO_SALVAR_ALTERAR ||
        status == REGISTRO_DELETAR_ALTERAR ||
        REGISTRO_ALTERAR == status;
  }

  static bool geravel(int status) {
    return status == REGISTRO_SALVAR || status == REGISTRO_SALVAR_ALTERAR;
  }
}
