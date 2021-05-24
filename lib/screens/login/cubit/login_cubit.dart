import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:insta_clone_flutter/models/models.dart';
import 'package:insta_clone_flutter/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  //cubit is used when there are just forms or very simple screens where there's no much of tracking events

  final AuthRepository _authRepository;
  LoginCubit({@required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(
            LoginState.intial()); //set auth repo equal to passed down auth repo

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  void loginWithCredentials() async {
    if (!state.isFormValid || state.status == LoginStatus.submitting)
      return; //to prevent rest of functions execution when status is submitting
    emit(state.copyWith(
        status: LoginStatus.submitting)); //user is currently logging in
    try {
      await _authRepository.loginWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(
          status: LoginStatus.success)); //emit is like yield in bloc
    } on Failure catch (err) {
      emit(state.copyWith(failure: err, status: LoginStatus.error));
    }
  }
}
