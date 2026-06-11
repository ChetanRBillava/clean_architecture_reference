import 'package:clean_architecture_reference/modules/login/domain/repositories/login_repository.dart';
import '../entities/user.dart';

class Signup {
  final LoginRepository repository;

  Signup(this.repository); // Dependency injection

  Future<User?> call(String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      return null;
    }

    if (password.length < 6) {
      return null;
    }

    // Delegate to repository
    return await repository.signup(name, email, password);
  }
}
