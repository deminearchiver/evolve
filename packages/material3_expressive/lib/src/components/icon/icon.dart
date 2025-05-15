import 'package:flutter/material.dart' hide IconTheme, IconThemeData;
import 'package:material3_expressive/src/components/button/icon_button.dart';

import 'icon_theme.dart';

Icon? _icon;

class Icon extends StatelessWidget {
  const Icon(
    this.icon, {
    super.key,
    this.color,
    this.size,
    this.weight,
    this.wght,
    this.grad,
    this.opsz,
    this.fill,
  });

  final IconData? icon;

  final Color? color;
  final double? size;
  final FontWeight? weight;
  final double? wght;
  final double? grad;
  final double? opsz;
  final double? fill;

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);
    final iconTheme = IconTheme.of(context);
    final applyTextScaling = false;
    final tentativeIconSize = size ?? iconTheme.size;
    final iconSize = applyTextScaling
        ? MediaQuery.textScalerOf(context).scale(tentativeIconSize)
        : tentativeIconSize;
    final iconWeight = weight ?? iconTheme.weight;
    final iconWght = wght ?? iconTheme.wght;
    final iconGrad = grad ?? iconTheme.grad;
    final iconOpsz = opsz ?? iconTheme.opsz;
    final iconFill = fill ?? iconTheme.fill;
    final icon = this.icon;
    if (icon == null) {
      return Semantics(
        label: "",
        child: SizedBox.square(dimension: iconSize),
      );
    }
    final iconColor = color ?? iconTheme.color;
    final fontStyle = TextStyle(
      fontVariations: <FontVariation>[
        FontVariation("wght", iconWght),
        FontVariation("GRAD", iconGrad),
        FontVariation("opsz", iconOpsz),
        FontVariation("FILL", iconFill),
      ],
      inherit: false,
      color: iconColor,
      fontSize: iconSize,
      fontFamily: icon.fontFamily,
      fontWeight: iconWeight,
      package: icon.fontPackage,
      fontFamilyFallback: icon.fontFamilyFallback,
      shadows: const [],
      height: 1.0,
      leadingDistribution: TextLeadingDistribution.even,
    );
    Widget iconWidget = RichText(
      overflow: TextOverflow.visible,
      textDirection: textDirection,
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: fontStyle,
      ),
    );
    if (icon.matchTextDirection && textDirection == TextDirection.rtl) {
      iconWidget = Transform.flip(
        flipX: true,
        transformHitTests: false,
        child: iconWidget,
      );
    }

    return Semantics(
      label: "",
      child: ExcludeSemantics(
        child: SizedBox.square(
          dimension: iconSize,
          child: Align(alignment: Alignment.center, child: iconWidget),
        ),
      ),
    );
  }
}
