import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieListProvider with ChangeNotifier {
  Movies? moviesSearch;
  Movies? movies;

  Future<Movies> loadData(String value) async {
    String searchValue = (value == '') ? '' : value;
    String params = (value == '') ? '/3/trending/movie/day' : '/3/search/movie';
    try {
      final url = Uri.http('api.themoviedb.org', params, {
        'api_key': 'b6ee00729c9ca9a458e3625f96877b1a',
        'query': searchValue
      });
      final response = await http.get(url);
      Movies moviesData = Movies.fromJson(jsonDecode(response.body));
      if (value == '') moviesSearch = moviesData;
      movies = moviesData;
      notifyListeners();
      return movies!;
    } catch (e) {
      throw 'error Occured';
    }
  }
}
