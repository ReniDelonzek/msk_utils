import 'package:mobx/mobx.dart';

part 'item_select.g.dart';

class ItemSelect<T> extends _ItemSelect with _$ItemSelect {
  ItemSelect(
      {int? id,
      T? object,
      Map<String, dynamic>? strings,
      bool isSelected = false,
      bool deletado = false})
      : super(
            id: id,
            deletado: deletado,
            object: object,
            strings: strings,
            isSelected: isSelected);

  //Utilitário para crud
  /// Indica se o registro deve ser salvo ou não
  bool save() {
    return deletado != true || (id != 0 && id != null);
  }
}

abstract class _ItemSelect<T> with Store {
  _ItemSelect(
      {this.id,
      this.object,
      this.strings,
      this.isSelected = false,
      this.deletado = false}) {
    if (strings == null) {
      strings = Map<String, dynamic>();
    }
  }

  int? id;
  T? object;
  Map<String, dynamic>? strings = Map();

  @observable
  bool isSelected;
  @observable
  bool deletado = false;
}
