import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/user.dart';

import 'package:fleeque/domain/repositories/user_repository.dart';

class GetUserUseCase implements UseCase<User?, NoParams> {
  final UserRepository repository;

  GetUserUseCase({required this.repository});

  @override
  Future<User?> execute(NoParams params) {
    return repository.getUser();
  }
}
