import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginStateInit extends LoginState {}
class LoginStateSuccess extends LoginState {}
class LoginStateError extends LoginState {}