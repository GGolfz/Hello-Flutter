class HttpException implements Exception {
  final String meesage;
  HttpException(this.meesage);
  @override
  String toString() {
    return this.meesage;
  }
}
