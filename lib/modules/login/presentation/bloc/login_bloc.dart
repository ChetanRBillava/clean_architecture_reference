import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState().init()) {
    on<InitEvent>(_init);
    on<ModeToggleEvent>(_modeToggleEvent);
    on<FormValidateEvent>(_formValidateEvent);
  }

  void _init(InitEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith());
  }

  void _modeToggleEvent(ModeToggleEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(signupMode: !state.signupMode));
  }

  void _formValidateEvent(
    FormValidateEvent event,
    Emitter<LoginState> emit,
  ) async {
    bool loginSuccess = false;
    if (state.signupMode) {
      loginSuccess = _checkSignup(event);
    } else {
      loginSuccess = _checkLogin(event);
    }
    emit(
      state.copyWith(
        loginSuccess: loginSuccess,
        showToast: true,
        toastMessage:
            '${state.signupMode ? 'Sign up' : 'Login'} ${loginSuccess ? 'successful' : 'failed'}',
      ),
    );
  }

  bool _checkLogin(FormValidateEvent event) {
    String expectedEmail = 'c@c.com', expectedPassword = '1234';
    return event.email == expectedEmail && event.password == expectedPassword;
  }

  bool _checkSignup(FormValidateEvent event) {
    return event.name.isNotEmpty &&
        event.email.isNotEmpty &&
        event.password.isNotEmpty;
  }
}
