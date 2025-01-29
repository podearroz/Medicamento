class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginLoadingEvent extends LoginEvent {}

class LoginSuccessEvent extends LoginEvent {}

class LoginFailureEvent extends LoginEvent {
  final String error;

  LoginFailureEvent(this.error);
}
