import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class GoogleLoginAttemptEvent extends LoginEvent {
  const GoogleLoginAttemptEvent();

}
class CheckGoogleLoginEvent extends LoginEvent {
  const CheckGoogleLoginEvent();

}

class LoginAttemptEvent extends LoginEvent {
  const LoginAttemptEvent(this.username, this.password);

  final String username;
  final String password;
}
