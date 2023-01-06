import 'package:app/feature/bookmark/bookmark_page_model.dart';
import 'package:app/feature/home/home_page_model.dart';
import 'package:app/feature/splash/splash_page_model.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dependencies.dart';

final splashViewModelProvider =
    ChangeNotifierProvider.autoDispose<SplashViewModel>(
  (ref) => SplashViewModel(getIt.get<String>(instanceName: "BaseUrl"),
      getIt.get<FlutterExceptionHandlerBinder>()),
);

final homeViewModelProvider = ChangeNotifierProvider.autoDispose<HomeViewModel>(
  (ref) => HomeViewModel(
      getIt.get<GetJokeDetailsUseCase>(), getIt.get<StoreJokeDetailsUseCase>()),
);

final bookmarkModelProvider =
    ChangeNotifierProvider.autoDispose<BookmarkViewModel>(
        (ref) => BookmarkViewModel(
            getIt.get<FetchBookmarkedDetailsUseCase>()
        ));
