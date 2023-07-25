import 'dart:convert';
import 'package:jsoncard/model/movie_data_model.dart';
import 'package:flutter/services.dart' as root_bundle;

class MovieDataProvider {
  static Future<List<MovieDataModel>> getMoviesData() async {
    final jsondata =
        await root_bundle.rootBundle.loadString('jsonfile/movieslist.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => MovieDataModel.fromJson(e)).toList();
  }
}
