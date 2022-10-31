class OwnHttpException implements Exception {
  final message;

  OwnHttpException({required this.message});
  @override
  String toString() {
    print('ownwxceptions message $message');
    return message;
    // return super.toString(); //Instance of exception
  }
}
//it has always to string method to convert error message