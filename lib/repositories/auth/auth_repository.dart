import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';
import 'package:insta_clone_flutter/config/paths.dart';
import 'package:insta_clone_flutter/models/models.dart';
import 'package:insta_clone_flutter/repositories/repositories.dart';
import 'package:meta/meta.dart';

class AuthRepository extends BaseAuthRepository {
  //Adding dependencies
  final FirebaseFirestore _firebaseFirestore;
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository(
      {FirebaseFirestore firebaseFirestore, auth.FirebaseAuth firebaseAuth})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ??
            auth.FirebaseAuth
                .instance; //after : assigning parameters to passed params

  @override
  Stream<auth.User> get user => _firebaseAuth
      .userChanges(); //this functions notifies about the user updates

  @override
  Future<auth.User> signUpWithEmailAndPassword({
    @required String username,
    @required String email,
    @required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credentials.user;
      _firebaseFirestore.collection(Paths.users).doc(user.uid).set({
        //create user in firestore
        'username': username,
        'email': email,
        'followers': 0,
        'following': 0,
      });
      return user;
    } on auth.FirebaseAuthException catch (err) {
      throw Failure(code: err.code, message: err.message);
    } on PlatformException catch (err) {
      throw Failure(code: err.code, message: err.message);
    }
  }

  @override
  Future<auth.User> loginWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credentials.user;
    } on auth.FirebaseAuthException catch (err) {
      throw Failure(code: err.code, message: err.message);
    } on PlatformException catch (err) {
      throw Failure(code: err.code, message: err.message);
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut(); //logout from firebase
  }
}
