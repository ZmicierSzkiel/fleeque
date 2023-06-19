import 'package:fleeque/domain/entities/user.dart';

abstract class UserRepository {
  Future<User?> getUser();
  Future<bool?> isFirstLaunch();
  Future<void> setFirstLaunch();
}
