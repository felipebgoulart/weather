class ForecastItemModel {

  String title;
  String humidity;
  String temp;
  String iconPath;
  bool selected;

  ForecastItemModel({
    required this.title,
    required this.humidity,
    required this.temp,
    required this.iconPath,
    required this.selected
  });
}