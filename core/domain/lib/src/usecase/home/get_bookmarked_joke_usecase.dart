
import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchBookmarkedDetailsUseCase
    extends BaseUseCase<BaseError, FetchBookmarkedDetailsUseCaseParams, List<JokeDetails>> {

  final HomeRepository homeRepository;

  FetchBookmarkedDetailsUseCase(this.homeRepository);

  @override
  Future<Either<BaseError, List<JokeDetails>>> execute({required FetchBookmarkedDetailsUseCaseParams params}) {
    return homeRepository.getBookmarkedJokes();
  }

}

class FetchBookmarkedDetailsUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}