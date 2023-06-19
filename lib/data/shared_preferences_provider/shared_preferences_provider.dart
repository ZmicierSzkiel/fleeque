import 'package:fleeque/data/models/user_model.dart';
import 'package:fleeque/domain/entities/user.dart';

abstract class SharedPreferencesProvider {
  Future<void> init();
  Future<void> saveUser(UserMapper user);
  Future<bool?> isFirstLaunch();
  Future<void> setFirstLaunch();
  Future<User?> getUser();
  Future<bool> deleteUser();
}
