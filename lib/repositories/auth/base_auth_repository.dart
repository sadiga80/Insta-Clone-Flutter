//abstract class which will hold method def for auth repository
import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class BaseAuthRepository {
  Stream<auth.User>
      get user; //user getter is a listener which constantly listening to current state of firebase authentication (logged in : new firebase user / logged out: no firebase user)
  Future<auth.User> signUpWithEmailAndPassword({
    String username,
    String email,
    String password,
  });
  Future<auth.User> loginWithEmailAndPassword({
    String email,
    String password,
  });
  Future<void> logout();
}
