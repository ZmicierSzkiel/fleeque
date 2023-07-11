import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/order_details.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';

class SendOrderUseCase implements UseCase<void, OrderDetails> {
  final DbRepository repository;

  SendOrderUseCase({
    required this.repository,
  });

  @override
  Future<void> execute(
    OrderDetails params,
  ) {
    return repository.sendOrder(params);
  }
}
