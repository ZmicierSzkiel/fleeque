import 'package:fleeque/core/stream_use_case.dart';
import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';

class ObserveUseCase implements StreamUseCase<List<Influencer>, NoParams> {
  final DbRepository repository;

  ObserveUseCase({required this.repository});

  @override
  Stream<List<Influencer>> execute(NoParams params) {
    return repository.observe();
  }
}
