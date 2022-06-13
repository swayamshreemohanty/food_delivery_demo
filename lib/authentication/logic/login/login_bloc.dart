import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/authentication/logic/authentication/authentication_bloc.dart';
import 'package:food_delivery/authentication/repository/auth_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;

  LoginBloc({required this.authenticationBloc}) : super(LoginInitial()) {
    on<LoginEvent>(
      (event, emit) async {
        final userRepository = AuthenticationRepository();
        if (event is LoginButtonPressed) {
          emit(LoginLoading());
          try {
            await userRepository.authenticate(
                userEmail: event.userEmail,
                password: event.password,
                isLogin: event.isLogin);
            authenticationBloc.add(LoggedIn());
            emit(LoginInitial());
            return;
          } catch (error) {
            if (error is FirebaseException) {
              emit(LoginFailure(
                  rawError: error.message ?? "Something went wrong."));
            } else {
              emit(const LoginFailure(
                  rawError: "Error occured while authenticate"));
            }
          }
        }
      },
    );
  }
}
