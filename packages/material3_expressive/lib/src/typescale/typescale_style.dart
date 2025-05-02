part of 'typescale.dart';

FontWeight _closestFontWeightFor(double weight) {
  assert(weight >= 0, "Font weight cannot be negative.");
  final iterator = FontWeight.values.iterator..moveNext();
  var closest = iterator.current;
  while (iterator.moveNext()) {
    final element = iterator.current;
    if ((weight - element.value.toDouble()).abs() <
        (weight - closest.value.toDouble()).abs()) {
      closest = element;
    }
  }
  return closest;
}

bool _debugTextStyleHasFont(TextStyle? style) {
  if (style == null) return false;
  if (style.fontFamily != null) return true;
  if (style.fontFamilyFallback case final fontFamilyFallback?) {
    return fontFamilyFallback.isNotEmpty;
  }
  return false;
}

bool _debugTextStyleHasWeight(TextStyle? style) {
  if (style == null) return false;
  if (style.fontWeight != null) return true;
  if (style.fontVariations case final fontVariations?) {
    return fontVariations.any((element) => element.axis == "wght");
  }
  return false;
}

bool _debugTextStyleHasSize(TextStyle? style) {
  if (style == null) return false;
  return style.fontSize != null;
}

bool _debugTextStyleHasLineHeight(TextStyle? style) {
  if (style == null) return false;
  return style.fontSize != null && style.height != null;
}

bool _debugTextStyleHasTracking(TextStyle? style) {
  if (style == null) return false;
  return style.letterSpacing != null;
}

extension FontWeightExtension on FontWeight {
  double toDouble() => value.toDouble();
}

@immutable
class TypescaleStylePartial with Diagnosticable {
  const TypescaleStylePartial({
    this.font,
    this.weight,
    this.size,
    this.lineHeight,
    this.tracking,
  });

  factory TypescaleStylePartial.fromTextStyle(TextStyle? style) {
    if (style == null) return const TypescaleStylePartial();
    final font = [
      if (style.fontFamily case final fontFamily?) fontFamily,
      if (style.fontFamilyFallback case final fontFamilyFallback?)
        ...fontFamilyFallback,
    ];
    final weight =
        style.fontVariations
            ?.firstWhereOrNull((element) => element.axis == "wght")
            ?.value ??
        style.fontWeight?.value.toDouble();
    final size = style.fontSize;
    final lineHeight = switch ((size, style.height)) {
      (final size?, final height?) => size * height,
      _ => null,
    };
    final tracking = style.letterSpacing;
    return TypescaleStylePartial(
      font: font,
      weight: weight,
      size: size,
      lineHeight: lineHeight,
      tracking: tracking,
    );
  }

  final List<String>? font;

  final double? weight;

  final double? size;

  final double? lineHeight;

  final double? tracking;

  TypescaleStylePartial copyWith({
    covariant List<String>? font,
    covariant double? weight,
    covariant double? size,
    covariant double? lineHeight,
    covariant double? tracking,
  }) {
    if (font == null &&
        weight == null &&
        size == null &&
        lineHeight == null &&
        tracking == null) {
      return this;
    }
    return TypescaleStylePartial(
      font: font ?? this.font,
      weight: weight ?? this.weight,
      size: size ?? this.size,
      lineHeight: lineHeight ?? this.lineHeight,
      tracking: tracking ?? this.tracking,
    );
  }

  TypescaleStylePartial apply({
    List<String>? font,
    double? weight,
    double? size,
    double? lineHeight,
    double? tracking,
  }) {
    if (font == null &&
        weight == null &&
        size == null &&
        lineHeight == null &&
        tracking == null) {
      return this;
    }
    return TypescaleStylePartial(
      font: font != null ? [...font, ...?this.font] : this.font,
      weight: weight ?? this.weight,
      size: size ?? this.size,
      lineHeight: lineHeight ?? this.lineHeight,
      tracking: tracking ?? this.tracking,
    );
  }

  TypescaleStylePartial merge(TypescaleStylePartial? other) {
    if (other == null) return this;
    return apply(
      font: other.font,
      weight: other.weight,
      size: other.size,
      lineHeight: other.lineHeight,
      tracking: other.tracking,
    );
  }

  TextStyle toTextStyle({bool snapFontWeight = true}) {
    // TODO: implement snapFontWeight and useFontVariation (names are not final)
    return TextStyle(
      fontFamily: font?.firstOrNull,
      fontFamilyFallback: font?.skip(1).toList(),
      fontWeight: weight != null ? _closestFontWeightFor(weight!) : null,
      fontSize: size,
      height: size != null && lineHeight != null ? lineHeight! / size! : null,
      letterSpacing: tracking,
      fontVariations: [if (weight != null) FontVariation.weight(weight!)],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<List<String>>("font", font, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<double>("weight", weight, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<double>("size", size, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<double>("lineHeight", lineHeight, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<double>("tracking", tracking, defaultValue: null),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is TypescaleStylePartial &&
            listEquals(font, other.font) &&
            weight == other.weight &&
            size == other.size &&
            lineHeight == other.lineHeight &&
            tracking == other.tracking;
  }

  @override
  int get hashCode => Object.hash(
    font != null ? Object.hashAll(font!) : null,
    weight,
    size,
    lineHeight,
    tracking,
  );
}

@immutable
class TypescaleStyle with Diagnosticable implements TypescaleStylePartial {
  const TypescaleStyle({
    required this.font,
    required this.weight,
    required this.size,
    required this.lineHeight,
    required this.tracking,
  });
  // : assert(font.length >= 1, "At least one font family is required");

  factory TypescaleStyle.fromTextStyle(TextStyle style) {
    assert(_debugTextStyleHasFont(style), "TextStyle has no font families");
    assert(_debugTextStyleHasWeight(style), "TextStyle has no weight");
    assert(_debugTextStyleHasSize(style), "TextStyle has no size");
    assert(_debugTextStyleHasLineHeight(style), "TextStyle has no line height");
    assert(_debugTextStyleHasTracking(style), "TextStyle has no tracking");
    final font = [
      if (style.fontFamily case final fontFamily?) fontFamily,
      if (style.fontFamilyFallback case final fontFamilyFallback?)
        ...fontFamilyFallback,
    ];
    final weight =
        style.fontVariations
            ?.firstWhereOrNull((element) => element.axis == "wght")
            ?.value ??
        style.fontWeight!.value.toDouble();
    final size = style.fontSize!;
    final lineHeight = size * style.height!;
    final tracking = style.letterSpacing!;
    return TypescaleStyle(
      font: font,
      weight: weight,
      size: size,
      lineHeight: lineHeight,
      tracking: tracking,
    );
  }

  @override
  final List<String> font;

  @override
  final double weight;

  @override
  final double size;

  @override
  final double lineHeight;

  @override
  final double tracking;

  @override
  TypescaleStyle copyWith({
    covariant List<String>? font,
    covariant double? weight,
    covariant double? size,
    covariant double? lineHeight,
    covariant double? tracking,
  }) {
    if (font == null &&
        weight == null &&
        size == null &&
        lineHeight == null &&
        tracking == null) {
      return this;
    }
    return TypescaleStyle(
      font: font ?? this.font,
      weight: weight ?? this.weight,
      size: size ?? this.size,
      lineHeight: lineHeight ?? this.lineHeight,
      tracking: tracking ?? this.tracking,
    );
  }

  @override
  TypescaleStyle apply({
    List<String>? font,
    double? weight,
    double? size,
    double? lineHeight,
    double? tracking,
  }) {
    if (font == null &&
        weight == null &&
        size == null &&
        lineHeight == null &&
        tracking == null) {
      return this;
    }
    return TypescaleStyle(
      font: font != null ? [...font, ...this.font] : this.font,
      weight: weight ?? this.weight,
      size: size ?? this.size,
      lineHeight: lineHeight ?? this.lineHeight,
      tracking: tracking ?? this.tracking,
    );
  }

  @override
  TypescaleStyle merge(TypescaleStylePartial? other) {
    if (other == null) return this;
    return apply(
      font: other.font,
      weight: other.weight,
      size: other.size,
      lineHeight: other.lineHeight,
      tracking: other.tracking,
    );
  }

  @override
  TextStyle toTextStyle({bool snapFontWeight = true}) {
    // TODO: implement snapFontWeight and useFontVariation (names are not final)
    // final fontWeight = snapFontWeight ? _closestFontWeightFor(weight) : null;
    // final fontVariations = [FontVariation.weight(weight)];
    // return TextStyle(fontWeight: fontWeight, fontVariations: fontVariations);

    final fontFamilyFallback = font.skip(1).toList();
    return TextStyle(
      fontFamily: font.first,
      fontFamilyFallback: fontFamilyFallback.isNotEmpty
          ? fontFamilyFallback
          : null,
      fontWeight: _closestFontWeightFor(weight),
      fontSize: size,
      height: lineHeight / size,
      letterSpacing: tracking,
      fontVariations: [FontVariation.weight(weight)],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<List<String>>("font", font));
    properties.add(DiagnosticsProperty<double>("weight", weight));
    properties.add(DiagnosticsProperty<double>("size", size));
    properties.add(DiagnosticsProperty<double>("lineHeight", lineHeight));
    properties.add(DiagnosticsProperty<double>("tracking", tracking));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is TypescaleStyle &&
            listEquals(font, other.font) &&
            weight == other.weight &&
            size == other.size &&
            lineHeight == other.lineHeight &&
            tracking == other.tracking;
  }

  @override
  int get hashCode =>
      Object.hash(Object.hashAll(font), weight, size, lineHeight, tracking);

  static TypescaleStyle lerp(TypescaleStyle a, TypescaleStyle b, double t) {
    if (identical(a, b)) return a;
    return TypescaleStyle(
      font: t < 0.5 ? a.font : b.font,
      weight: lerpDouble(a.weight, b.weight, t)!,
      size: lerpDouble(a.size, b.size, t)!,
      lineHeight: lerpDouble(a.lineHeight, b.lineHeight, t)!,
      tracking: lerpDouble(a.tracking, b.tracking, t)!,
    );
  }
}
