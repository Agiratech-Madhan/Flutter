import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/country_model.dart';
import '../model/weather_model.dart';

class DataProvider with ChangeNotifier {
  Weather? data;

  Future<Weather> load(String place) async {
    try {
      final url = Uri.http('api.weatherapi.com', '/v1/current.json',
          {'key': 'fdbfa481ac3c468395d74058220212', 'q': place});
      final response = await http.get(url);
      Weather weatherData = Weather.fromJson(jsonDecode(response.body));
      data = weatherData;
      notifyListeners();
      return data!;
    } catch (e) {
      throw 'Error Occured in loading data';
    }
  }

  Counties? counties;
  Future<Counties> loadCountries() async {
    final response = await http
        .get(Uri.parse('https://countriesnow.space/api/v0.1/countries'));
    final datas = json.decode(response.body);
    Counties data = Counties.fromJson(datas);
    counties = data;
    print(counties);
    notifyListeners();
    return counties!;
  }

  bool visible = false;
  void getVisible(bool value) {
    visible = value;
    notifyListeners();
  }

  bool get visibleValue {
    return visible;
  }

  bool x = false;
  void setBool(bool val) {
    x = val;
    notifyListeners();
  }

  var top;

  String? selectedvalue;
  String getValue(String value) {
    print(value);
    selectedvalue = value;
    return selectedvalue!;
  }

  List images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNDXvbLuF05YyX8Y8GqWyuAeCaxViCLuB_5w&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXN4RESz6ky6pdpHBmrSVeXkOlTJ7d9B3K3Q&usqp=CAU',
    'https://images.unsplash.com/photo-1485236715568-ddc5ee6ca227?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9nfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    'https://images.all-free-download.com/images/graphiclarge/air_atmosphere_background_clear_climate_cloud_598652.jpg',
    'https://images.unsplash.com/photo-1624324378932-68e20f332982?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2xpbWF0ZSUyMGNoYW5nZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://cdn.wallpapersafari.com/43/98/7hfVLN.jpg'
  ];
  String getImage(String image) {
    if (image.toLowerCase().contains('sunny')) {
      return images[1];
    } else if (image.toLowerCase().contains('sunny')) {
      return images[0];
    } else if (image.toLowerCase().contains('fog')) {
      return images[2];
    } else if (image.toLowerCase().contains('cloudy')) {
      return images[3];
    } else if (image.toLowerCase().contains('clear')) {
      return images[4];
    } else {
      return images[5];
    }
  }
}
