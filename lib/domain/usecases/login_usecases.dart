import '../entities/user.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<User?> execute(String number, String password) {
    return repository.login(number, password);
  }
}
