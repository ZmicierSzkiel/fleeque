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
import 'package:fleeque/domain/usecases/auth_usecases/login_user_usecase.dart';
import 'package:fleeque/domain/usecases/auth_usecases/register_user_usecase.dart';
import 'package:fleeque/domain/usecases/auth_usecases/sign_out_user_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/filter_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/send_order_usecase.dart';
import 'package:fleeque/domain/usecases/user_usecases/get_user_usecase.dart';
import 'package:fleeque/domain/usecases/user_usecases/is_first_launch_usecase.dart';
import 'package:fleeque/domain/usecases/user_usecases/set_first_launch_usecase.dart';

Future<void> setupLocator() async {
  await _initPrefs();

  getIt.registerSingleton<FirebaseAuthProvider>(
    FirebaseAuthProvider(),
  );

  getIt.registerSingleton<FirebaseDbProvider>(
    FirebaseDbProvider(),
  );

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
      dbProvider: getIt.get<FirebaseDbProvider>(),
    ),
  );

  getIt.registerLazySingleton<SignOutUserUseCase>(
    () => SignOutUserUseCase(
      repository: getIt.get<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<FilterInfluencersListUseCase>(
    () => FilterInfluencersListUseCase(
      repository: getIt.get<DbRepository>(),
    ),
  );

  getIt.registerLazySingleton<GetInfluencersListUseCase>(
    () => GetInfluencersListUseCase(
      repository: getIt.get<DbRepository>(),
    ),
  );

  getIt.registerLazySingleton<ObserveUseCase>(
    () => ObserveUseCase(
      repository: getIt.get<DbRepository>(),
    ),
  );

  getIt.registerLazySingleton<RegisterUserUseCase>(
    () => RegisterUserUseCase(
      repository: getIt.get<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<LoginUserUseCase>(
    () => LoginUserUseCase(
      repository: getIt.get<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<IsFirstLaunchUseCase>(
    () => IsFirstLaunchUseCase(
      repository: getIt.get<UserRepository>(),
    ),
  );

  getIt.registerLazySingleton<SetFirstLaunchUseCase>(
    () => SetFirstLaunchUseCase(
      repository: getIt.get<UserRepository>(),
    ),
  );

  getIt.registerLazySingleton<GetUserUseCase>(
    () => GetUserUseCase(
      repository: getIt.get<UserRepository>(),
    ),
  );

  getIt.registerLazySingleton<SendOrderUseCase>(
    () => SendOrderUseCase(
      repository: getIt.get<DbRepository>(),
    ),
  );
}

Future<void> _initPrefs() async {
  final SharedPreferencesProvider prefsProvider =
      SharedPreferencesProviderImpl();

  await prefsProvider.init();

  getIt.registerSingleton<SharedPreferencesProvider>(prefsProvider);
}
