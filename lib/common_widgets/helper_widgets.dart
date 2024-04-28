import 'package:applite_solutions/data/models/movie_model.dart' as mm;
import 'package:applite_solutions/features/movie/screen/movie_detail_screen.dart';
import 'package:applite_solutions/generated/assets.dart';
import 'package:applite_solutions/generated/l10n.dart';
import 'package:applite_solutions/theme/text_style.dart';
import 'package:applite_solutions/utils/navigation.dart';
import 'package:applite_solutions/utils/padding_helper.dart';
import 'package:applite_solutions/utils/size_config.dart';
import 'package:applite_solutions/utils/utilities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';

Widget vector(String asset,
    {double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
    void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: SvgPicture.asset(
      asset,
      width: width,
      height: height,
      fit: fit,
      // ignore: deprecated_member_use
      color: color,
    ),
  );
}

Widget vectorNetwork(String asset,
    {double? width, double? height, BoxFit fit = BoxFit.contain, Color? color}) {
  return SvgPicture.network(
    asset,
    width: width,
    height: height,
    fit: fit,
    // ignore: deprecated_member_use
    color: color,
  );
}

Widget loadImage(String imageUrl,
    {double? width, double? height, BoxFit fit = BoxFit.cover, String? tag}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    width: width,
    height: height,
    fit: fit,
    placeholder: (context, url) => Center(
      child: SizedBox(
          height: ScreenUtil().setHeight(30),
          width: ScreenUtil().setWidth(30),
          child: const CircularProgressIndicator()),
    ),
    errorWidget: (context, url, error) {
      if (imageUrl.endsWith("svg")) {
        return vectorNetwork(imageUrl);
      } else {
        return Image.asset(Assets.assetsLogoColored,
            height: ScreenUtil().setHeight(30),
            width: ScreenUtil().setWidth(30),
            fit: BoxFit.contain);
      }
    },
  );
}

Widget movieCard(BuildContext context, mm.Show show) {
  return GestureDetector(
    onTap: () {
      moveTo(screenName: MovieDetailScreen(show));
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(ScreenUtil().radius(12)),
            child: loadImage(show.image?.medium ?? show.image?.original ?? "",
                width: screenWidth(percentage: 45), fit: BoxFit.cover),
          ),
        ),
        boxH8(),
        Row(
          children: [
            Text(
              " ${show.name}",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppTextTheme.bodyMediumStyle,
            ),
            Expanded(
              child: Text(
                " (${show.premiered.substring(0, 4)})",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextTheme.bodyStyle.copyWith(color: Theme.of(context).colorScheme.scrim),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget detailPointWidget(BuildContext context, IconData icon, String point) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, color: Theme.of(context).colorScheme.surface, size: 16.sp),
      boxW4(),
      Text(point,
          style: AppTextTheme.labelStyle.copyWith(color: Theme.of(context).colorScheme.surface))
    ],
  );
}

Widget premieredWidget(BuildContext context, String date) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(S.of(context).premiered, style: AppTextTheme.subtitleBoldStyle),
      boxH8(),
      Text(formatDate(date),
          style: AppTextTheme.labelStyle.copyWith(color: Theme.of(context).colorScheme.surface))
    ],
  );
}

Widget genreWidget(BuildContext context, List<String> genres) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(S.of(context).genre, style: AppTextTheme.subtitleBoldStyle),
      boxH8(),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: genres.take(2).map((genre) => buildGradientBorderText(context, genre)).toList(),
        ),
      ),
    ],
  );
}

Widget buildGradientBorderText(BuildContext context, String text) {
  return Container(
    margin: padOnly(right: 8.w),
    padding: padSym(vertical: 2.h, horizontal: 12.w),
    decoration: BoxDecoration(
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.background.withOpacity(0.25),
            Colors.transparent
          ]),
        ),
        color: Theme.of(context).colorScheme.outline.withOpacity(0.05),
        borderRadius: BorderRadius.circular(64)),
    child: Text(text, style: AppTextTheme.bodyStyle),
  );
}
