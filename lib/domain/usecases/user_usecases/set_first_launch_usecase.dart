import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/repositories/user_repository.dart';

class SetFirstLaunchUseCase implements UseCase<void, NoParams> {
  final UserRepository repository;

  SetFirstLaunchUseCase({required this.repository});

  @override
  Future<void> execute(NoParams input) async {
    await repository.setFirstLaunch();
  }
}
