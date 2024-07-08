import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assetgen {
  const Assetgen();
  SvgGenImage get google =>
      const SvgGenImage('assets/images/authIcons/google.svg');
  SvgGenImage get apple =>
      const SvgGenImage('assets/images/authIcons/apple.svg');
  SvgGenImage get facebook =>
      const SvgGenImage('assets/images/authIcons/facebook.svg');
  SvgGenImage get mail => const SvgGenImage('assets/images/authIcons/mail.svg');
}

class SvgGenImage {
  const SvgGenImage(this._assetName);
  final String _assetName;

  SvgPicture svg(
      {Key? key,
      bool matchTextDirection = false,
      AssetBundle? bundle,
      String? package,
      double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      AlignmentGeometry alignment = Alignment.center,
      bool allowDrawingOutsideViewBox = false,
      WidgetBuilder? placeholderBuilder,
      Color? color,
      BlendMode colorBlendMode = BlendMode.srcIn,
      String? semanticsLabel,
      bool excludeFromSemantics = false,
      Clip clipBehavior = Clip.hardEdge}) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
    );
  }

  String get path => _assetName;
}
