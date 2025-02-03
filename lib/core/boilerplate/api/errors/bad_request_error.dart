import 'http_error.dart';

class BadRequestError extends HttpError {
  @override
  String? message = 'bad_request_error';

  BadRequestError();
}
