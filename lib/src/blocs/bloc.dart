import 'dart:async';
import '../mixins/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with ValidationMixin {

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  submit() {

  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}