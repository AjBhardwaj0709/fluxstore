import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _auth;

  LoginBloc(this._auth) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());

      try {
        await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(LoginSuccess());
      } on FirebaseAuthException catch (e) {
        emit(LoginFailure(e.message ?? "Login failed"));
      } catch (e) {
        emit(LoginFailure("Something went wrong"));
      }
    });

    on<ForgotPasswordPressed>((event, emit) async {
      if (event.email.isEmpty || !event.email.contains('@')) {
        emit(LoginFailure("Please enter a valid email address."));
        return;
      }

      try {
        await _auth.sendPasswordResetEmail(email: event.email);
        emit(LoginForgotPasswordEmailSent());
      } catch (e) {
        emit(LoginFailure("Failed to send reset email: ${e.toString()}"));
      }
    });

  }

  
}
