import 'package:fleeque/data/shared_preferences_provider/shared_preferences_provider.dart';

import 'package:fleeque/domain/entities/user.dart';
import 'package:fleeque/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final SharedPreferencesProvider sharedPreferencesProvider;

  UserRepositoryImpl({required this.sharedPreferencesProvider});

  @override
  Future<bool?> isFirstLaunch() async {
    final bool? isFirstLaunch = await sharedPreferencesProvider.isFirstLaunch();
    return isFirstLaunch;
  }

  @override
  Future<void> setFirstLaunch() async {
    await sharedPreferencesProvider.setFirstLaunch();
  }

  @override
  Future<User?> getUser() async {
    final User? user = await sharedPreferencesProvider.getUser();
    return user;
  }
}
