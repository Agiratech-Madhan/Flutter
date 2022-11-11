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
    _users.add(user);

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

  // Future<void> fetchAndSetProduct() async {
  //   final url = Uri.parse(
  //       'https://shop-app-4b081-default-rtdb.firebaseio.com/apicrud.json');
  //   try {
  //     final response = await http.get(url);
  //     String extractdata = json.decode(response.body) ;
  //     print(json.decode(response.body)); //instance of respone
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  List<User> get users {
    return _users;
  }
}
/** void addProduct(Product product_) {
    final newProduct = Product(
        id: DateTime.now().toString(),
        title: product_.title,
        description: product_.description,
        price: product_.price,
        imageUrl: product_.imageUrl);
    _items.add(newProduct);
    //_items.insert(0,newProduct);
    ChangeNotifier();
  } */