import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/order_details.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_order_usecase.dart';
import 'package:fleeque/presentation/main_screen/screens/payment/bloc/payment_bloc.dart';

class MockGetOrderUseCase extends Mock implements GetOrderUseCase {
  @override
  Future<List<OrderDetails>> execute(NoParams params) async {
    return Future.value([]);
  }
}

void main() {
  group(
    'PaymentBloc',
    () {
      late PaymentBloc paymentBloc;

      setUp(
        () {
          paymentBloc = PaymentBloc(
            getOrderUseCase: MockGetOrderUseCase(),
          );
        },
      );

      tearDown(
        () async {
          await paymentBloc.close();
        },
      );

      test(
        'Initial state should be empty',
        () {
          expect(
            paymentBloc.state,
            equals(
              const PaymentState(
                orderDetails: [],
              ),
            ),
          );
        },
      );

      blocTest(
        'Emits correct state for GetOrderDetailsEvent',
        build: () => paymentBloc,
        act: (bloc) => bloc.add(
          GetOrderDetailsEvent(),
        ),
        expect: () => [
          const PaymentState(
            orderDetails: [],
          ),
        ],
      );
    },
  );
}
