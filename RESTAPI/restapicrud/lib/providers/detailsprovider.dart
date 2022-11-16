import 'package:flutter/widgets.dart';
import '../models/Info_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailsProvider with ChangeNotifier {
  List<User> users = [
    // User(
    //     id: DateTime.now().toString(),
    //     name: 'user.name',
    //     email: 'user.email',
    //     password: 'user.password',
    //     phoneNo: 343434)
  ];

  Future<void> addUser(User user) async {
    final url = Uri.parse(
        'https://shop-app-4b081-default-rtdb.firebaseio.com/apicrud.json');
    try {
      final value = http
          .post(url,
              body: json.encode({
                'name': user.name,
                'email': user.email,
                'password': user.password,
                'phoneNo': user.phoneNo
              }))
          .then((value) {
        print('object');
        print('${json.decode(value.body)['name']}');
        final newUser = User(
            id: json.decode(value.body)['name'],
            name: user.name,
            email: user.email,
            password: user.password,
            phoneNo: user.phoneNo);
        users.add(newUser);
        print('users${users[0].id}');
        notifyListeners();
      });
    } catch (e) {
      rethrow;
    }
    // print(user);
  }

  Future<void> fetchusers() async {
    final url = Uri.parse(
        'https://shop-app-4b081-default-rtdb.firebaseio.com/apicrud.json');
    try {
      final response = await http.get(url);
      print('response${response.contentLength}');
      print('response headers${response.headers}');
      print('response is redirect ${response.isRedirect}');
      print('response persistentConnection${response.persistentConnection}');
      print('response request${response.request}');
      print('response statusCode${response.statusCode}');
      print('response body${response.body}');

      final extractedUserData =
          json.decode(response.body) as Map<String, dynamic>;
      final List<User> usersList = [];
      extractedUserData.forEach((key, value) {
        print('values$value');
        usersList.add(User(
                id: key,
                name: value['name'],
                email: value['email'],
                password: value['password'],
                phoneNo: value['phoneNo'])

            // User.fromJson(value)

            );
      });
      print('object');
      users = usersList;

      notifyListeners();
      print(users[0].id);
    } catch (e) {
      rethrow;
    }
  }

  User findById(String id) {
    return users.firstWhere((element) => element.id == id);
  }

  Future<void> updateUser(String id, User newUser) async {
    final userIndex = users.indexWhere((element) => element.id == id);
    print(id);
    print('update index$userIndex');
    print('userIndex\$${newUser.name}');
    print('userIndex$userIndex');
    print('userIndex$userIndex');
    print('userIndex$userIndex');
    if (userIndex >= 0) {
      print('data matched');
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
          .then((value) {
        print(value);
      });
      print('old data email${users[userIndex].email}');
      print(' new mail data${newUser.email}');

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
    final response = await http.delete(url);
  }
}/**Future<void> updateProduct(String id, Product newProduct) async {
    final profIndex = items_.indexWhere((element) => element.id == id);
    if (profIndex >= 0) {
      final url = Uri.parse(
          'https://shop-app-4b081-default-rtdb.firebaseio.com/products/$id.json?auth=$authtoken');
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price
          }));
      items_[profIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  } */
