import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {
  static int count = 0;
  int get countValue {
    return count;
  }

  int increment() {
    count = count + 1;
    notifyListeners();

    return count;
  }

  int decrement() {
    count = count - 1;
    notifyListeners();
    return count;
  }
}
