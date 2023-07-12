import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleeque/domain/entities/order_details.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';
import 'package:fleeque/domain/usecases/db_usecases/send_order_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDbRepository extends Mock implements DbRepository {
  @override
  Future<void> sendOrder(params) async {
    return super.noSuchMethod(
      Invocation.method(
        #sendOrder,
        [params],
      ),
      returnValue: Future.value(),
      returnValueForMissingStub: Future.value(),
    );
  }
}

void main() {
  group(
    'SendOrderUseCase',
    () {
      late MockDbRepository mockDbRepository;
      late SendOrderUseCase sendOrderUseCase;

      setUp(
        () {
          mockDbRepository = MockDbRepository();
          sendOrderUseCase = SendOrderUseCase(
            repository: mockDbRepository,
          );
        },
      );

      test(
        'Check if usecase send order data to firebase',
        () {
          final OrderDetails params = OrderDetails(
            influencerName: '',
            orderPrice: 0,
            orderDescription: '',
            userId: '',
            timestamp: Timestamp.now(),
          );

          expectLater(
            sendOrderUseCase.execute(params),
            completes,
          );
        },
      );
    },
  );
}
