import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';

class MockDbRepository extends Mock implements DbRepository {
  @override
  Stream<List<Influencer>> observe() {
    return super.noSuchMethod(
      Invocation.method(
        #observe,
        [],
      ),
      returnValue: const Stream<List<Influencer>>.empty(),
    );
  }
}

void main() {
  group(
    'ObserveUseCase',
    () {
      late MockDbRepository mockDbRepository;
      late ObserveUseCase observeUseCase;
      setUp(
        () {
          mockDbRepository = MockDbRepository();
          observeUseCase = ObserveUseCase(
            repository: mockDbRepository,
          );
        },
      );
      test(
        'check if the use case triggers the firebase and returns data from firestore',
        () {
          const Stream<List<Influencer>> expectedStream =
              Stream<List<Influencer>>.empty();

          when(
            mockDbRepository.observe(),
          ).thenAnswer(
            (_) => expectedStream,
          );

          final result = observeUseCase.execute(NoParams());

          expect(
            result,
            equals(expectedStream),
          );
        },
      );
    },
  );
}
