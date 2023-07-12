import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/order_details.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_order_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDbRepository extends Mock implements DbRepository {
  @override
  Future<List<OrderDetails>> getOrder() async {
    return super.noSuchMethod(
      Invocation.method(
        #getOrder,
        [],
      ),
      returnValue: Future<List<OrderDetails>>.value([]),
      returnValueForMissingStub: Future<List<OrderDetails>>.value([]),
    );
  }
}

void main() {
  group(
    'GetOrderUseCase',
    () {
      late MockDbRepository mockDbRepository;
      late GetOrderUseCase getOrderUseCase;

      setUp(
        () {
          mockDbRepository = MockDbRepository();
          getOrderUseCase = GetOrderUseCase(
            repository: mockDbRepository,
          );
        },
      );

      test(
        'Check if usecase get order data from firebase',
        () {
          expectLater(
            getOrderUseCase.execute(NoParams()),
            completes,
          );
        },
      );
    },
  );
}
