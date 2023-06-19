import 'package:fleeque/domain/entities/login_user.dart';
import 'package:fleeque/domain/entities/register_user.dart';

abstract class AuthRepository {
  Future<void> logInUser(LoginUserRequest userInfo);
  Future<void> signOutUser();
  Future<void> registerUser(RegisterUserRequest userInfo);
}
