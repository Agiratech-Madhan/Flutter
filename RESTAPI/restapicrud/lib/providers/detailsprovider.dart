import 'package:flutter/widgets.dart';
import 'package:restapicrud/models/Info_model.dart';

class DetailsProvider with ChangeNotifier {
  List<User> _users = [
    User(
        id: DateTime.now().toString(),
        name: 'user.name',
        email: 'user.email',
        password: 'user.password',
        phoneNo: 343434)
  ];
  void addUser(User user) {
    final newUser = User(
        id: DateTime.now().toString(),
        name: user.name,
        email: user.email,
        password: user.password,
        phoneNo: user.phoneNo);
    _users.add(user);
    notifyListeners();
    print(user);
  }

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