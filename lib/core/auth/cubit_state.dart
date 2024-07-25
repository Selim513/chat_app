class AuthState {}

class AuthinitState extends AuthState {}

class LoginSuccessState extends AuthState {
  final String SuccessMessage;

  LoginSuccessState({required this.SuccessMessage});
}

class LoginErrorState extends AuthState {
  final String ErrorMessage;

  LoginErrorState({required this.ErrorMessage});
}

class LoginLoadingState extends AuthState {}

///--------------------------Register--------------------
class RegisterSuccessState extends AuthState {
  final String SuccessMessage;

  RegisterSuccessState({required this.SuccessMessage});
}

class RegisterErrorState extends AuthState {
  final String ErrorMessage;

  RegisterErrorState({required this.ErrorMessage});
}

class RegisterLoadingState extends AuthState {}
