// ignore_for_file: prefer_typing_uninitialized_variables

class AppExceptions implements Exception {
  final _massage;
  final _prefix;
  AppExceptions([this._massage, this._prefix]);
  @override
  String toString() {
    return '$_prefix$_massage';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error during communition');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
      : super(message, 'Unauthorised request');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}
