import '../entities/user.dart';

abstract class LoginRepository {
  Future<User?> login(String email, String password);
  Future<User?> signup(String name, String email, String password);
  Future<void> logout();
  Future<User?> getCurrentUser();
}
