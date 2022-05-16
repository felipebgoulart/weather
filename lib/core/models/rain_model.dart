class RainModel {

  num hour;

  RainModel({
    required this.hour
  });

  factory RainModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Data is null');
    }

    return RainModel(
      hour: json['1h']
    );
  }
}