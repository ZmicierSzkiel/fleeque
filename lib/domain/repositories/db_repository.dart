import 'package:fleeque/domain/entities/influencer.dart';

abstract class DbRepository {
  Future<List<Influencer>> getInfluencersList();
  Future<List<Influencer>> getFilteredInfluencers();
}
