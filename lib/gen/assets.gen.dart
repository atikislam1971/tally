// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/favicon.png
  AssetGenImage get favicon => const AssetGenImage('assets/images/favicon.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [favicon, logo];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/bell.svg
  String get bell => 'assets/svg/bell.svg';

  /// File path: assets/svg/book.svg
  String get book => 'assets/svg/book.svg';

  /// File path: assets/svg/business_filled.svg
  String get businessFilled => 'assets/svg/business_filled.svg';

  /// File path: assets/svg/cash_box.svg
  String get cashBox => 'assets/svg/cash_box.svg';

  /// File path: assets/svg/crown.svg
  String get crown => 'assets/svg/crown.svg';

  /// File path: assets/svg/cube.svg
  String get cube => 'assets/svg/cube.svg';

  /// File path: assets/svg/download.svg
  String get download => 'assets/svg/download.svg';

  /// File path: assets/svg/filter.svg
  String get filter => 'assets/svg/filter.svg';

  /// File path: assets/svg/message.svg
  String get message => 'assets/svg/message.svg';

  /// File path: assets/svg/message_top.svg
  String get messageTop => 'assets/svg/message_top.svg';

  /// File path: assets/svg/notes.svg
  String get notes => 'assets/svg/notes.svg';

  /// File path: assets/svg/onboard_calculator.svg
  String get onboardCalculator => 'assets/svg/onboard_calculator.svg';

  /// File path: assets/svg/onboard_qrcode.svg
  String get onboardQrcode => 'assets/svg/onboard_qrcode.svg';

  /// File path: assets/svg/product.svg
  String get product => 'assets/svg/product.svg';

  /// File path: assets/svg/stock.svg
  String get stock => 'assets/svg/stock.svg';

  /// File path: assets/svg/super_qr.svg
  String get superQr => 'assets/svg/super_qr.svg';

  /// File path: assets/svg/support.svg
  String get support => 'assets/svg/support.svg';

  /// File path: assets/svg/upload.svg
  String get upload => 'assets/svg/upload.svg';

  /// List of all assets
  List<String> get values => [
    bell,
    book,
    businessFilled,
    cashBox,
    crown,
    cube,
    download,
    filter,
    message,
    messageTop,
    notes,
    onboardCalculator,
    onboardQrcode,
    product,
    stock,
    superQr,
    support,
    upload,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
