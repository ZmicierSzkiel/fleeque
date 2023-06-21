import 'package:fleeque/domain/entities/influencer.dart';

abstract class DbRepository {
  Future<void> getInfluencersList();
  Stream<List<Influencer>> observe();
  // Future<List<Influencer>> updateInfluencersList();
}
