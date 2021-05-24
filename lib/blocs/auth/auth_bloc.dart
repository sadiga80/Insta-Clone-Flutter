import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:insta_clone_flutter/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<auth.User> _userSubscription;

  AuthBloc({@required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthState.unknown()) {
    _userSubscription = _authRepository.user.listen((user) => add(AuthUserChanged(
        user:
            user))); //listening to user stream to trigger auth user cha nge event
  }

  @override
  Future<void> close() {
    _userSubscription
        ?.cancel(); // ? because if in case subscription is not available for any reason and cancel will crash the app
    return super.close();
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthUserChanged) {
      yield* _mapAuthUserChangedToState(event);
    } else if (event is AuthLogoutRequested) {
      await _authRepository.logout();
    }
  }

  Stream<AuthState> _mapAuthUserChangedToState(AuthUserChanged event) async* {
    yield event.user != null
        ? AuthState.authenticated(user: event.user)
        : AuthState.unauthenticated();
  }
}
