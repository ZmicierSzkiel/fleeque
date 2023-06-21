import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';

class GetInfluencersListUseCase implements UseCase<void, NoParams> {
  final DbRepository repository;

  GetInfluencersListUseCase({
    required this.repository,
  });

  @override
  Future<void> execute(NoParams params) {
    return repository.getInfluencersList();
  }
}
