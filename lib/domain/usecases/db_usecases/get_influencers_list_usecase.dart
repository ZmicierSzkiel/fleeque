import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';

class GetInfluencersListUseCase implements UseCase<List<Influencer>, NoParams> {
  final DbRepository repository;

  GetInfluencersListUseCase({required this.repository});

  @override
  Future<List<Influencer>> execute(NoParams params) {
    return repository.getInfluencersList();
  }
}
