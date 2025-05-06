import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({required String number, required String password})
    : super(number: number, password: password);
}
