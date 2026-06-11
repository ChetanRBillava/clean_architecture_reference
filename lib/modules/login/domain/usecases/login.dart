import 'package:clean_architecture_reference/modules/login/domain/repositories/login_repository.dart';
import '../entities/user.dart';

class Login {
  final LoginRepository repository;

  Login(this.repository);

  Future<User?> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return null;
    }

    if (password.length < 6) {
      return null;
    }

    return await repository.login(email, password);
  }
}
