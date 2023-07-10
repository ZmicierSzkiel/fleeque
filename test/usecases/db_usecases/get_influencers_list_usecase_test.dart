import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDbRepository extends Mock implements DbRepository {
  @override
  Future<void> getInfluencersList() {
    return Future<void>.value();
  }
}

void main() {
  group(
    'GetInfluencersListUseCase',
    () {
      late MockDbRepository mockDbRepository;
      late GetInfluencersListUseCase getInfluencersListUseCase;
      setUp(
        () {
          mockDbRepository = MockDbRepository();
          getInfluencersListUseCase = GetInfluencersListUseCase(
            repository: mockDbRepository,
          );
        },
      );
      test(
        'check if the use case triggers the firebase and returns data from firestore',
        () {
          expectLater(
            getInfluencersListUseCase.execute(NoParams()),
            completes,
          );
        },
      );
    },
  );
}
