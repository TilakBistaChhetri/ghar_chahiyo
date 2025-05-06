import '../../domain/entities/user.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/local/dummy_login_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final DummyLoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<User?> login(String number, String password) {
    return dataSource.login(number, password);
  }
}
