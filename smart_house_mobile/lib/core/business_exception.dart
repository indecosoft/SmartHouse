class BusinessException implements Exception {
  /// A message describing the error.
  final String? message;
  final Object? cause;

  BusinessException({this.message, this.cause});

  @override
  String toString() {
    if (cause != null) return cause.toString();
    Object? message = this.message;
    if (message == null) return runtimeType.toString();
    return '$runtimeType: $message';
  }
}

class InternetConnectionException extends BusinessException {
  InternetConnectionException({required super.cause})
      : super(
          message: 'Network error',
        );
}

class ApiNotFoundException extends BusinessException {
  ApiNotFoundException({required super.cause})
      : super(
          message: 'Api Not Found',
        );
}

class InternalServerException extends BusinessException {
  InternalServerException({required int statusCode, required super.cause})
      : super(
          message: 'Internal Server Error: $statusCode',
        );
}

class ClientRequestException extends BusinessException {
  ClientRequestException({required int statusCode, required super.cause})
      : super(
          message: 'Client request error: $statusCode',
        );
}

class NoDataException extends BusinessException {
  NoDataException({super.cause})
      : super(
          message: 'No data exception',
        );
}

class AuthorizationException extends BusinessException {
  AuthorizationException({super.cause})
      : super(
          message: 'Unauthorized',
        );
}

class ParseException extends BusinessException {
  ParseException({super.cause})
      : super(
          message: 'Parse exception',
        );
}

class LocationServiceException extends BusinessException {
  LocationServiceException({super.cause})
      : super(
          message: 'Location service exception',
        );
}

class LocationPermissionException extends BusinessException {
  LocationPermissionException({super.cause})
      : super(
          message: 'Location permissions exception',
        );
}

class FailedToRetrieveLocationException extends BusinessException {
  FailedToRetrieveLocationException({super.cause})
      : super(
          message: 'Location retrieving exception',
        );
}

class UnknownException extends BusinessException {
  UnknownException({super.cause}) : super();
}
