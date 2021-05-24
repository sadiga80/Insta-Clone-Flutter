part of 'login_cubit.dart';

enum LoginStatus {
  initial, //empty status of login screen (email and password fields are empty)
  submitting, //when user submits their login (as user loggin in we make sure to disable the login button)
  success,
  error
}

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;
  final Failure failure;

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  const LoginState(
      {@required this.email,
      @required this.password,
      @required this.status,
      @required this.failure});

  factory LoginState.intial() //factory constructor for login state
  {
    return LoginState(
        email: '',
        password: '',
        status: LoginStatus.initial,
        failure: const Failure());
  }

  @override
  List<Object> get props => [email, password, status, failure];

  @override
  bool get stringify => true;

  LoginState copyWith({
    //allow us to modify the state still maintaining parts we don't want to modify
    String email,
    String password,
    LoginStatus status,
    Failure failure,
  }) {
    return new LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
