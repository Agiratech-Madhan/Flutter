import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather/model/country_model.dart';
import 'package:weather/model/weather_model.dart';

class DataProvider with ChangeNotifier {
  Weather? Data;
  Future<Weather> load(String place) async {
    try {
      final url = Uri.http('api.weatherapi.com', '/v1/current.json',
          {'key': 'fdbfa481ac3c468395d74058220212', 'q': place});
      final response = await http.get(url);
      print(response.statusCode);
      print(jsonEncode(response.body));
      Weather data = Weather.fromJson(jsonDecode(response.body));
      Data = data;
      print(data.countryName);
      notifyListeners();
      return Data!;
    } catch (e) {
      throw 'Error Occured in loading data';
    }
  }

  Counties? counties;
  Future<Counties> loadCountries() async {
    // try {
    final response = await http
        .get(Uri.parse('https://countriesnow.space/api/v0.1/countries'));
    final datas = json.decode(response.body);
    Counties data = Counties.fromJson(datas);
    counties = data;
    print(data);
    notifyListeners();
    return counties!;
    // } catch (e) {
    //   throw 'Error Occured in loading data';
    // }
  }
}
