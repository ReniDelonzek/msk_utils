// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_select.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemSelect<T> on _ItemSelect<T>, Store {
  late final _$isSelectedAtom =
      Atom(name: '_ItemSelect.isSelected', context: context);

  @override
  bool get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(bool value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  late final _$isDeletedAtom =
      Atom(name: '_ItemSelect.isDeleted', context: context);

  @override
  bool get isDeleted {
    _$isDeletedAtom.reportRead();
    return super.isDeleted;
  }

  @override
  set isDeleted(bool value) {
    _$isDeletedAtom.reportWrite(value, super.isDeleted, () {
      super.isDeleted = value;
    });
  }

  @override
  String toString() {
    return '''
isSelected: ${isSelected},
isDeleted: ${isDeleted}
    ''';
  }
}
