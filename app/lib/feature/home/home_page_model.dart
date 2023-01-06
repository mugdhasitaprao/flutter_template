import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class HomeViewModel extends BasePageViewModel {
  final GetJokeDetailsUseCase getJokeDetailsUseCase;
  final StoreJokeDetailsUseCase storeJokeDetailsUseCase;
  final PublishSubject<Resource<JokeDetails>> _jokeResponse = PublishSubject();

  Stream<Resource<JokeDetails>> get jokeResponse => _jokeResponse.stream;


  final BehaviorSubject<bool> _bookmarkedJoke = BehaviorSubject.seeded(false);
  Stream<bool> get bookmarkJokeResponse => _bookmarkedJoke.stream;

  late FirebaseFirestore db;

  HomeViewModel(this.getJokeDetailsUseCase, this.storeJokeDetailsUseCase) {
    db = FirebaseFirestore.instance;
  }

  void getJoke() {
    JokeDetailsUseCaseParams params = JokeDetailsUseCaseParams();
    RequestManager<JokeDetails>(
      JokeDetailsUseCaseParams(),
      createCall: () => getJokeDetailsUseCase.execute(
        params: params,
      ),
    ).asFlow().listen((result) {
      _jokeResponse.add(result);
      _bookmarkedJoke.add(false);
      if (result.status == Status.success) {
        debugPrint(
            "Joke Responce : ${result.data?.category},${result.data!.delivery},${result.data!.lang}"
            "${result.data!.setup}, ${result.data!.type}");
      }
    });
  }

  void bookmarkJoke(JokeDetails? jokeDetails) {
    StoreDetailsUseCaseParams params = StoreDetailsUseCaseParams(jokeDetails!);
    RequestManager<bool>(
      params,
      createCall: () => storeJokeDetailsUseCase.execute(
        params: params,
      ),
    ).asFlow().listen((result) {
      _bookmarkedJoke.add(result.data!);
      if (result.status == Status.success) {
        debugPrint("Bookmark Joke : ${result.data}");
      }
    });
  }
}
