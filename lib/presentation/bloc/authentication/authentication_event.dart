part of 'authentication_bloc.dart';

class AuthenticationEvent {
  const AuthenticationEvent();
}

class LoginUser extends AuthenticationEvent {
  final bool value;
  LoginUser(this.value);
}
