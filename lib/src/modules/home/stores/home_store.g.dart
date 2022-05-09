// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$draggableScrollableControllerAtom = Atom(
      name: '_HomeStoreBase.draggableScrollableController', context: context);

  @override
  DraggableScrollableController get draggableScrollableController {
    _$draggableScrollableControllerAtom.reportRead();
    return super.draggableScrollableController;
  }

  @override
  set draggableScrollableController(DraggableScrollableController value) {
    _$draggableScrollableControllerAtom
        .reportWrite(value, super.draggableScrollableController, () {
      super.draggableScrollableController = value;
    });
  }

  late final _$isOpenAtom =
      Atom(name: '_HomeStoreBase.isOpen', context: context);

  @override
  bool get isOpen {
    _$isOpenAtom.reportRead();
    return super.isOpen;
  }

  @override
  set isOpen(bool value) {
    _$isOpenAtom.reportWrite(value, super.isOpen, () {
      super.isOpen = value;
    });
  }

  late final _$selectedTabAtom =
      Atom(name: '_HomeStoreBase.selectedTab', context: context);

  @override
  int get selectedTab {
    _$selectedTabAtom.reportRead();
    return super.selectedTab;
  }

  @override
  set selectedTab(int value) {
    _$selectedTabAtom.reportWrite(value, super.selectedTab, () {
      super.selectedTab = value;
    });
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  void toggleSheetVisibility() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.toggleSheetVisibility');
    try {
      return super.toggleSheetVisibility();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeAnimate() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.closeAnimate');
    try {
      return super.closeAnimate();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTab(int tab) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.changeTab');
    try {
      return super.changeTab(tab);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
draggableScrollableController: ${draggableScrollableController},
isOpen: ${isOpen},
selectedTab: ${selectedTab}
    ''';
  }
}
