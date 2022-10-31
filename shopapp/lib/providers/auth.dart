import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/model/http_exceptions.dart';

class Auth with ChangeNotifier {
  String? token;
  DateTime? expiryDate;
  String? userId;

  Future<void> _authenticate(
      String email, String password, String urlType) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlType?key=AIzaSyDAe1tMdsePO-e0taOl2_eGf5bIyTjiNYY');

    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        print(responseData['error']['message']);
        throw OwnHttpException(message: responseData['error']['message']);
      }
    } catch (e) {
      rethrow;
    }
    // print(json.decode(response.body));
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
