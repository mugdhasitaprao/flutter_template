import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:rxdart/rxdart.dart';

class BookmarkViewModel extends BasePageViewModel {
  final FetchBookmarkedDetailsUseCase fetchBookmarkedDetailsUseCase;

  final PublishSubject<Resource<List<JokeDetails>>> _bookmarkedJokeResponse =
      PublishSubject();

  Stream<Resource<List<JokeDetails>>> get bookmarkedJokeResponse =>
      _bookmarkedJokeResponse.stream;

  PageController controller = PageController();

  BookmarkViewModel(this.fetchBookmarkedDetailsUseCase);

  void getBookmarkedJoke() {
    FetchBookmarkedDetailsUseCaseParams params =
        FetchBookmarkedDetailsUseCaseParams();
    RequestManager<List<JokeDetails>>(
      params,
      createCall: () => fetchBookmarkedDetailsUseCase.execute(
        params: params,
      ),
    ).asFlow().listen((result) {
      debugPrint('Bookmarked joke list : ${result.data!.length}');
      _bookmarkedJokeResponse.add(result);
    });
  }
}
