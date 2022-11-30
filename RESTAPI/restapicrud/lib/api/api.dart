class Api {
  static const uri =
      'https://shop-app-4b081-default-rtdb.firebaseio.com/apicrud';
  static const endPoint = '.json';
  String get uriFetch {
    return uri;
  }

  String fetch() {
    return uri + endPoint;
  }

  String addAndUpdate({String? id, bool? isAdd}) {
    String? ids = (isAdd!) ? '' : '/$id';
    return uri + ids + endPoint;
  }

  String delete({String? id}) {
    return '$uri' '/$id' '$endPoint';
  }
}
