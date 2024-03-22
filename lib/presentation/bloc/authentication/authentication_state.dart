part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final bool isAuthenticated;

  const AuthenticationState({this.isAuthenticated = false});

  AuthenticationState copyWith({
    bool? isAuthenticated,
  }) =>
      AuthenticationState(
          isAuthenticated: isAuthenticated ?? this.isAuthenticated);

  @override
  List<Object> get props => [isAuthenticated];
}
