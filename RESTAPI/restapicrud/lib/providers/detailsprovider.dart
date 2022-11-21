import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/Info_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailsProvider with ChangeNotifier {
  List<User> users = [];
  Future<void> addUser(User user) async {
    final url = Uri.parse(
        'https://shop-app-4b081-default-rtdb.firebaseio.com/apicrud.json');
    try {
      await http
          .post(url,
              body: json.encode({
                'name': user.name,
                'email': user.email,
                'password': user.password,
                'phoneNo': user.phoneNo
              }))
          .then((value) {
        final newUser = User(
            id: json.decode(value.body)['name'],
            name: user.name,
            email: user.email,
            password: user.password,
            phoneNo: user.phoneNo);
        users.add(newUser);
        notifyListeners();
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<User>> fetchusers() async {
    final url = Uri.parse(
        'https://shop-app-4b081-default-rtdb.firebaseio.com/apicrud.json');
    try {
      {
        final response = await http.get(url);
        final extractedUserData =
            json.decode(response.body) as Map<String, dynamic>;
        final List<User> usersList = [];
        extractedUserData.forEach((key, value) {
          usersList.add(User(
              id: key,
              name: value['name'],
              email: value['email'],
              password: value['password'],
              phoneNo: value['phoneNo']));
        });
        users = usersList;
        notifyListeners();
        return users;
      }
    } catch (e) {
      rethrow;
    }
  }

  User findById(String id) {
    return users.firstWhere((element) => element.id == id);
  }

  Future<void> updateUser(String id, User newUser) async {
    final userIndex = users.indexWhere((element) => element.id == id);
    if (userIndex >= 0) {
      final url = Uri.parse(
          'https://shop-app-4b081-default-rtdb.firebaseio.com/apicrud/$id.json');
      await http
          .patch(url,
              body: json.encode({
                'name': newUser.name,
                'email': newUser.email,
                'password': newUser.password,
                'phoneNo': newUser.phoneNo
              }))
          .then((value) {});

      users[userIndex] = newUser;

      notifyListeners();
    }
  }

  Future<void> deleteUser(String id) async {
    final url = Uri.parse(
        'https://shop-app-4b081-default-rtdb.firebaseio.com/apicrud/$id.json');
    final exisUser = users.indexWhere((element) => element.id == id);
    users.removeAt(exisUser);
    notifyListeners();
    await http.delete(url);
  }
}
