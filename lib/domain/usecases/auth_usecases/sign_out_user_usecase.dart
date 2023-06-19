import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/repositories/auth_repository.dart';

class SignOutUserUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  SignOutUserUseCase({
    required this.repository,
  });

  @override
  Future<void> execute(NoParams params) {
    return repository.signOutUser();
  }
}
