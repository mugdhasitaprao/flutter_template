import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class NetworkPort {
  Future<Either<NetworkError, JokeDetails>> fetchNewJoke();
  Future<Either<NetworkError, bool>> storeJokeToCloud({required JokeDetails jokeDetails});
  Future<Either<NetworkError, List<JokeDetails>>> fetchBookMarkedJoke();
}
