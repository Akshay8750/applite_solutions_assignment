import 'package:applite_solutions/bottom_bar_screen.dart';
import 'package:applite_solutions/features/movie/screen/movie_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'generated/l10n.dart';
import 'theme/app_theme.dart';

/// global navigation key
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppSolApp extends StatefulWidget {
  const AppSolApp({super.key});

  @override
  AppSolAppState createState() => AppSolAppState();
}

class AppSolAppState extends State<AppSolApp> {
  @override
  Widget build(BuildContext context) {
    /// initializing the screen unit library and
    /// setting up the design width and height
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          ///Remove Debug tag from top right corner
          debugShowCheckedModeBanner: false,

          ///setup navigation key
          navigatorKey: navigatorKey,

          ///Light theme of the app
          theme: AppTheme.lightTheme,

          ///Dark theme of the app
          darkTheme: AppTheme.darkTheme,

          /// current theme mode of app
          themeMode: ThemeMode.system,

          /// setting up localisation delegates for the app
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          /// this line set up the languages we use in our app
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('en'),

          /// app home page
          home: const BottomBarScreen(),
        );
      },
    );
  }
}
