import 'package:flutter_application_medicamento/features/login/bloc/login_event.dart';
import 'package:flutter_application_medicamento/features/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitialEvent>(handleLoginInitialEvent);
    on<LoginLoadingEvent>(handleLoginLoadingEvent);
    on<LoginSuccessEvent>(handleLoginSuccessEvent);
    on<LoginFailureEvent>(handleLoginFailureEvent);
  }

  void handleLoginInitialEvent(LoginEvent event, Emitter emit) =>
      emit(LoginInitial());

  void handleLoginLoadingEvent(LoginLoadingEvent event, Emitter emit) =>
      emit(LoginLoading());

  void handleLoginSuccessEvent(LoginSuccessEvent event, Emitter emit) =>
      emit(LoginSuccess());

  void handleLoginFailureEvent(LoginFailureEvent event, Emitter emit) =>
      emit(LoginFailure(event.error));
}
