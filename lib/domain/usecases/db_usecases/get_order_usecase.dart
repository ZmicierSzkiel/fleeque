import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/order_details.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';

class GetOrderUseCase implements UseCase<List<OrderDetails>, NoParams> {
  final DbRepository repository;

  GetOrderUseCase({
    required this.repository,
  });

  @override
  Future<List<OrderDetails>> execute(NoParams params) {
    return repository.getOrder();
  }
}