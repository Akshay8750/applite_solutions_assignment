import 'package:applite_solutions/data/models/movie_model.dart';
import 'package:applite_solutions/data/repositories/movie_repo.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  final _repository = Get.find<MovieRepository>();
  var isLoadingState = false.obs;
  var isErrorState = false.obs;
  var monthlyExpense = ''.obs;
  var movies = <MovieModel>[].obs;



  void getMovieData(String query) async {
    isLoadingState.value = true;
    try {
      List<MovieModel> fetchedMovies = await _repository.getMovieData(query);
      movies.assignAll(fetchedMovies.take(7));
    } catch (ex) {
      isErrorState.value = true;
    } finally {
      isLoadingState.value = false;
    }
  }
}
