// ignore_for_file: public_member_api_docs, sort_constructors_first

class Weather {
  final String countryName;
  final int num;
  final double temperature;
  Weather({
    required this.countryName,
    required this.num,
    required this.temperature,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        countryName: json['location']['name'],
        num: json['location']['localtime_epoch'],
        temperature: json['current']['temp_c']);
  }
}
