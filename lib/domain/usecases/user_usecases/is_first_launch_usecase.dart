import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/repositories/user_repository.dart';

class IsFirstLaunchUseCase implements UseCase<bool, NoParams> {
  final UserRepository repository;

  IsFirstLaunchUseCase({required this.repository});

  @override
  Future<bool?> execute(NoParams input) {
    return repository.isFirstLaunch();
  }
}
