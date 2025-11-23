import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title20MediumInter => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        color: appTheme.black_900,
      );

  TextStyle get title20BoldInter => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
        color: appTheme.black_900,
      );

  TextStyle get title17SemiBoldInter => TextStyle(
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      );

  TextStyle get title17RegularInter => TextStyle(
        fontSize: 17.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        color: appTheme.black_900,
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body14MediumInter => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        color: appTheme.black_900,
      );

  TextStyle get body12ExtraLightInter => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w200,
        fontFamily: 'Inter',
        color: appTheme.black_900,
      );

  TextStyle get body12SemiBoldInter => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      );
}
