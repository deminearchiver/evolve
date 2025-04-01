import 'package:example/keep/theme/extended_color.dart';
import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

@immutable
class ExtendedColorsThemeData with Diagnosticable {
  const ExtendedColorsThemeData({
    required this.brightness,
    required this.coral,
    required this.peach,
    required this.sand,
    required this.mint,
    required this.sage,
    required this.fog,
    required this.storm,
    required this.dusk,
    required this.blossom,
    required this.clay,
    required this.chalk,
  });
  factory ExtendedColorsThemeData.from({
    required Brightness brightness,
    DynamicSchemeVariant variant = DynamicSchemeVariant.tonalSpot,
    double contrastLevel = 0.0,
  }) {
    return ExtendedColorsThemeData(
      brightness: brightness,
      coral: ExtendedColor.fromSeed(
        seedColor: StaticColors.coral,
        brightness: brightness,
        variant: variant,
        contrastLevel: contrastLevel,
      ),
      peach: ExtendedColor.fromSeed(
        seedColor: StaticColors.peach,
        brightness: brightness,
        variant: variant,
        contrastLevel: contrastLevel,
      ),
      sand: ExtendedColor.fromSeed(
        seedColor: StaticColors.sand,
        brightness: brightness,
        variant: variant,
        contrastLevel: contrastLevel,
      ),
      mint: ExtendedColor.fromSeed(
        seedColor: StaticColors.mint,
        brightness: brightness,
        variant: variant,
        contrastLevel: contrastLevel,
      ),
      sage: ExtendedColor.fromSeed(
        seedColor: StaticColors.sage,
        brightness: brightness,
        variant: variant,
        contrastLevel: contrastLevel,
      ),
      fog: ExtendedColor.fromSeed(
        seedColor: StaticColors.fog,
        brightness: brightness,
        variant: variant,
        contrastLevel: contrastLevel,
      ),
      storm: ExtendedColor.fromSeed(
        seedColor: StaticColors.storm,
        brightness: brightness,
        variant: variant,
        contrastLevel: contrastLevel,
      ),
      dusk: ExtendedColor.fromSeed(
        seedColor: StaticColors.dusk,
        brightness: brightness,
        variant: variant,
        contrastLevel: contrastLevel,
      ),
      blossom: ExtendedColor.fromSeed(
        seedColor: StaticColors.blossom,
        brightness: brightness,
        variant: variant,
        contrastLevel: contrastLevel,
      ),
      clay: ExtendedColor.fromSeed(
        seedColor: StaticColors.clay,
        brightness: brightness,
        variant: variant,
        contrastLevel: contrastLevel,
      ),
      chalk: ExtendedColor.fromSeed(
        seedColor: StaticColors.chalk,
        brightness: brightness,
        variant: variant,
        contrastLevel: contrastLevel,
      ),
    );
  }
  // const ExtendedColorsThemeData.fromColorTheme(ColorThemeData colorTheme) {

  // }

  final Brightness brightness;
  final ExtendedColor coral;
  final ExtendedColor peach;
  final ExtendedColor sand;
  final ExtendedColor mint;
  final ExtendedColor sage;
  final ExtendedColor fog;
  final ExtendedColor storm;
  final ExtendedColor dusk;
  final ExtendedColor blossom;
  final ExtendedColor clay;
  final ExtendedColor chalk;

  ExtendedColorsThemeData copyWith({
    Brightness? brightness,
    ExtendedColor? coral,
    ExtendedColor? peach,
    ExtendedColor? sand,
    ExtendedColor? mint,
    ExtendedColor? sage,
    ExtendedColor? fog,
    ExtendedColor? storm,
    ExtendedColor? dusk,
    ExtendedColor? blossom,
    ExtendedColor? clay,
    ExtendedColor? chalk,
  }) {
    if (brightness == null &&
        coral == null &&
        peach == null &&
        sand == null &&
        mint == null &&
        sage == null &&
        fog == null &&
        storm == null &&
        dusk == null &&
        blossom == null &&
        clay == null &&
        chalk == null) {
      return this;
    }
    return ExtendedColorsThemeData(
      brightness: brightness ?? this.brightness,
      coral: coral ?? this.coral,
      peach: peach ?? this.peach,
      sand: sand ?? this.sand,
      mint: mint ?? this.mint,
      sage: sage ?? this.sage,
      fog: fog ?? this.fog,
      storm: storm ?? this.storm,
      dusk: dusk ?? this.dusk,
      blossom: blossom ?? this.blossom,
      clay: clay ?? this.clay,
      chalk: chalk ?? this.chalk,
    );
  }

  ExtendedColorsThemeData harmonizeWith(Color sourceColor) {
    return copyWith(
      coral: coral.harmonizeWith(sourceColor),
      peach: peach.harmonizeWith(sourceColor),
      sand: sand.harmonizeWith(sourceColor),
      mint: mint.harmonizeWith(sourceColor),
      sage: sage.harmonizeWith(sourceColor),
      fog: fog.harmonizeWith(sourceColor),
      storm: storm.harmonizeWith(sourceColor),
      dusk: dusk.harmonizeWith(sourceColor),
      blossom: blossom.harmonizeWith(sourceColor),
      clay: clay.harmonizeWith(sourceColor),
      chalk: chalk.harmonizeWith(sourceColor),
    );
  }

  ExtendedColorsThemeData harmonize(ColorThemeData colorTheme) {
    return harmonizeWith(colorTheme.primary);
  }

  ExtendedColorsThemeData unharmonized() => copyWith(
    coral: coral.unharmonized(),
    peach: peach.unharmonized(),
    sand: sand.unharmonized(),
    mint: mint.unharmonized(),
    sage: sage.unharmonized(),
    fog: fog.unharmonized(),
    storm: storm.unharmonized(),
    dusk: dusk.unharmonized(),
    blossom: blossom.unharmonized(),
    clay: clay.unharmonized(),
    chalk: chalk.unharmonized(),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<Brightness>("brightness", brightness));
    properties.add(DiagnosticsProperty<ExtendedColor>("coral", coral));
    properties.add(DiagnosticsProperty<ExtendedColor>("peach", peach));
    properties.add(DiagnosticsProperty<ExtendedColor>("sand", sand));
    properties.add(DiagnosticsProperty<ExtendedColor>("mint", mint));
    properties.add(DiagnosticsProperty<ExtendedColor>("sage", sage));
    properties.add(DiagnosticsProperty<ExtendedColor>("fog", fog));
    properties.add(DiagnosticsProperty<ExtendedColor>("storm", storm));
    properties.add(DiagnosticsProperty<ExtendedColor>("dusk", dusk));
    properties.add(DiagnosticsProperty<ExtendedColor>("blossom", blossom));
    properties.add(DiagnosticsProperty<ExtendedColor>("clay", clay));
    properties.add(DiagnosticsProperty<ExtendedColor>("chalk", chalk));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ExtendedColorsThemeData &&
            brightness == other.brightness &&
            coral == other.coral &&
            peach == other.peach &&
            sand == other.sand &&
            mint == other.mint &&
            sage == other.sage &&
            fog == other.fog &&
            storm == other.storm &&
            dusk == other.dusk &&
            blossom == other.blossom &&
            clay == other.clay &&
            chalk == other.chalk;
  }

  @override
  int get hashCode => Object.hash(
    brightness,
    coral,
    peach,
    sand,
    mint,
    sage,
    fog,
    storm,
    dusk,
    blossom,
    clay,
    chalk,
  );
}

/// Colors from the Google Keep app resources manifest
abstract final class StaticColors {
  static const Color blossom = Color(0xFFf6e2dd);
  static const Color chalk = Color(0xFFefeff1);
  static const Color clay = Color(0xFFe9e3d4);
  static const Color coral = Color(0xFFfaafa8);
  static const Color dusk = Color(0xFFd3bfdb);
  static const Color fog = Color(0xFFd4e4ed);
  static const Color mint = Color(0xFFe2f6d3);
  static const Color peach = Color(0xFFf39f76);
  static const Color sage = Color(0xFFb4ddd3);
  static const Color sand = Color(0xFFfff8b8);
  static const Color storm = Color(0xFFaeccdc);
}

/// Colors from the Google Keep app resources manifest
abstract final class StaticColorsNight {
  static const Color blossom = Color(0xFF6c394f);
  static const Color chalk = Color(0xFF232427);
  static const Color clay = Color(0xFF4b443a);
  static const Color coral = Color(0xFF77172e);
  static const Color dusk = Color(0xFF472e5b);
  static const Color fog = Color(0xFF256377);
  static const Color mint = Color(0xFF264d3b);
  static const Color peach = Color(0xFF692b17);
  static const Color sage = Color(0xFF0c625d);
  static const Color sand = Color(0xFF7c4a03);
  static const Color storm = Color(0xFF284255);
}

/// Colors from Figma
abstract final class StaticColorsNew {
  static const Color yellow = Color(0xFFFFF8B9);
  static const Color blue = Color(0xFFB4DED4);
  static const Color green = Color(0xFFE2F6D3);
  static const Color red = Color(0xFFFAAFA9);
}

class ExtendedColorsTheme extends InheritedTheme {
  const ExtendedColorsTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final ExtendedColorsThemeData data;

  @override
  bool updateShouldNotify(covariant ExtendedColorsTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ExtendedColorsTheme(data: data, child: child);
  }

  ExtendedColorsThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ExtendedColorsTheme>()
        ?.data;
  }

  ExtendedColorsThemeData of(BuildContext context) {
    final result = maybeOf(context);
    if (result != null) return result;
    final colorTheme = ColorTheme.of(context);
    return ExtendedColorsThemeData.from(
      brightness: colorTheme.brightness,
      variant: DynamicSchemeVariant.tonalSpot,
      contrastLevel: ColorThemeData.contrastLevelNormal,
    ).harmonize(colorTheme);
  }
}
