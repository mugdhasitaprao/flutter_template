import 'package:domain/domain.dart';

abstract class HomeRepository {
  Future<Either<NetworkError, JokeDetails>> fetchNewJoke();

  Future<Either<NetworkError, bool>> storeJokeToCloud(
      {required JokeDetails jokeDetails});

  Future<Either<NetworkError,List<JokeDetails>>> getBookmarkedJokes();
}
