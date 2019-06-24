import 'dart:async';

class ValidationMixin {

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
        if (email.contains('@')) {
          sink.add(email);
        }
        else {
          sink.addError('Invalid Email');
        }
      }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        if (password.length > 3) {
          sink.add(password);
        }
        else {
          sink.addError('Invalid must be at least 4 characters');
        }
      }
  );
}