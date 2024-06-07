import 'package:flutter/material.dart';
import 'package:theeco/app/shared/utilities/colors/the_colors.dart';

class TheStyles {
  // Text Styles from Family
  static const String fromFamily = 'din_next_tl_arabic_regular';

  // Text Styles
  static const TextStyle title = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle subtitle = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle body = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontSize: 14,
  );
  static const TextStyle caption = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.textLight,
    fontSize: 12,
  );
  static const TextStyle button = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.textLight,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle link = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.primary,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  // small
  static const sRegular = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static const sMedium = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static const sSemiBold = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w600,
    fontSize: 12,
  );

  static const sBold = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w700,
    fontSize: 12,
  );

  // medium
  static const mRegular = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static const mMedium = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const mSemiBold = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  static const mBold = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  // large
  static const lRegular = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const lMedium = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const lSemiBold = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const lBold = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  // extra large
  static const xlRegular = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  static const xlMedium = TextStyle(
    fontFamily: fromFamily,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  static const xlSemiBold = TextStyle(
    fontFamily: fromFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static const xlBold = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  // extra extra large
  static const xxlRegular = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );

  static const xxlMedium = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );

  static const xxlSemiBold = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static const xxlBold = TextStyle(
    fontFamily: fromFamily,
    color: TheColors.text,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );

  static const AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: TheColors.backgroundLight,
    elevation: 0,
    iconTheme: IconThemeData(
      color: TheColors.textDark,
    ),
    scrolledUnderElevation: 0,
  );

  // Button Styles
  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    labelStyle: TextStyle(
      color: TheColors.textLight,
    ),
    hintStyle: TextStyle(
      color: TheColors.textLight,
    ),
    errorStyle: TextStyle(
      color: TheColors.textDark,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: TheColors.primary,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: TheColors.textLight,
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: TheColors.textDark,
      ),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: TheColors.textDark,
      ),
    ),
  );

  // Button Styles
  static ButtonStyle buttonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(TheColors.primary),
    foregroundColor: WidgetStateProperty.all<Color>(TheColors.textLight),
    overlayColor: WidgetStateProperty.all<Color>(TheColors.primaryDark),
    shadowColor: WidgetStateProperty.all<Color>(TheColors.primaryLight),
    elevation: WidgetStateProperty.all<double>(4),
    textStyle: WidgetStateProperty.all<TextStyle>(TheStyles.button),
    shape: WidgetStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  // Button Styles
  static ButtonStyle linkStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    foregroundColor: WidgetStateProperty.all<Color>(TheColors.primary),
    overlayColor: WidgetStateProperty.all<Color>(TheColors.primaryLight),
    shadowColor: WidgetStateProperty.all<Color>(TheColors.primaryDark),
    elevation: WidgetStateProperty.all<double>(0),
    textStyle: WidgetStateProperty.all<TextStyle>(TheStyles.link),
    shape: WidgetStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  // Button Styles
  static ButtonStyle linkStyleDark = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    foregroundColor: WidgetStateProperty.all<Color>(TheColors.primary),
    overlayColor: WidgetStateProperty.all<Color>(TheColors.primaryLight),
    shadowColor: WidgetStateProperty.all<Color>(TheColors.primaryDark),
    elevation: WidgetStateProperty.all<double>(0),
    textStyle: WidgetStateProperty.all<TextStyle>(TheStyles.link),
    shape: WidgetStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  // Button Styles
  static ButtonStyle linkStyleLight = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    foregroundColor: WidgetStateProperty.all<Color>(TheColors.primary),
    overlayColor: WidgetStateProperty.all<Color>(TheColors.primaryLight),
    shadowColor: WidgetStateProperty.all<Color>(TheColors.primaryDark),
    elevation: WidgetStateProperty.all<double>(0),
    textStyle: WidgetStateProperty.all<TextStyle>(TheStyles.link),
    shape: WidgetStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
