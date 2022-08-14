class CityModel {

  String name;
  double lat;
  double lon;
  String country;
  String state;
  bool selected;

  CityModel({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
    this.selected = false
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'] ?? '',
      lat: json['lat'] ?? 0,
      lon: json['lon'] ?? 0,
      country: json['country'] ?? '',
      state: json['state'] ?? ''
    );
  }
}