import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_browser/features/domain/entity/movie_card.dart';

class StateManager extends ChangeNotifier {
  List<MovieCard> favorite = [];

  List<MovieCard> listCard = [];

  void addToFavorite(MovieCard card) {
    if (favorite.contains(card)) {
      favorite.remove(card);
    } else {
      favorite.add(card);
    }
    notifyListeners();
  }

  Future<void> loadMap(String str) async {
    final response = await rootBundle.loadString(str);
    final List<dynamic> movieList = jsonDecode(response);
    final myMap = movieList
        .map((e) => MovieCard.fromJson(e as Map<String, dynamic>))
        .toList();
    for (var i in myMap) {
      if (listCard.length < 12) {
        listCard.add(i);
      }
    }

    notifyListeners();
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResults = await Connectivity().checkConnectivity();

    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      try {
        final result = await InternetAddress.lookup('example.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          await Future.delayed(const Duration(seconds: 3));

          return true;
        }
      } on SocketException catch (_) {
        return false;
      }
    }
    return false;
  }
}
