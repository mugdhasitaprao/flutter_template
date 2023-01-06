import 'package:data/data.dart';
import 'package:domain/domain.dart';

class HomeRepositoryImpl extends HomeRepository {
  final DatabasePort databaseProvider;
  final NetworkPort networkPort;

  HomeRepositoryImpl(this.databaseProvider, this.networkPort);

  @override
  Future<Either<NetworkError, JokeDetails>> fetchNewJoke() {
    return networkPort.fetchNewJoke();
  }

  @override
  Future<Either<NetworkError, bool>> storeJokeToCloud({required JokeDetails jokeDetails}) {
    return networkPort.storeJokeToCloud(jokeDetails: jokeDetails);
  }

  @override
  Future<Either<NetworkError, List<JokeDetails>>> getBookmarkedJokes() {
    return networkPort.fetchBookMarkedJoke();
  }
}