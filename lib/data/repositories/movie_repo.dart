import 'package:applite_solutions/data/models/movie_model.dart';
import 'package:applite_solutions/network/dio_client.dart';
import 'package:applite_solutions/network/exception_handler.dart';
import 'package:applite_solutions/utils/utilities.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  static final MovieRepository _instance = MovieRepository._internal();
  late final DioClient _dioClient;

  MovieRepository._internal() {
    _dioClient = DioClient();
  }

  factory MovieRepository() => _instance;

  Future<List<MovieModel>> getMovieData(String query) async {
    try {
      Response response = await _dioClient.getRequest(endPoint: '/search/shows?q=$query');

      if (isSuccessResponse(response)) {
        List<dynamic> responseData = response.data;
        List<MovieModel> movies = responseData.map((data) => MovieModel.fromJson(data)).toList();
        return movies;
      } else {
        throw BaseApiException(response.statusMessage, response.statusCode);
      }
    } catch (ex) {
      throw BaseApiException(ex.toString(), ex.hashCode);
    }
  }
}
