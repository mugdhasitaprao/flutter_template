import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@injectable
class GetJokeDetailsUseCase
    extends BaseUseCase<BaseError, JokeDetailsUseCaseParams, JokeDetails> {

  final HomeRepository homeRepository;

  GetJokeDetailsUseCase(this.homeRepository);

  @override
  Future<Either<BaseError, JokeDetails>> execute({required JokeDetailsUseCaseParams params}) {
    return homeRepository.fetchNewJoke();
  }

}

class JokeDetailsUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
