import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/authentication/model/token_model.dart';
import 'package:food_delivery/authentication/shared_preference/token_shared_pref.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUninitialized()) {
    final tokenHandler = TokenSharedPref();

    on<AuthenticationEvent>(
      (event, emit) async {
        if (event is AppStarted) {
          await tokenHandler.hasToken().then((value) async {
            if (value) {
              emit(AuthenticationAuthenticated());
            } else {
              try {
                emit(AuthenticationUnauthenticated());
              } catch (e) {
                emit(AuthenticationUnauthenticated());
              }
            }
          });
        } else if (event is LoggedIn) {
          emit(AuthenticationLoading());
          await tokenHandler
              .storeToken(event.tokenData)
              .then((value) => emit(AuthenticationAuthenticated()));
        } else if (event is LoggedOut) {
          emit(AuthenticationLoading());

          await tokenHandler
              .deleteToken()
              .whenComplete(() => emit(AuthenticationUnauthenticated()));
        } else if (event is AnonymousLogin) {
          emit(AuthenticationLoading());
          emit(AuthenticatedAnonymously());
        }
      },
    );
  }
}
