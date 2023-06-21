import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/repositories/auth_repository.dart';

class DeleteUserUseCase implements UseCase<void, bool> {
  final AuthRepository repository;

  DeleteUserUseCase({
    required this.repository,
  });

  @override
  Future<void> execute(bool boolean) {
    return repository.signOutUser();
  }
}
