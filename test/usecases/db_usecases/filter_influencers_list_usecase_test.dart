import 'package:fleeque/domain/entities/filtered_influencer.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';
import 'package:fleeque/domain/usecases/db_usecases/filter_influencers_list_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDbRepository extends Mock implements DbRepository {
  @override
  Future<void> filterInfluencersList(FilteredInfluencer params) {
    return Future<void>.value();
  }
}

void main() {
  group(
    'FilterInfluencersListUseCase',
    () {
      late MockDbRepository mockDbRepository;
      late FilterInfluencersListUseCase filterInfluencersListUseCase;
      setUp(
        () {
          mockDbRepository = MockDbRepository();
          filterInfluencersListUseCase = FilterInfluencersListUseCase(
            repository: mockDbRepository,
          );
        },
      );
      test(
        'Should send the parans to data layer to filter the stream',
        () async {
          const FilteredInfluencer params = FilteredInfluencer(
            country: 'country',
            followers: '100',
            price: '100',
            time: 'Newest',
          );

          expectLater(
            filterInfluencersListUseCase.execute(params),
            completes,
          );
        },
      );
    },
  );
}
