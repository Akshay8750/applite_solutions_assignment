import 'package:applite_solutions/common_widgets/helper_widgets.dart';
import 'package:applite_solutions/features/movie/controller/movie_controller.dart';
import 'package:applite_solutions/generated/assets.dart';
import 'package:applite_solutions/generated/l10n.dart';
import 'package:applite_solutions/theme/text_style.dart';
import 'package:applite_solutions/utils/padding_helper.dart';
import 'package:applite_solutions/utils/size_config.dart';
import 'package:applite_solutions/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final controller = Get.find<MovieController>();

  @override
  void initState() {
    super.initState();
    controller.getMovieData('spiderman');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: padAll(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth(percentage: 70),
            child: Text(S.of(context).findMoviesTvSeriesAndMore,
                style: AppTextTheme.headingMediumStyle),
          ),
          vector(Assets.assetsHomeDivider, width: 20.w),
          Obx(() => controller.isLoadingState.value
              ? Center(
                  child: CircularProgressIndicator(color: Theme.of(context).colorScheme.background),
                )
              : controller.isErrorState.value
                  ? Center(
                      child: Text(S.of(context).somethingWentWrongPleaseTryAfterSomeTime),
                    )
                  : Expanded(
                      child: GridView.custom(
                        gridDelegate: SliverWovenGridDelegate.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          pattern: [getPattern(0.6), getPattern(0.8)],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                          childCount: 7,
                          (context, index) => ClipRRect(
                            borderRadius: BorderRadius.circular(ScreenUtil().radius(12)),
                            child: movieCard(context, controller.movies[index].show!),
                          ),
                        ),
                      ),
                    ))
        ].separateVertically(16),
      ),
    )));
  }

  WovenGridTile getPattern(double aspectRation) {
    return WovenGridTile(aspectRation,
        crossAxisRatio: 0.95, alignment: AlignmentDirectional.topCenter);
  }
}
