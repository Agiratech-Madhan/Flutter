// ignore_for_file: public_member_api_docs, sort_constructors_first

class Weather {
  final String countryName;
  final String num;
  final double temperature;
  final String condition;
  Weather({
    required this.countryName,
    required this.num,
    required this.temperature,
    required this.condition,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        countryName: json['location']['name'],
        num: json['location']['localtime'],
        temperature: json['current']['temp_c'],
        condition: json['current']['condition']['text']);
  }
}
