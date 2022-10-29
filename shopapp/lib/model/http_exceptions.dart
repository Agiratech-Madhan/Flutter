class OwnHttpException implements Exception {
  final message;

  OwnHttpException(this.message);
  @override
  String toString() {
    // TODO: implement toString

    return message;
    // return super.toString(); //Instance of exception
  }
}
//it has always to string method to convert error message 