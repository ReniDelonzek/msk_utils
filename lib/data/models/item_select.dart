import 'package:mobx/mobx.dart';

part 'item_select.g.dart';

class ItemSelect<T> extends _ItemSelect with _$ItemSelect {
  ItemSelect(
      {int? id,
      T? object,
      Map<String, dynamic> strings = const {},
      bool isSelected = false,
      bool isDeleted = false})
      : super(
            id: id,
            isDeleted: isDeleted,
            object: object,
            strings: strings,
            isSelected: isSelected);

  /// Utilitário para crud
  /// Indica se o registro deve ser salvo ou nã
  bool save() {
    return isDeleted != true || (id != 0 && id != null);
  }
}

abstract class _ItemSelect<T> with Store {
  _ItemSelect(
      {this.id,
      this.object,
      this.strings = const {},
      this.isSelected = false,
      this.isDeleted = false});

  int? id;
  T? object;
  Map<String, dynamic> strings;

  @observable
  bool isSelected;
  @observable
  bool isDeleted = false;
}
