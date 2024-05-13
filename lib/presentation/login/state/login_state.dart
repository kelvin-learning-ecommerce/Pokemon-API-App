import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginStateInit extends LoginState {}

class LoginLoadingState extends LoginState {}
class IsGoogleLoggedInState extends LoginState {
  IsGoogleLoggedInState(this.isGoogleLogin);
  final bool isGoogleLogin;
}

class LoginStateSuccess extends LoginState {
  LoginStateSuccess({this.googleUser});
  final UserCredential? googleUser;
}

class LoginStateError extends LoginState {
  LoginStateError({this.exception});
  final Exception? exception;
}
