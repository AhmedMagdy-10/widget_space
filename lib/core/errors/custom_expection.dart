class CustomExpection implements Exception {
  final String message;

  CustomExpection({required this.message});

  @override
  String toString() {
    return message;
  }
}
