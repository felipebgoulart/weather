class FeelsLikeModel {

  num day;
  num night;
  num eve;
  num morn;

  FeelsLikeModel({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn
  });

  factory FeelsLikeModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Data is null');
    }

    return FeelsLikeModel(
      day: json['day'],
      night: json['night'],
      eve: json['eve'],
      morn: json['morn']
    );
  }
}