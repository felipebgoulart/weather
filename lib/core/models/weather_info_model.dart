class WeatherInfoModel {

  int id;
  String main;
  String description;
  String icon;

  WeatherInfoModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon
  });

  factory WeatherInfoModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Data is null');
    }

    return WeatherInfoModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon']
    );
  }
}