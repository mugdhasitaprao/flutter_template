import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:network_retrofit/src/util/safe_api_call.dart';
import 'services/retrofit_service.dart';
import 'dart:core';
import 'package:flutter/material.dart';

class NetworkAdapter implements NetworkPort {
  final RetrofitService apiService;

  NetworkAdapter(this.apiService);

  @override
  Future<Either<NetworkError, JokeDetails>> fetchNewJoke() async {
    var response = await safeApiCall(
      apiService.fetchNewJoke(),
    );
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(
        r.data.transform(),
      ),
    );
  }

  @override
  Future<Either<NetworkError, bool>> storeJokeToCloud(
      {required JokeDetails jokeDetails}) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final joke = <String, dynamic>{
      "id": jokeDetails.id,
      "error": jokeDetails.error,
      "type": jokeDetails.type,
      "joke": jokeDetails.joke,
      "delivery": jokeDetails.delivery,
      "setup": jokeDetails.setup,
      "category": jokeDetails.category,
      "lang": jokeDetails.lang,
      "safe": jokeDetails.safe
    };
    try {
      await db.collection("jokes").add(joke);
      return Right(true);
    } on Exception catch (ex) {
      return Left(NetworkError(
          httpError: 504,
          cause: ex,
          message: "Firebase error: ${ex.toString()}"));
    }
  }

  @override
  Future<Either<NetworkError, List<JokeDetails>>> fetchBookMarkedJoke() async {
    List<JokeDetails> jokeDetails = [];
    try {
      await FirebaseFirestore.instance
          .collection('jokes')
          .get()
          .then((QuerySnapshot querySnapshot) {
        debugPrint('snapshot size : ${querySnapshot.size}');
        querySnapshot.docs.forEach((doc) {
          debugPrint("id ${doc["id"].toString()}");
          jokeDetails.add(JokeDetails(
              id: doc["id"],
              error: doc["error"],
              type: doc['type'],
              joke: doc['joke'] ?? '',
              category: doc['category'] ?? '',
              delivery: doc['delivery'] ?? '',
              lang: doc['lang'],
              safe: doc['safe'],
              setup: doc['setup']));
        });
      });
      debugPrint('Bookmaed joke list netwprk adapter : ${jokeDetails.length}');
      return Right(jokeDetails);
    } on Exception catch (ex) {
      return Left(NetworkError(
          httpError: 504,
          cause: ex,
          message: "Firebase error: ${ex.toString()}"));
    }
  }
}
