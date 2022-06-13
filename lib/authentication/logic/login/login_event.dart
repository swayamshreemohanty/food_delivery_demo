part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String userEmail;
  final String password;

  const LoginButtonPressed({
    required this.userEmail,
    required this.password,
  });

  @override
  List<Object> get props => [userEmail, password];

  @override
  String toString() =>
      'LoginButtonPressed { username: $userEmail, password: $password }';
}
