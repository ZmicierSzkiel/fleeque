import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/register_user.dart';

import 'package:fleeque/domain/repositories/auth_repository.dart';

class RegisterUserUseCase implements UseCase<void, RegisterUserRequest> {
  final AuthRepository repository;

  RegisterUserUseCase({
    required this.repository,
  });

  @override
  Future<void> execute(RegisterUserRequest params) {
    return repository.registerUser(params);
  }
}
