import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/entities/login_user.dart';
import 'package:fleeque/domain/repositories/auth_repository.dart';

class LoginUserUseCase implements UseCase<void, LoginUserRequest> {
  final AuthRepository repository;

  LoginUserUseCase({
    required this.repository,
  });

  @override
  Future<void> execute(LoginUserRequest params) {
    return repository.logInUser(params);
  }
}
