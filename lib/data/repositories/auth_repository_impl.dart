import 'package:fleeque/data/firebase_provider/firebase_auth_provider.dart';
import 'package:fleeque/data/models/user_model.dart';
import 'package:fleeque/data/shared_preferences_provider/shared_preferences_provider.dart';

import 'package:fleeque/domain/entities/login_user.dart';
import 'package:fleeque/domain/entities/register_user.dart';
import 'package:fleeque/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthProvider _firebaseAuthProvider;
  final SharedPreferencesProvider _preferencesProvider;

  AuthRepositoryImpl({
    required SharedPreferencesProvider preferencesProvider,
    required FirebaseAuthProvider firebaseAuthProvider,
  })  : _firebaseAuthProvider = firebaseAuthProvider,
        _preferencesProvider = preferencesProvider;

  @override
  Future<void> registerUser(
    RegisterUserRequest userInfo,
  ) async {
    final UserMapper signedUpUser = await _firebaseAuthProvider.signUpUser(
      email: userInfo.email,
      password: userInfo.password,
    );
    _preferencesProvider.saveUser(signedUpUser);
  }

  @override
  Future<void> logInUser(
    LoginUserRequest userInfo,
  ) async {
    final UserMapper signedInUser = await _firebaseAuthProvider.signInUser(
      email: userInfo.email,
      password: userInfo.password,
    );
    _preferencesProvider.saveUser(signedInUser);
  }

  @override
  Future<void> signOutUser() async {
    await _firebaseAuthProvider.signOutUser();
    await _preferencesProvider.deleteUser();
  }
}
