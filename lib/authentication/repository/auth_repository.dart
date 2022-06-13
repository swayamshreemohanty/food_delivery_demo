import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  final firebaseAuth = FirebaseAuth.instance;

  Future<String> authenticate({
    String? userName,
    String? phoneNumber,
    required String userEmail,
    required String password,
  }) async {
    try {
      var _body = {
        'email': userEmail,
        'password': password,
      };
      final loginResponse = await firebaseAuth.signInWithEmailAndPassword(
        email: userEmail,
        password: password,
      );
      print('*************');
      print(loginResponse);
      return "";
    } catch (error) {
      rethrow;
    }
  }
}
