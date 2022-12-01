import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {
  static int count = 0;
  int get countValue {
    return count;
  }

  void increment() {
    count = count + 1;
    notifyListeners();
  }

  void decrement() {
    if (0 <= count) {
      count = 0;
    } else {
      count = count - 1;
    }

    notifyListeners();
  }
}
