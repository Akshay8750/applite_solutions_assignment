import 'package:applite_solutions/data/repositories/movie_repo.dart';
import 'package:applite_solutions/features/movie/controller/movie_controller.dart';
import 'package:get/get.dart';

class DISetup {
  static void setup() {
    ///Repositories
    Get.put(MovieRepository());

    ///Controllers
    Get.put(MovieController());
  }
}
