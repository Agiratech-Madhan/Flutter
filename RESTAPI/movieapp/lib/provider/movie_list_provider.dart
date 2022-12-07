import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieListProvider with ChangeNotifier {
  Movies? movies;

  Future<Movies> load() async {
    try {
      final url = Uri.http('api.themoviedb.org', '/3/list/234',
          {'api_key': 'b6ee00729c9ca9a458e3625f96877b1a'});
      final response = await http.get(url);
      print(response.statusCode);
      // final responseData=json.decode(source)
      Movies moviesData = Movies.fromJson(jsonDecode(response.body));
      movies = moviesData;
      // print(movies?.item[0]);
      notifyListeners();
      return movies!;
    } catch (e) {
      throw 'error Occured';
    }
  }
}
