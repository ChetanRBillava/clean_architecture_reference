abstract class LoginEvent {}

class InitEvent extends LoginEvent {}

class ModeToggleEvent extends LoginEvent {}

class FormValidateEvent extends LoginEvent {
  final String name, email, password;

  FormValidateEvent({
    this.name = '',
    required this.email,
    required this.password,
  });
}
