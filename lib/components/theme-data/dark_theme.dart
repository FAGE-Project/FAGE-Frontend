import 'package:flutter/material.dart';

class DarkThemeData {
  ThemeData get themeData {
    const mainColor = Color.fromARGB(255, 39, 41, 47);
    const highlightColor = Color.fromARGB(255, 78, 173, 171);
    const textColor = Color.fromARGB(255, 253, 253, 254);

    const textTheme = TextTheme(
      titleMedium: TextStyle(
          color: textColor, fontSize: 18, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(color: textColor, fontSize: 22),
      titleSmall: TextStyle(color: textColor, fontSize: 18),
      bodyMedium: TextStyle(
          color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(color: textColor, fontSize: 18),
      bodySmall: TextStyle(color: textColor, fontSize: 18),
      labelLarge: TextStyle(color: textColor, fontSize: 18),
      labelMedium: TextStyle(
          color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
          color: textColor, fontSize: 12, fontWeight: FontWeight.w100),
    );

    var colorScheme = ColorScheme(
        brightness: Brightness.dark,
        primary: highlightColor,
        onPrimary: mainColor,
        secondary: textColor,
        onSecondary: textColor,
        error: textColor,
        onError: textColor,
        background: mainColor,
        onBackground: mainColor,
        surface: mainColor,
        outlineVariant: highlightColor,
        onSurface: textColor);

    var inputDecorationTheme = InputDecorationTheme(
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textColor, width: 0.0),
        ));

    PopupMenuThemeData popupMenuThemeData = PopupMenuThemeData(
        color: Colors.black,
        labelTextStyle: MaterialStatePropertyAll(TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)));

    BottomNavigationBarThemeData bottomNavigationBarThemeData =
        const BottomNavigationBarThemeData(
            unselectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(color: Colors.white),
            selectedItemColor: Colors.white);

    ListTileThemeData listTileThemeData = ListTileThemeData(
        titleTextStyle: textTheme.titleMedium);

    ProgressIndicatorThemeData progressIndicatorThemeData =
        const ProgressIndicatorThemeData(circularTrackColor: Colors.white);
    IconThemeData iconThemeData = const IconThemeData(color: Colors.white);
    DialogTheme dialogTheme = DialogTheme(
        titleTextStyle: TextStyle(fontSize: 18, color: Colors.white));
    TextButtonThemeData textButtonTheme = TextButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 18)),
            foregroundColor: const MaterialStatePropertyAll(Colors.white)));
    IconButtonThemeData iconButtonTheme = IconButtonThemeData(
        style: ButtonStyle(
            iconColor: const MaterialStatePropertyAll(Colors.white),
            minimumSize: const MaterialStatePropertyAll(Size.fromRadius(22)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))));
    Color scaffoldBackgroundColor = Colors.black;
    bool applyElevationOverlayColor = false;
    AppBarTheme appBarTheme = AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white),
    );
    bool useMaterial3 = true;
    OutlinedButtonThemeData outlinedButtonTheme = const OutlinedButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(Colors.white),
    ));
    var bottomSheetTheme =
        const BottomSheetThemeData(shape: BeveledRectangleBorder());

    return ThemeData.from(colorScheme: colorScheme, useMaterial3: true)
        .copyWith(
            dividerColor: Colors.transparent,
            bottomSheetTheme: bottomSheetTheme,
            inputDecorationTheme: inputDecorationTheme,
            listTileTheme: listTileThemeData);
  }
}
