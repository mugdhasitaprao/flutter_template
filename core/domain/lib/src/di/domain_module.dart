import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  @lazySingleton
  StoreJokeDetailsUseCase storeJokeDetailsUseCaseProvider(
    HomeRepository repository,
  ) {
    return StoreJokeDetailsUseCase(repository);
  }

  /*@lazySingleton
  FetchBookmarkedDetailsUseCase fetchBookmarkedDetailsUseCaseProvider(
      HomeRepository repository,
      ) {
    return FetchBookmarkedDetailsUseCase(repository);
  }*/
}
