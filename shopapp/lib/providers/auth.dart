import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/model/http_exceptions.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  Timer? _authTimer;

  bool get isAuth {
    print('token.isNotEmpty${token.isNotEmpty}');
    return token != '';
  }

  String get userId {
    return _userId!;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token!;
    }
    return '';
  }

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
      //if there is no error
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));

      // print('_token$_token');
      // print('_userId$_userId');

      // print('_expiryDate$_expiryDate');
      autologout();
      notifyListeners();
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

  void logout() {
    _token = '';
    _userId = '';
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
  }

  void autologout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final expirytime = _expiryDate!.difference(DateTime.now()).inSeconds;
    print('expirytime$expirytime'); //expirytime3599
    _authTimer = Timer(Duration(seconds: expirytime), logout);
  }
}
