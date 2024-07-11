import 'dart:async';

abstract class Exceptions {
  static String errorMessage(dynamic e, {String? server}) {
    if (e is TimeoutException) {
      return 'Looks like the server is taking to long to respond.';
    }
    return e.toString();
  }
}
