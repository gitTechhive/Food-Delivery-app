import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constant/food_colors.dart';

abstract class FoodTheme {
  static const double letterSpacing = 0.3;
  static const double letterHeight = 1.5;

  static var fontFamily = 'Urbanist';

  static final ThemeData foodLightTheme = ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: whiteColor,
          primaryColor: foodColorPrimary,
          primaryColorDark: foodColorPrimary,
          hoverColor: Colors.white54,
          dividerColor: viewLineColor,
          fontFamily: fontFamily,
          bottomNavigationBarTheme:
              const BottomNavigationBarThemeData(backgroundColor: whiteColor),
          appBarTheme: const AppBarTheme(
            actionsIconTheme: IconThemeData(color: Colors.black),
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: whiteColor,
            titleTextStyle: TextStyle(color: Colors.black),
          ),
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: Colors.black),
          colorScheme: const ColorScheme.light(primary: Colors.white),
          cardTheme: const CardTheme(color: Colors.white),
          cardColor: cardLightColor,
          iconTheme: const IconThemeData(color: Colors.black),
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: whiteColor),
          primaryTextTheme: TextTheme(
              titleLarge: TextStyle(
                color: foodTextColor,
                letterSpacing: letterSpacing,
                height: letterHeight,
                fontFamily: fontFamily,
              ),
              labelSmall: TextStyle(
                  fontFamily: fontFamily,
                  color: foodTextColor,
                  letterSpacing: letterSpacing,
                  height: letterHeight)),
          textTheme: TextTheme(
            displayLarge: TextStyle(
              fontSize: 48.0,
              color: foodTextColor,
              fontFamily: fontFamily,
            ),
            displayMedium: TextStyle(
              fontSize: 40.0,
              color: foodTextColor,
              fontFamily: fontFamily,
            ),
            displaySmall: TextStyle(
              fontSize: 32.0,
              color: foodTextColor,
              fontFamily: fontFamily,
            ),
            headlineMedium: TextStyle(
              fontSize: 24.0,
              fontFamily: fontFamily,
              color: foodTextColor,
            ),
            headlineSmall: TextStyle(
              fontSize: 20.0,
              color: foodTextColor,
              fontFamily: fontFamily,
            ),
            titleLarge: TextStyle(
              fontSize: 18.0,
              color: foodTextColor,
              fontFamily: fontFamily,
            ),
            bodyLarge: TextStyle(
              fontSize: 16.0,
              color: foodTextColor,
              fontFamily: fontFamily,
            ),
            bodyMedium: TextStyle(
              fontSize: 14.0,
              color: foodTextColor,
              fontFamily: fontFamily,
            ),
            bodySmall: TextStyle(
              fontSize: 12.0,
              color: foodTextColor,
              fontFamily: fontFamily,
            ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          popupMenuTheme: const PopupMenuThemeData(color: whiteColor))
      .copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
        }),
  );

  static final ThemeData foodDarkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: foodDarkPrimary,
    highlightColor: foodDarkPrimary,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: foodDarkPrimary),
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(color: whiteColor),
      titleTextStyle: TextStyle(color: Colors.white),
      backgroundColor: foodDarkPrimary,
      iconTheme: IconThemeData(color: whiteColor),
    ),
    primaryColor: foodDarkPrimary,
    dividerColor: const Color(0xFFDADADA).withOpacity(0.3),
    primaryColorDark: foodDarkPrimary,
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white, selectionColor: Colors.white),
    hoverColor: Colors.black12,
    fontFamily: fontFamily,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: foodDarkPrimary),
    primaryTextTheme: TextTheme(
        titleLarge: TextStyle(
            color: Colors.white,
            letterSpacing: letterSpacing,
            fontFamily: fontFamily,
            height: letterHeight),
        labelSmall: TextStyle(
            color: Colors.white,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            height: letterHeight)),
    cardTheme: const CardTheme(color: foodDarkPrimary),
    cardColor: foodCardDark,
    iconTheme: const IconThemeData(color: whiteColor),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 48.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      displayMedium: TextStyle(
        fontSize: 40.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      displaySmall: TextStyle(
        fontSize: 32.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      titleLarge: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontFamily: fontFamily,
        // letterSpacing: 1.5
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
    ),
    popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.dark(
            primary: foodDarkPrimary, onPrimary: foodCardDark)
        .copyWith(secondary: whiteColor),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
        }),
  );
}
