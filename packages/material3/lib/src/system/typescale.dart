import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material3/src/reference/typeface.dart';

class TypescalePartial with Diagnosticable {
  const TypescalePartial({
    this.font,
    this.size,
    this.weight,
    this.weightProminent,
    this.lineHeight,
    this.tracking,
  });

  factory TypescalePartial.fromTextStyle(TextStyle textStyle) {
    final font =
        textStyle.fontFamily != null || textStyle.fontFamilyFallback != null
        ? [
            if (textStyle.fontFamily case final fontFamily?) fontFamily,
            if (textStyle.fontFamilyFallback case final fontFamilyFallback?)
              ...fontFamilyFallback,
          ]
        : null;
    final variations = textStyle.fontVariations;
    final weightVariation = variations?.firstWhere(
      (value) => value.axis == "wght",
    );
    final weight =
        weightVariation?.value ?? textStyle.fontWeight?.value.toDouble();

    final size = textStyle.fontSize;
    final height = textStyle.height;
    final lineHeight = size != null && height != null ? height * size : null;
    final tracking = textStyle.letterSpacing;
    return TypescalePartial(
      font: font,
      weight: weight,
      weightProminent: weight,
      size: size,
      lineHeight: lineHeight,
      tracking: tracking,
    );
  }

  final List<String>? font;
  final double? size;
  final double? weight;
  final double? weightProminent;
  final double? lineHeight;
  final double? tracking;

  TypescalePartial copyWith({
    covariant List<String>? font,
    covariant double? size,
    covariant double? weight,
    covariant double? weightProminent,
    covariant double? lineHeight,
    covariant double? tracking,
  }) {
    if (font == null &&
        size == null &&
        weight == null &&
        weightProminent == null &&
        lineHeight == null &&
        tracking == null) {
      return this;
    }
    return TypescalePartial(
      font: font ?? this.font,
      size: size ?? this.size,
      weight: weight ?? this.weight,
      weightProminent: weightProminent ?? this.weightProminent,
      lineHeight: lineHeight ?? this.lineHeight,
      tracking: tracking ?? this.tracking,
    );
  }

  TypescalePartial apply({
    List<String>? font,
    double? size,
    double? weight,
    double? weightProminent,
    double? lineHeight,
    double? tracking,
  }) {
    if (font == null &&
        size == null &&
        weight == null &&
        weightProminent == null &&
        lineHeight == null &&
        tracking == null) {
      return this;
    }
    return TypescalePartial(
      font: font != null ? [...font, ...?this.font] : this.font,
      size: size ?? this.size,
      weight: weight ?? this.weight,
      weightProminent: weightProminent ?? this.weightProminent,
      lineHeight: lineHeight ?? this.lineHeight,
      tracking: tracking ?? this.tracking,
    );
  }

  TypescalePartial merge(TypescalePartial? other) {
    if (other == null) return this;
    return apply(
      font: other.font,
      size: other.size,
      weight: other.weight,
      weightProminent: other.weightProminent,
      lineHeight: other.lineHeight,
      tracking: other.tracking,
    );
  }

  TextStyle toTextStyle() {
    final font = this.font;
    final fontSize = size;
    final lineHeight = this.lineHeight;
    final fontWeight = weight;
    final discreteFontWeight =
        fontWeight != null && fontWeight == fontWeight.roundToDouble()
        ? FontWeight.values.firstWhereOrNull(
            (value) => value.value == fontWeight,
          )
        : null;
    return TextStyle(
      fontFamily: font?.firstOrNull,
      fontFamilyFallback: font?.skip(1).toList(),
      fontWeight: discreteFontWeight,
      fontVariations: [
        if (fontWeight != null && discreteFontWeight == null)
          FontVariation.weight(fontWeight),
      ],
      fontSize: fontSize,
      height: fontSize != null && lineHeight != null
          ? lineHeight / fontSize
          : null,
      letterSpacing: tracking,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TypescalePartial &&
            listEquals(font, other.font) &&
            size == other.size &&
            weight == other.weight &&
            weightProminent == other.weightProminent &&
            lineHeight == other.lineHeight &&
            tracking == other.tracking;
  }

  @override
  int get hashCode => Object.hash(
    font != null ? Object.hashAll(font!) : null,
    size,
    weight,
    weightProminent,
    lineHeight,
    tracking,
  );
}

class Typescale with Diagnosticable implements TypescalePartial {
  const Typescale({
    required this.font,
    required this.size,
    required this.weight,
    double? weightProminent,
    required this.lineHeight,
    required this.tracking,
  }) : assert(font.length >= 1),
       weightProminent = weightProminent ?? weight;

  factory Typescale.fromTextStyle(TextStyle textStyle) {
    assert(
      textStyle.fontFamily != null ||
          (textStyle.fontFamilyFallback != null &&
              textStyle.fontFamilyFallback!.isNotEmpty),
    );
    assert(
      (textStyle.fontVariations != null &&
              textStyle.fontVariations!.any((value) => value.axis == "wght")) ||
          textStyle.fontWeight != null,
    );
    assert(textStyle.fontSize != null);
    assert(textStyle.height != null);
    assert(textStyle.letterSpacing != null);

    final font = [
      if (textStyle.fontFamily case final fontFamily?) fontFamily,
      if (textStyle.fontFamilyFallback case final fontFamilyFallback?)
        ...fontFamilyFallback,
    ];
    final variations = textStyle.fontVariations;
    final weightVariation = variations?.firstWhere(
      (value) => value.axis == "wght",
    );
    final weight =
        weightVariation?.value ?? textStyle.fontWeight!.value.toDouble();

    final size = textStyle.fontSize!;
    final height = textStyle.height!;
    final lineHeight = height * size;
    final tracking = textStyle.letterSpacing!;
    return Typescale(
      font: font,
      weight: weight,
      weightProminent: weight,
      size: size,
      lineHeight: lineHeight,
      tracking: tracking,
    );
  }

  @override
  final List<String> font;

  @override
  final double size;

  @override
  final double weight;

  @override
  final double weightProminent;

  @override
  final double lineHeight;

  @override
  final double tracking;

  @override
  Typescale copyWith({
    covariant List<String>? font,
    covariant double? size,
    covariant double? weight,
    covariant double? weightProminent,
    covariant double? lineHeight,
    covariant double? tracking,
  }) {
    if (font == null &&
        size == null &&
        weight == null &&
        weightProminent == null &&
        lineHeight == null &&
        tracking == null) {
      return this;
    }
    return Typescale(
      font: font ?? this.font,
      size: size ?? this.size,
      weight: weight ?? this.weight,
      weightProminent: weightProminent ?? this.weightProminent,
      lineHeight: lineHeight ?? this.lineHeight,
      tracking: tracking ?? this.tracking,
    );
  }

  @override
  Typescale apply({
    List<String>? font,
    double? size,
    double? weight,
    double? weightProminent,
    double? lineHeight,
    double? tracking,
  }) {
    if (font == null &&
        size == null &&
        weight == null &&
        weightProminent == null &&
        lineHeight == null &&
        tracking == null) {
      return this;
    }
    return Typescale(
      font: font != null ? [...font, ...this.font] : this.font,
      size: size ?? this.size,
      weight: weight ?? this.weight,
      weightProminent: weightProminent ?? this.weightProminent,
      lineHeight: lineHeight ?? this.lineHeight,
      tracking: tracking ?? this.tracking,
    );
  }

  @override
  Typescale merge(TypescalePartial? other) {
    if (other == null) return this;
    return apply(
      font: other.font,
      size: other.size,
      weight: other.weight,
      weightProminent: other.weightProminent,
      lineHeight: other.lineHeight,
      tracking: other.tracking,
    );
  }

  @override
  TextStyle toTextStyle() {
    final fontWeight = weight;
    final discreteFontWeight = fontWeight == fontWeight.roundToDouble()
        ? FontWeight.values.firstWhereOrNull(
            (value) => value.value == fontWeight,
          )
        : null;
    return TextStyle(
      fontFamily: font.firstOrNull,
      fontFamilyFallback: font.skip(1).toList(),
      fontWeight: discreteFontWeight,
      fontVariations: [
        if (discreteFontWeight == null) FontVariation.weight(fontWeight),
      ],
      fontSize: size,
      height: lineHeight / size,
      letterSpacing: tracking,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Typescale &&
            listEquals(font, other.font) &&
            size == other.size &&
            weight == other.weight &&
            weightProminent == other.weightProminent &&
            lineHeight == other.lineHeight &&
            tracking == other.tracking;
  }

  @override
  int get hashCode => Object.hash(
    Object.hashAll(font),
    size,
    weight,
    weightProminent,
    lineHeight,
    tracking,
  );
}

// extension on TextStyle {
//   TypescalePartial _toTypescalePartial() {
//     return TypescalePartial(
//       font: [
//         if (fontFamily case final fontFamily?) fontFamily,
//         if (fontFamilyFallback case final fontFamilyFallback?)
//           ...fontFamilyFallback,
//       ],
//       size: fontSize,
//       weight: fontWeight?.value.toDouble(),
//       lineHeight: switch (this) {
//         TextStyle(:final fontSize?, :final height?) => fontSize * height,
//         _ => null,
//       },
//       tracking: letterSpacing,
//     );
//   }

//   Typescale _toTypescale() {
//     assert(
//       fontSize != null &&
//           fontWeight != null &&
//           height != null &&
//           letterSpacing != null,
//       "TextStyle._toTypeScale can only be called from a concrete TextStyle",
//     );
//     assert(fontFamily != null || fontFamilyFallback != null);
//     return Typescale(
//       font: [
//         if (fontFamily case final fontFamily?) fontFamily,
//         if (fontFamilyFallback case final fontFamilyFallback?)
//           ...fontFamilyFallback,
//       ],
//       size: fontSize!,
//       weight: fontWeight!.value.toDouble(),
//       lineHeight: fontSize! * height!,
//       tracking: letterSpacing!,
//     );
//   }
// }

class TypescaleStyleThemeDataPartial with Diagnosticable {
  const TypescaleStyleThemeDataPartial({this.large, this.medium, this.small});

  final TypescalePartial? large;
  final TypescalePartial? medium;
  final TypescalePartial? small;

  TypescaleStyleThemeDataPartial copyWith({
    covariant TypescalePartial? large,
    covariant TypescalePartial? medium,
    covariant TypescalePartial? small,
  }) {
    if (large == null && medium == null && small == null) {
      return this;
    }
    return TypescaleStyleThemeDataPartial(
      large: large ?? this.large,
      medium: medium ?? this.medium,
      small: small ?? this.small,
    );
  }

  TypescaleStyleThemeDataPartial apply({
    TypescalePartial? large,
    TypescalePartial? medium,
    TypescalePartial? small,
  }) {
    if (large == null && medium == null && small == null) {
      return this;
    }
    return TypescaleStyleThemeDataPartial(
      large: this.large?.merge(large) ?? large,
      medium: this.medium?.merge(medium) ?? medium,
      small: this.small?.merge(small) ?? small,
    );
  }

  TypescaleStyleThemeDataPartial merge(TypescaleStyleThemeDataPartial? other) {
    if (other == null) return this;
    return apply(large: other.large, medium: other.medium, small: other.small);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TypescaleStyleThemeDataPartial &&
            large == other.large &&
            medium == other.medium &&
            small == other.small;
  }

  @override
  int get hashCode => Object.hash(large, medium, small);
}

class TypescaleStyleThemeData
    with Diagnosticable
    implements TypescaleStyleThemeDataPartial {
  const TypescaleStyleThemeData({
    required this.large,
    required this.medium,
    required this.small,
  });

  @override
  final Typescale large;

  @override
  final Typescale medium;

  @override
  final Typescale small;

  @override
  TypescaleStyleThemeData copyWith({
    covariant Typescale? large,
    covariant Typescale? medium,
    covariant Typescale? small,
  }) {
    if (large == null && medium == null && small == null) {
      return this;
    }
    return TypescaleStyleThemeData(
      large: large ?? this.large,
      medium: medium ?? this.medium,
      small: small ?? this.small,
    );
  }

  @override
  TypescaleStyleThemeData apply({
    TypescalePartial? large,
    TypescalePartial? medium,
    TypescalePartial? small,
  }) {
    if (large == null && medium == null && small == null) {
      return this;
    }
    return TypescaleStyleThemeData(
      large: this.large.merge(large),
      medium: this.medium.merge(medium),
      small: this.small.merge(small),
    );
  }

  @override
  TypescaleStyleThemeData merge(TypescaleStyleThemeDataPartial? other) {
    if (other == null) return this;
    return apply(large: other.large, medium: other.medium, small: other.small);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TypescaleStyleThemeData &&
            large == other.large &&
            medium == other.medium &&
            small == other.small;
  }

  @override
  int get hashCode => Object.hash(large, medium, small);
}

class TypescaleThemeDataPartial with Diagnosticable {
  const TypescaleThemeDataPartial({
    this.display,
    this.headline,
    this.title,
    this.body,
    this.label,
  });

  final TypescaleStyleThemeDataPartial? display;

  final TypescaleStyleThemeDataPartial? headline;

  final TypescaleStyleThemeDataPartial? title;

  final TypescaleStyleThemeDataPartial? body;

  final TypescaleStyleThemeDataPartial? label;

  TypescaleThemeDataPartial copyWith({
    covariant TypescaleStyleThemeDataPartial? display,
    covariant TypescaleStyleThemeDataPartial? headline,
    covariant TypescaleStyleThemeDataPartial? title,
    covariant TypescaleStyleThemeDataPartial? body,
    covariant TypescaleStyleThemeDataPartial? label,
  }) {
    if (display == null &&
        headline == null &&
        title == null &&
        body == null &&
        label == null) {
      return this;
    }
    return TypescaleThemeDataPartial(
      display: display ?? this.display,
      headline: headline ?? this.headline,
      title: title ?? this.title,
      body: body ?? this.body,
      label: label ?? this.label,
    );
  }

  TypescaleThemeDataPartial apply({
    TypescaleStyleThemeDataPartial? display,
    TypescaleStyleThemeDataPartial? headline,
    TypescaleStyleThemeDataPartial? title,
    TypescaleStyleThemeDataPartial? body,
    TypescaleStyleThemeDataPartial? label,
  }) {
    if (display == null &&
        headline == null &&
        title == null &&
        body == null &&
        label == null) {
      return this;
    }
    return TypescaleThemeDataPartial(
      display: this.display?.merge(display) ?? display,
      headline: this.headline?.merge(headline) ?? headline,
      title: this.title?.merge(title) ?? title,
      body: this.body?.merge(body) ?? body,
      label: this.label?.merge(label) ?? label,
    );
  }

  TypescaleThemeDataPartial merge(TypescaleThemeDataPartial? other) {
    if (other == null) return this;
    return apply(
      display: other.display,
      headline: other.headline,
      title: other.title,
      body: other.body,
      label: other.label,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TypescaleThemeDataPartial &&
            display == other.display &&
            headline == other.headline &&
            title == other.title &&
            body == other.body &&
            label == other.label;
  }

  @override
  int get hashCode => Object.hash(display, headline, title, body, label);
}

class TypescaleThemeData
    with Diagnosticable
    implements TypescaleThemeDataPartial {
  const TypescaleThemeData({
    required this.display,
    required this.headline,
    required this.title,
    required this.body,
    required this.label,
  });

  factory TypescaleThemeData.fallback({required BuildContext context}) =
      _TypescaleThemeDataFallback;

  @override
  final TypescaleStyleThemeData display;

  @override
  final TypescaleStyleThemeData headline;

  @override
  final TypescaleStyleThemeData title;

  @override
  final TypescaleStyleThemeData body;

  @override
  final TypescaleStyleThemeData label;

  @override
  TypescaleThemeData copyWith({
    covariant TypescaleStyleThemeData? display,
    covariant TypescaleStyleThemeData? headline,
    covariant TypescaleStyleThemeData? title,
    covariant TypescaleStyleThemeData? body,
    covariant TypescaleStyleThemeData? label,
  }) {
    if (display == null &&
        headline == null &&
        title == null &&
        body == null &&
        label == null) {
      return this;
    }
    return TypescaleThemeData(
      display: display ?? this.display,
      headline: headline ?? this.headline,
      title: title ?? this.title,
      body: body ?? this.body,
      label: label ?? this.label,
    );
  }

  @override
  TypescaleThemeData apply({
    TypescaleStyleThemeDataPartial? display,
    TypescaleStyleThemeDataPartial? headline,
    TypescaleStyleThemeDataPartial? title,
    TypescaleStyleThemeDataPartial? body,
    TypescaleStyleThemeDataPartial? label,
  }) {
    if (display == null &&
        headline == null &&
        title == null &&
        body == null &&
        label == null) {
      return this;
    }
    return TypescaleThemeData(
      display: this.display.merge(display),
      headline: this.headline.merge(headline),
      title: this.title.merge(title),
      body: this.body.merge(body),
      label: this.label.merge(label),
    );
  }

  @override
  TypescaleThemeData merge(TypescaleThemeDataPartial? other) {
    if (other == null) return this;
    return apply(
      display: other.display,
      headline: other.headline,
      title: other.title,
      body: other.body,
      label: other.label,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TypescaleThemeData &&
            display == other.display &&
            headline == other.headline &&
            title == other.title &&
            body == other.body &&
            label == other.label;
  }

  @override
  int get hashCode => Object.hash(display, headline, title, body, label);
}

class TypescaleTheme extends InheritedTheme {
  const TypescaleTheme({super.key, required this.data, required super.child});

  final TypescaleThemeData data;

  @override
  bool updateShouldNotify(covariant TypescaleTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TypescaleTheme(data: data, child: child);
  }

  static Widget merge({
    Key? key,
    required TypescaleThemeDataPartial data,
    required Widget child,
  }) {
    return Builder(
      builder: (context) =>
          TypescaleTheme(key: key, data: of(context).merge(data), child: child),
    );
  }

  static TypescaleThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TypescaleTheme>()?.data;
  }

  static TypescaleThemeData of(BuildContext context) {
    final result = maybeOf(context);
    if (result != null) return result;

    final fallbackTypescaleTheme = TypescaleThemeData.fallback(
      context: context,
    );

    final textTheme = TextTheme.of(context);
    final textThemeBasedTypescaleTheme = TypescaleThemeDataPartial(
      display: TypescaleStyleThemeDataPartial(
        large: textTheme.displayLarge != null
            ? TypescalePartial.fromTextStyle(textTheme.displayLarge!)
            : null,
        medium: textTheme.displayMedium != null
            ? TypescalePartial.fromTextStyle(textTheme.displayMedium!)
            : null,
        small: textTheme.displaySmall != null
            ? TypescalePartial.fromTextStyle(textTheme.displaySmall!)
            : null,
      ),
      headline: TypescaleStyleThemeDataPartial(
        large: textTheme.headlineLarge != null
            ? TypescalePartial.fromTextStyle(textTheme.headlineLarge!)
            : null,
        medium: textTheme.headlineMedium != null
            ? TypescalePartial.fromTextStyle(textTheme.headlineMedium!)
            : null,
        small: textTheme.headlineSmall != null
            ? TypescalePartial.fromTextStyle(textTheme.headlineSmall!)
            : null,
      ),
      title: TypescaleStyleThemeDataPartial(
        large: textTheme.titleLarge != null
            ? TypescalePartial.fromTextStyle(textTheme.titleLarge!)
            : null,
        medium: textTheme.titleMedium != null
            ? TypescalePartial.fromTextStyle(textTheme.titleMedium!)
            : null,
        small: textTheme.titleSmall != null
            ? TypescalePartial.fromTextStyle(textTheme.titleSmall!)
            : null,
      ),
      body: TypescaleStyleThemeDataPartial(
        large: textTheme.bodyLarge != null
            ? TypescalePartial.fromTextStyle(textTheme.bodyLarge!)
            : null,
        medium: textTheme.bodyMedium != null
            ? TypescalePartial.fromTextStyle(textTheme.bodyMedium!)
            : null,
        small: textTheme.bodySmall != null
            ? TypescalePartial.fromTextStyle(textTheme.bodySmall!)
            : null,
      ),
      label: TypescaleStyleThemeDataPartial(
        large: textTheme.labelLarge != null
            ? TypescalePartial.fromTextStyle(textTheme.labelLarge!)
            : null,
        medium: textTheme.labelMedium != null
            ? TypescalePartial.fromTextStyle(textTheme.labelMedium!)
            : null,
        small: textTheme.labelSmall != null
            ? TypescalePartial.fromTextStyle(textTheme.labelSmall!)
            : null,
      ),
    );

    return fallbackTypescaleTheme.merge(textThemeBasedTypescaleTheme);
  }
}

class _TypescaleThemeDataFallback
    with Diagnosticable
    implements TypescaleThemeData {
  _TypescaleThemeDataFallback({required this.context});

  final BuildContext context;
  late final TypefaceThemeData _typeface = TypefaceTheme.of(context);

  @override
  TypescaleStyleThemeData get display => TypescaleStyleThemeData(
    large: Typescale(
      font: _typeface.brand,
      size: 57,
      weight: _typeface.weight.regular,
      lineHeight: 64,
      tracking: -0.25,
    ),
    medium: Typescale(
      font: _typeface.brand,
      size: 45,
      weight: _typeface.weight.regular,
      lineHeight: 52,
      tracking: 0,
    ),
    small: Typescale(
      font: _typeface.brand,
      size: 36,
      weight: _typeface.weight.regular,
      lineHeight: 44,
      tracking: 0,
    ),
  );

  @override
  TypescaleStyleThemeData get headline => TypescaleStyleThemeData(
    large: Typescale(
      font: _typeface.brand,
      size: 32,
      weight: _typeface.weight.regular,
      lineHeight: 40,
      tracking: 0,
    ),
    medium: Typescale(
      font: _typeface.brand,
      size: 28,
      weight: _typeface.weight.regular,
      lineHeight: 36,
      tracking: 0,
    ),
    small: Typescale(
      font: _typeface.brand,
      size: 24,
      weight: _typeface.weight.regular,
      lineHeight: 32,
      tracking: 0,
    ),
  );

  @override
  TypescaleStyleThemeData get title => TypescaleStyleThemeData(
    large: Typescale(
      font: _typeface.brand,
      size: 22,
      weight: _typeface.weight.regular,
      lineHeight: 28,
      tracking: 0,
    ),
    medium: Typescale(
      font: _typeface.plain,
      size: 16,
      weight: _typeface.weight.medium,
      lineHeight: 24,
      tracking: 0.15,
    ),
    small: Typescale(
      font: _typeface.plain,
      size: 14,
      weight: _typeface.weight.medium,
      lineHeight: 20,
      tracking: 0.1,
    ),
  );

  @override
  TypescaleStyleThemeData get body => TypescaleStyleThemeData(
    large: Typescale(
      font: _typeface.plain,
      size: 16,
      weight: _typeface.weight.regular,
      lineHeight: 24,
      tracking: 0.5,
    ),
    medium: Typescale(
      font: _typeface.plain,
      size: 14,
      weight: _typeface.weight.regular,
      lineHeight: 20,
      tracking: 0.25,
    ),
    small: Typescale(
      font: _typeface.plain,
      size: 12,
      weight: _typeface.weight.regular,
      lineHeight: 16,
      tracking: 0.4,
    ),
  );

  @override
  TypescaleStyleThemeData get label => TypescaleStyleThemeData(
    large: Typescale(
      font: _typeface.plain,
      size: 14,
      weight: _typeface.weight.medium,
      weightProminent: _typeface.weight.bold,
      lineHeight: 20,
      tracking: 0.1,
    ),
    medium: Typescale(
      font: _typeface.plain,
      size: 12,
      weight: _typeface.weight.medium,
      weightProminent: _typeface.weight.bold,
      lineHeight: 16,
      tracking: 0.5,
    ),
    small: Typescale(
      font: _typeface.plain,
      size: 11,
      weight: _typeface.weight.medium,
      lineHeight: 16,
      tracking: 0.5,
    ),
  );

  @override
  TypescaleThemeData copyWith({
    covariant TypescaleStyleThemeData? display,
    covariant TypescaleStyleThemeData? headline,
    covariant TypescaleStyleThemeData? title,
    covariant TypescaleStyleThemeData? body,
    covariant TypescaleStyleThemeData? label,
  }) {
    if (display == null &&
        headline == null &&
        title == null &&
        body == null &&
        label == null) {
      return this;
    }
    return TypescaleThemeData(
      display: display ?? this.display,
      headline: headline ?? this.headline,
      title: title ?? this.title,
      body: body ?? this.body,
      label: label ?? this.label,
    );
  }

  @override
  TypescaleThemeData apply({
    TypescaleStyleThemeDataPartial? display,
    TypescaleStyleThemeDataPartial? headline,
    TypescaleStyleThemeDataPartial? title,
    TypescaleStyleThemeDataPartial? body,
    TypescaleStyleThemeDataPartial? label,
  }) {
    if (display == null &&
        headline == null &&
        title == null &&
        body == null &&
        label == null) {
      return this;
    }
    return TypescaleThemeData(
      display: this.display.merge(display),
      headline: this.headline.merge(headline),
      title: this.title.merge(title),
      body: this.body.merge(body),
      label: this.label.merge(label),
    );
  }

  @override
  TypescaleThemeData merge(TypescaleThemeDataPartial? other) {
    if (other == null) return this;
    return apply(
      display: other.display,
      headline: other.headline,
      title: other.title,
      body: other.body,
      label: other.label,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TypescaleThemeData &&
            display == other.display &&
            headline == other.headline &&
            title == other.title &&
            body == other.body &&
            label == other.label;
  }

  @override
  int get hashCode => Object.hash(display, headline, title, body, label);
}
