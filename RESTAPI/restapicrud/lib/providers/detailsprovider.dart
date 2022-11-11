import 'package:flutter/widgets.dart';
import '../models/Info_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailsProvider with ChangeNotifier {
  List<User> _users = [
    // User(
    //     id: DateTime.now().toString(),
    //     name: 'user.name',
    //     email: 'user.email',
    //     password: 'user.password',
    //     phoneNo: 343434)
  ];

  Future<void> addUser(User user) {
    final newUser = User(
        id: DateTime.now().toString(),
        name: user.name,
        email: user.email,
        password: user.password,
        phoneNo: user.phoneNo);
    // final x = User.toJson(user);
    _users.add(newUser);

    notifyListeners();
    final url = Uri.parse(
        'https://shop-app-4b081-default-rtdb.firebaseio.com/apicrud.json');
    return http
        .post(url,
            body: json.encode({
              'id': user.id,
              'name': user.name,
              'email': user.email,
              'password': user.password,
              'phoneNo': user.phoneNo
            }))
        .then((value) {
      print('object');
      print(json.decode(value.body));
    });

    // print(user);
  }

  Future<void> fetchusers() async {
    final url = Uri.parse(
        'https://shop-app-4b081-default-rtdb.firebaseio.com/apicrud.json');
    try {
      final response = await http.get(url);
      final extractedUserData =
          json.decode(response.body) as Map<String, dynamic>;
      final List<User> usersList = [];
      extractedUserData.forEach((key, value) {
        usersList.add(User.fromJson(value));
      });
      print('object');
      print(usersList);
      _users = usersList;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  List<User> get users {
    return _users;
  }
}
