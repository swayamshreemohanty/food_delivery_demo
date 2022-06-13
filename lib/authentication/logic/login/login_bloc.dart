import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/authentication/logic/authentication/authentication_bloc.dart';
import 'package:food_delivery/authentication/model/token_model.dart';
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
            final response = await userRepository.authenticate(
              userEmail: event.userEmail,
              password: event.password,
            );

            authenticationBloc.add(
              LoggedIn(tokenData: TokenData(token: response)),
            );
            emit(LoginInitial());
            return;
          } catch (error) {
            emit(
              const LoginFailure(rawError: "Error occured while authenticate"),
            );
          }
        }
      },
    );
  }


}
