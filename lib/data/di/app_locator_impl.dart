import 'package:fleeque/core/app_locator.dart';

import 'package:fleeque/data/firebase_provider/firebase_auth_provider.dart';
import 'package:fleeque/data/firebase_provider/firebase_db_provider.dart';

import 'package:fleeque/data/repositories/auth_repository_impl.dart';
import 'package:fleeque/data/repositories/db_repository_impl.dart';
import 'package:fleeque/data/repositories/user_repository_impl.dart';

import 'package:fleeque/data/shared_preferences_provider/shared_preferences_provider.dart';
import 'package:fleeque/data/shared_preferences_provider/shared_preferences_provider_impl.dart';

import 'package:fleeque/domain/repositories/auth_repository.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';
import 'package:fleeque/domain/repositories/user_repository.dart';

Future<void> setupLocator() async {
  await _initPrefs();

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      sharedPreferencesProvider: getIt.get<SharedPreferencesProvider>(),
    ),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      preferencesProvider: getIt.get<SharedPreferencesProvider>(),
      firebaseAuthProvider: getIt.get<FirebaseAuthProvider>(),
    ),
  );

  getIt.registerLazySingleton<DbRepository>(
    () => DbRepositoryImpl(
      firebaseDbProvider: getIt.get<FirebaseDbProvider>(),
    ),
  );
}

Future<void> _initPrefs() async {
  final SharedPreferencesProvider prefsProvider =
      SharedPreferencesProviderImpl();
  final FirebaseAuthProvider firebaseAuthProvider = FirebaseAuthProvider();
  final FirebaseDbProvider firebaseDbProvider = FirebaseDbProvider();

  await prefsProvider.init();

  getIt.registerSingleton<SharedPreferencesProvider>(prefsProvider);
  getIt.registerSingleton<FirebaseAuthProvider>(firebaseAuthProvider);
  getIt.registerSingleton<FirebaseDbProvider>(firebaseDbProvider);
}
