import 'package:flutter/material.dart';

class MediaQueryUtils{
  static late MediaQueryData _mediaQueryData;
  static void initialize(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
  }
  static double get width => _mediaQueryData.size.width;
  static double get height => _mediaQueryData.size.height;
  static double get statusBarHeight => _mediaQueryData.padding.top;
  static double get statusBarWidth => _mediaQueryData.padding.bottom + _mediaQueryData.viewInsets.bottom;

  static double get safeAreaHeight => _mediaQueryData.size.height - _mediaQueryData.padding.top - _mediaQueryData.padding.bottom;

  static double responsiveWidth(double fraction) => width * fraction;
  static double responsiveHeight(double fraction) => height * fraction;

  static bool get isMobile => width < 600;
  static bool get isTablet => width >= 600 && width < 1200;
  static bool get isDesktop => width >= 1200;
}