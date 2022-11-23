class CustomException implements Exception {
  String? message;

  CustomException({required this.message});
  @override
  String toString() {
    print('custom exception called');
    return message!;
  }
}
