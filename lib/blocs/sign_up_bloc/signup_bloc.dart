
import 'package:fluxstore/exports/app_exports.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth _auth;

  SignUpBloc(this._auth) : super(SignUpInitial()) {
    on<SignUpSubmitted>((event, emit) async {
      emit(SignUpLoading());
      if (event.email.isEmpty || !event.email.contains('@')) {
        emit(SignUpFailure("Please enter a valid email address."));
        return;
      }

      if (event.password != event.confirmPassword) {
        emit(SignUpFailure("Passwords do not match"));
        return;
      }

      if (event.password.length < 6) {
        emit(SignUpFailure("Password must be at least 6 characters"));
        return;
      }

      try {
        await _auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(SignUpSuccess());
      } on FirebaseAuthException catch (e) {
        emit(SignUpFailure(e.message ?? "Sign up failed"));
      } catch (e) {
        emit(SignUpFailure("Something went wrong"));
      }
    });
  }
}
