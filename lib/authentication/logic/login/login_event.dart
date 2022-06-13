part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String userEmail;
  final String password;
  final bool isLogin;

  const LoginButtonPressed({
    required this.userEmail,
    required this.password,
    required this.isLogin,
  });

  @override
  List<Object> get props => [userEmail, password, isLogin];

  @override
  String toString() =>
      'LoginButtonPressed { username: $userEmail, password: $password }';
}
