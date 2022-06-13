import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/utility/firebase_current_user_data.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUninitialized()) {
    on<AuthenticationEvent>(
      (event, emit) async {
        if (event is AppStarted) {
          final currentUser = FirebaseCurrentUserData().userDetails;
          if (currentUser != null) {
            emit(AuthenticationAuthenticated());
          } else {
            emit(AuthenticationUnauthenticated());
          }
        } else if (event is LoggedIn) {
          emit(AuthenticationLoading());
          emit(AuthenticationAuthenticated());
        } else if (event is LoggedOut) {
          emit(AuthenticationLoading());
          FirebaseAuth.instance.signOut();
          emit(AuthenticationUnauthenticated());
        } else if (event is AnonymousLogin) {
          emit(AuthenticationLoading());
          emit(AuthenticatedAnonymously());
        }
      },
    );
  }
}
