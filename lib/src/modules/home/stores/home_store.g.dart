// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$backgroundImageAtom =
      Atom(name: '_HomeStoreBase.backgroundImage', context: context);

  @override
  String get backgroundImage {
    _$backgroundImageAtom.reportRead();
    return super.backgroundImage;
  }

  @override
  set backgroundImage(String value) {
    _$backgroundImageAtom.reportWrite(value, super.backgroundImage, () {
      super.backgroundImage = value;
    });
  }

  late final _$backgroundFigureAtom =
      Atom(name: '_HomeStoreBase.backgroundFigure', context: context);

  @override
  String get backgroundFigure {
    _$backgroundFigureAtom.reportRead();
    return super.backgroundFigure;
  }

  @override
  set backgroundFigure(String value) {
    _$backgroundFigureAtom.reportWrite(value, super.backgroundFigure, () {
      super.backgroundFigure = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$weatherAtom =
      Atom(name: '_HomeStoreBase.weather', context: context);

  @override
  LocationWeatherModel? get weather {
    _$weatherAtom.reportRead();
    return super.weather;
  }

  @override
  set weather(LocationWeatherModel? value) {
    _$weatherAtom.reportWrite(value, super.weather, () {
      super.weather = value;
    });
  }

  late final _$currentWeatherAtom =
      Atom(name: '_HomeStoreBase.currentWeather', context: context);

  @override
  CurrentWeatherModel? get currentWeather {
    _$currentWeatherAtom.reportRead();
    return super.currentWeather;
  }

  @override
  set currentWeather(CurrentWeatherModel? value) {
    _$currentWeatherAtom.reportWrite(value, super.currentWeather, () {
      super.currentWeather = value;
    });
  }

  late final _$cityNameAtom =
      Atom(name: '_HomeStoreBase.cityName', context: context);

  @override
  String? get cityName {
    _$cityNameAtom.reportRead();
    return super.cityName;
  }

  @override
  set cityName(String? value) {
    _$cityNameAtom.reportWrite(value, super.cityName, () {
      super.cityName = value;
    });
  }

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

  late final _$forecastHorizontalScrollControllerAtom = Atom(
      name: '_HomeStoreBase.forecastHorizontalScrollController',
      context: context);

  @override
  ScrollController get forecastHorizontalScrollController {
    _$forecastHorizontalScrollControllerAtom.reportRead();
    return super.forecastHorizontalScrollController;
  }

  @override
  set forecastHorizontalScrollController(ScrollController value) {
    _$forecastHorizontalScrollControllerAtom
        .reportWrite(value, super.forecastHorizontalScrollController, () {
      super.forecastHorizontalScrollController = value;
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
  void changeBackgroundimage() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.changeBackgroundimage');
    try {
      return super.changeBackgroundimage();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
backgroundImage: ${backgroundImage},
backgroundFigure: ${backgroundFigure},
isLoading: ${isLoading},
weather: ${weather},
currentWeather: ${currentWeather},
cityName: ${cityName},
draggableScrollableController: ${draggableScrollableController},
forecastHorizontalScrollController: ${forecastHorizontalScrollController},
isOpen: ${isOpen},
selectedTab: ${selectedTab}
    ''';
  }
}
