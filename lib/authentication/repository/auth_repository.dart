import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> authenticate({
    required String userEmail,
    required String password,
    required bool isLogin,
  }) async {
    try {
      //Log in the user
      if (isLogin) {
        await firebaseAuth.signInWithEmailAndPassword(
          email: userEmail,
          password: password,
        );
      }

      //SignUp/Register the user
      else {
        await firebaseAuth.createUserWithEmailAndPassword(
          email: userEmail,
          password: password,
        );
      }
      return;
    } catch (error) {
      rethrow;
    }
  }
}
