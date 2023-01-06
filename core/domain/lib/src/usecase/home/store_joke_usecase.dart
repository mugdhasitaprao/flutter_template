import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:injectable/injectable.dart';
import '../base/params.dart';


class StoreJokeDetailsUseCase
    extends BaseUseCase<BaseError, StoreDetailsUseCaseParams, bool> {
  final HomeRepository homeRepository;

  StoreJokeDetailsUseCase(this.homeRepository);

  @override
  Future<Either<BaseError, bool>> execute(
      {required StoreDetailsUseCaseParams params}) {
    return homeRepository.storeJokeToCloud(jokeDetails: params.jokeDetails);
  }
}

class StoreDetailsUseCaseParams extends Params {
  final JokeDetails jokeDetails;

  StoreDetailsUseCaseParams(this.jokeDetails);

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
