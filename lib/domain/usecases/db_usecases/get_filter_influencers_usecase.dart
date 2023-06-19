import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';

class GetFilterInfluencersUseCase
    implements UseCase<List<Influencer>, NoParams> {
  final DbRepository repository;

  GetFilterInfluencersUseCase({required this.repository});

  @override
  Future<List<Influencer>> execute(NoParams params) {
    return repository.getFilteredInfluencers();
  }
}
