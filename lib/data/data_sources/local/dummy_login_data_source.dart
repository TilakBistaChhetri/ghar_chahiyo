import '../../models/user_models.dart';

class DummyLoginDataSource {
  final List<UserModel> _dummyUsers = [
    UserModel(number: '9801234567', password: 'pass'), 
  ];

  Future<UserModel?> login(String number, String password) async {
    try {
      return _dummyUsers.firstWhere(
        (user) => user.number == number && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }
}

