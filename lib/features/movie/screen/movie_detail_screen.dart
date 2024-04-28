import 'package:applite_solutions/common_widgets/helper_widgets.dart';
import 'package:applite_solutions/common_widgets/read_more_text.dart';
import 'package:applite_solutions/data/models/movie_model.dart';
import 'package:applite_solutions/generated/assets.dart';
import 'package:applite_solutions/generated/l10n.dart';
import 'package:applite_solutions/theme/text_style.dart';
import 'package:applite_solutions/utils/navigation.dart';
import 'package:applite_solutions/utils/padding_helper.dart';
import 'package:applite_solutions/utils/size_config.dart';
import 'package:applite_solutions/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailScreen extends StatelessWidget {
  final Show show;

  const MovieDetailScreen(this.show, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            loadImage(show.image?.original ?? "",
                width: screenWidth(), height: ScreenUtil().setHeight(288),),
            Positioned(
              top: ScreenUtil().setHeight(110),
              right: 0,
              left: 0,
              bottom: ScreenUtil().setHeight(110),
              child: InkWell(
                  onTap: () {
                    showInfoToast(S.of(context).playButtonClicked);
                  },
                  child: vector(Assets.assetsPlayIcon)),
            ),
            Positioned(
              top: 48.h,
              left: 16.w,
              child: InkWell(
                  onTap: () => backToPrevious(),
                  child: vector(Assets.assetsBackArrow, width: 36.sp, height: 36.sp)),
            ),
          ],
        ),
        Padding(
          padding: padAll(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boxH8(),
              Text(show.name, style: AppTextTheme.headingMediumStyle),
              boxHCustom(12),
              Row(children: [
                detailPointWidget(context, Icons.access_time, "${show.runtime} minutes"),
                boxWCustom(24),
                detailPointWidget(context, Icons.star_rounded, "${show.rating?.average} (IMDb)"),
              ]),
              boxHCustom(12),
              Divider(color: Theme.of(context).colorScheme.scrim.withOpacity(0.1)),
              boxH8(),
              Row(children: [
                premieredWidget(context, show.premiered),
                boxWCustom(64),
                genreWidget(context, show.genres)
              ]),
              boxH8(),
              Divider(color: Theme.of(context).colorScheme.scrim.withOpacity(0.1)),
              boxHCustom(12),
              Text(S.of(context).summary, style: AppTextTheme.titleMediumStyle),
              boxH8(),
              ExpandableText(description: show.summary),
            ],
          ),
        ),
      ]),
    );
  }
}
