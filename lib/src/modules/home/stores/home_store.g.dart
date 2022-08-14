// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$backgroundImageAtom =
      Atom(name: 'HomeStoreBase.backgroundImage', context: context);

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
      Atom(name: 'HomeStoreBase.backgroundFigure', context: context);

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
      Atom(name: 'HomeStoreBase.isLoading', context: context);

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

  late final _$selectedAtom =
      Atom(name: 'HomeStoreBase.selected', context: context);

  @override
  int? get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(int? value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$weatherAtom =
      Atom(name: 'HomeStoreBase.weather', context: context);

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
      Atom(name: 'HomeStoreBase.currentWeather', context: context);

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

  late final _$dailyListAtom =
      Atom(name: 'HomeStoreBase.dailyList', context: context);

  @override
  List<ForecastModel> get dailyList {
    _$dailyListAtom.reportRead();
    return super.dailyList;
  }

  @override
  set dailyList(List<ForecastModel> value) {
    _$dailyListAtom.reportWrite(value, super.dailyList, () {
      super.dailyList = value;
    });
  }

  late final _$hourlyListAtom =
      Atom(name: 'HomeStoreBase.hourlyList', context: context);

  @override
  List<ForecastModel> get hourlyList {
    _$hourlyListAtom.reportRead();
    return super.hourlyList;
  }

  @override
  set hourlyList(List<ForecastModel> value) {
    _$hourlyListAtom.reportWrite(value, super.hourlyList, () {
      super.hourlyList = value;
    });
  }

  late final _$forecastListAtom =
      Atom(name: 'HomeStoreBase.forecastList', context: context);

  @override
  ObservableList<ForecastItemModel> get forecastList {
    _$forecastListAtom.reportRead();
    return super.forecastList;
  }

  @override
  set forecastList(ObservableList<ForecastItemModel> value) {
    _$forecastListAtom.reportWrite(value, super.forecastList, () {
      super.forecastList = value;
    });
  }

  late final _$cityNameAtom =
      Atom(name: 'HomeStoreBase.cityName', context: context);

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
      name: 'HomeStoreBase.draggableScrollableController', context: context);

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
      name: 'HomeStoreBase.forecastHorizontalScrollController',
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

  late final _$scrollControllerAtom =
      Atom(name: 'HomeStoreBase.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  late final _$isOpenAtom =
      Atom(name: 'HomeStoreBase.isOpen', context: context);

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
      Atom(name: 'HomeStoreBase.selectedTab', context: context);

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

  late final _$forecastAtom =
      Atom(name: 'HomeStoreBase.forecast', context: context);

  @override
  ForecastModel? get forecast {
    _$forecastAtom.reportRead();
    return super.forecast;
  }

  @override
  set forecast(ForecastModel? value) {
    _$forecastAtom.reportWrite(value, super.forecast, () {
      super.forecast = value;
    });
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void toggleSheetVisibility() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.toggleSheetVisibility');
    try {
      return super.toggleSheetVisibility();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void buildForecast(int index, {bool current = false}) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.buildForecast');
    try {
      return super.buildForecast(index, current: current);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeAnimate() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.closeAnimate');
    try {
      return super.closeAnimate();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTab(int tab) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeTab');
    try {
      return super.changeTab(tab);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBackgroundimage() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeBackgroundimage');
    try {
      return super.changeBackgroundimage();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
backgroundImage: ${backgroundImage},
backgroundFigure: ${backgroundFigure},
isLoading: ${isLoading},
selected: ${selected},
weather: ${weather},
currentWeather: ${currentWeather},
dailyList: ${dailyList},
hourlyList: ${hourlyList},
forecastList: ${forecastList},
cityName: ${cityName},
draggableScrollableController: ${draggableScrollableController},
forecastHorizontalScrollController: ${forecastHorizontalScrollController},
scrollController: ${scrollController},
isOpen: ${isOpen},
selectedTab: ${selectedTab},
forecast: ${forecast}
    ''';
  }
}
