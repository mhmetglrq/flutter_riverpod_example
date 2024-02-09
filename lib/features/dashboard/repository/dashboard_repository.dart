import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/core/constants/api_constants.dart';
import 'package:flutter_riverpod_example/features/models/movie_model.dart';

final dashboardRepositoryProvider = Provider(
  (ref) => DashboardRepository(
    dio: Dio(),
  ),
);

class DashboardRepository {
  final Dio dio;
  const DashboardRepository({required this.dio});

  Future<List<MovieModel>> getPopularMovies(int page, String? region) async {
    List<MovieModel> popularMovies = [];
    try {
      var response = await dio.request("${ApiConstants.baseUrl}popular",
          options: Options(method: "GET", headers: {
            "accept": "application/json",
            "authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNzZjYzA5MmU4OTUwY2UyMzM0NGM5NTYzMWE3MzllMyIsInN1YiI6IjY1YjdmMGUxYTI4NGViMDE3YzBjMmM2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XG40sjzR56TKbtqg3R5nNetIfJeNG4p2YmEfuntsvNo"
          }),
          queryParameters: {
            'language': 'en-US',
            'page': page,
            'region': region,
          });
      for (var popularMovie in response.data["results"]) {
        MovieModel model = MovieModel.fromJson(popularMovie);
        popularMovies.add(model);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return popularMovies.sublist(0, 8);
  }
}
