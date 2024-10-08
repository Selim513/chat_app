import 'package:chat_app/core/auth_bloc/auth_events.dart';
import 'package:chat_app/core/auth_bloc/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthBloc() : super(AuthinitState()) {
    on<AuthEvents>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoadingState());
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(LoginSuccessState(SuccessMessage: 'SuccessFull Login'));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginErrorState(ErrorMessage: 'The user is not exist.'));
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            emit(LoginErrorState(ErrorMessage: 'The password is incorrect.'));

            print('Wrong password provided for that user.');
          } else {}
        }
      } else if (event is RegisterEvent) {
        emit(RegisterLoadingState());
        try {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          emit(RegisterSuccessState(SuccessMessage: 'Successfully Register'));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(RegisterErrorState(
                ErrorMessage: 'The password provided is too weak.'));
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            emit(RegisterErrorState(
                ErrorMessage: 'he account already exists for that email'));
            print('The account already exists for that email.');
          }
        } catch (e) {
          emit(RegisterErrorState(ErrorMessage: e.toString()));
          print(e);
        }
      }
    });
  }
}
