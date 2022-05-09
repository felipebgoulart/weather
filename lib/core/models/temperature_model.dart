class TemperatureModel {

  num day;
  num min;
  num max;
  num night;
  num eve;
  num morn;

  TemperatureModel({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn
  });

  factory TemperatureModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Data is null');
    }

    return TemperatureModel(
      day: json['day'],
      min: json['min'],
      max: json['max'],
      night: json['night'],
      eve: json['eve'],
      morn: json['morn']
    );
  }
}