import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restapicrud/models/custom_exception.dart';
import '../models/info_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailsProvider with ChangeNotifier {
  List<User> users = [];
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
      throw CustomException(message: 'Failed to load User');
    }
  }

  User findById(String id) {
    return users.firstWhere((element) => element.id == id);
  }

  Future<void> createAndUpdate(String id, User user, bool isAdd) async {
    String actionId = isAdd ? '' : '/$id';
    const uri = 'https://shop-app-4b081-default-rtdb.firebaseio.com/apicrud';
    final url = Uri.parse('$uri$actionId.json');
    final methods = isAdd ? http.post : http.patch;
    final userIndex = users.indexWhere((element) => element.id == id);
    var x = json.encode(user.toJson());
    try {
      final value = await methods(url, body: x);
      final newUser = User(
          id: json.decode(value.body)['name'],
          name: user.name,
          email: user.email,
          password: user.password,
          phoneNo: user.phoneNo);
      isAdd ? users.add(newUser) : users[userIndex] = user;
      notifyListeners();
    } catch (e) {
      throw CustomException(
          message: 'Faild to ${isAdd ? 'Create' : 'Update'}  User');
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      final url = Uri.parse(
          'https://shop-app-4b081-default-rtdb.firebaseio.com/apicrud/$id.json');
      final exisUser = users.indexWhere((element) => element.id == id);
      await http.delete(url);

      users.removeAt(exisUser);
      notifyListeners();
    } catch (e) {
      throw CustomException(message: 'Failed to delete User');
    }
  }
}
