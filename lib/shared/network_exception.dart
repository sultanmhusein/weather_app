class NetworkException implements Exception {
  int? httpStatus;
  String? responseCode;
  String? responseMessage;

  NetworkException(
      {this.httpStatus = 500,
      this.responseCode = '',
      this.responseMessage = 'Error NetworkException'});

  @override
  String toString() {
    return '{ httpStatus: $httpStatus, responseCode: $responseCode, responseMessage: $responseMessage }';
  }
}
