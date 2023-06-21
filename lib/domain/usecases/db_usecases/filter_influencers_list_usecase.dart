import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/entities/filtered_influencer.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';

class FilterInfluencersListUseCase
    implements UseCase<void, FilteredInfluencer> {
  final DbRepository repository;

  FilterInfluencersListUseCase({
    required this.repository,
  });

  @override
  Future<void> execute(FilteredInfluencer params) {
    return repository.filterInfluencersList(params);
  }
}
