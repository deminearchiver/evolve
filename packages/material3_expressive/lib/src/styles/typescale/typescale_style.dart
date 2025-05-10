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

extension on TextStyle {
  Map<String, double>? get _variableFontAxesOrNull => fontVariations != null
      ? Map.fromEntries(
          fontVariations!.map(
            (fontVariation) =>
                MapEntry(fontVariation.axis, fontVariation.value),
          ),
        )
      : null;

  // Map<String, double> get _variableFontAxes => _variableFontAxesOrNull ?? {};

  double? _variableFontAxis(String axis) => _variableFontAxesOrNull?[axis];
}

@immutable
class TypescaleStylePartial with Diagnosticable {
  const TypescaleStylePartial({
    this.font,
    this.weight,
    this.size,
    this.lineHeight,
    this.tracking,
    this.wght,
    this.grad,
    this.wdth,
    this.rond,
    this.opsz,
    this.crsv,
    this.slnt,
    this.fill,
    this.hexp,
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
      wght: style._variableFontAxis(_VariableFontAxes.wght),
      grad: style._variableFontAxis(_VariableFontAxes.grad),
      wdth: style._variableFontAxis(_VariableFontAxes.wdth),
      rond: style._variableFontAxis(_VariableFontAxes.rond),
      opsz: style._variableFontAxis(_VariableFontAxes.opsz),
      crsv: style._variableFontAxis(_VariableFontAxes.crsv),
      slnt: style._variableFontAxis(_VariableFontAxes.slnt),
      fill: style._variableFontAxis(_VariableFontAxes.fill),
      hexp: style._variableFontAxis(_VariableFontAxes.hexp),
    );
  }

  final List<String>? font;

  final double? weight;

  final double? size;

  final double? lineHeight;

  final double? tracking;

  final double? wght;
  final double? grad;
  final double? wdth;
  final double? rond;
  final double? opsz;
  final double? crsv;
  final double? slnt;
  final double? fill;
  final double? hexp;

  TypescaleStylePartial copyWith({
    List<String>? font,
    double? weight,
    double? size,
    double? lineHeight,
    double? tracking,
    double? wght,
    double? grad,
    double? wdth,
    double? rond,
    double? opsz,
    double? crsv,
    double? slnt,
    double? fill,
    double? hexp,
  }) {
    if (font == null &&
        weight == null &&
        size == null &&
        lineHeight == null &&
        tracking == null &&
        wght == null &&
        grad == null &&
        wdth == null &&
        rond == null &&
        opsz == null &&
        crsv == null &&
        slnt == null &&
        fill == null &&
        hexp == null) {
      return this;
    }
    return TypescaleStylePartial(
      font: font ?? this.font,
      weight: weight ?? this.weight,
      size: size ?? this.size,
      lineHeight: lineHeight ?? this.lineHeight,
      tracking: tracking ?? this.tracking,
      wght: wght ?? this.wght,
      grad: grad ?? this.grad,
      wdth: wdth ?? this.wdth,
      rond: rond ?? this.rond,
      opsz: opsz ?? this.opsz,
      crsv: crsv ?? this.crsv,
      slnt: slnt ?? this.slnt,
      fill: fill ?? this.fill,
      hexp: hexp ?? this.hexp,
    );
  }

  TypescaleStylePartial apply({
    List<String>? font,
    double? weight,
    double? size,
    double? lineHeight,
    double? tracking,
    double? wght,
    double? grad,
    double? wdth,
    double? rond,
    double? opsz,
    double? crsv,
    double? slnt,
    double? fill,
    double? hexp,
  }) {
    if (font == null &&
        weight == null &&
        size == null &&
        lineHeight == null &&
        tracking == null &&
        wght == null &&
        grad == null &&
        wdth == null &&
        rond == null &&
        opsz == null &&
        crsv == null &&
        slnt == null &&
        fill == null &&
        hexp == null) {
      return this;
    }
    return TypescaleStylePartial(
      font: font != null ? [...font, ...?this.font] : this.font,
      weight: weight ?? this.weight,
      size: size ?? this.size,
      lineHeight: lineHeight ?? this.lineHeight,
      tracking: tracking ?? this.tracking,
      wght: wght ?? this.wght,
      grad: grad ?? this.grad,
      wdth: wdth ?? this.wdth,
      rond: rond ?? this.rond,
      opsz: opsz ?? this.opsz,
      crsv: crsv ?? this.crsv,
      slnt: slnt ?? this.slnt,
      fill: fill ?? this.fill,
      hexp: hexp ?? this.hexp,
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
      wght: other.wght,
      grad: other.grad,
      wdth: other.wdth,
      rond: other.rond,
      opsz: other.opsz,
      crsv: other.crsv,
      slnt: other.slnt,
      fill: other.fill,
      hexp: other.hexp,
    );
  }

  Map<String, double> get variableFontAxes => {
    if (wght case final wght?) _VariableFontAxes.wght: wght,
    if (grad case final grad?) _VariableFontAxes.grad: grad,
    if (wdth case final wdth?) _VariableFontAxes.wdth: wdth,
    if (rond case final rond?) _VariableFontAxes.rond: rond,
    if (opsz case final opsz?) _VariableFontAxes.opsz: opsz,
    if (crsv case final crsv?) _VariableFontAxes.crsv: crsv,
    if (slnt case final slnt?) _VariableFontAxes.slnt: slnt,
    if (fill case final fill?) _VariableFontAxes.fill: fill,
    if (hexp case final hexp?) _VariableFontAxes.hexp: hexp,
  };

  List<FontVariation> get fontVariations => [
    if (wght case final wght?) FontVariation(_VariableFontAxes.wght, wght),
    if (grad case final grad?) FontVariation(_VariableFontAxes.grad, grad),
    if (wdth case final wdth?) FontVariation(_VariableFontAxes.wdth, wdth),
    if (rond case final rond?) FontVariation(_VariableFontAxes.rond, rond),
    if (opsz case final opsz?) FontVariation(_VariableFontAxes.opsz, opsz),
    if (crsv case final crsv?) FontVariation(_VariableFontAxes.crsv, crsv),
    if (slnt case final slnt?) FontVariation(_VariableFontAxes.slnt, slnt),
    if (fill case final fill?) FontVariation(_VariableFontAxes.fill, fill),
    if (hexp case final hexp?) FontVariation(_VariableFontAxes.hexp, hexp),
  ];

  TextStyle toTextStyle({bool snapFontWeight = true}) {
    // TODO: implement snapFontWeight and useFontVariation (names are not final)
    return TextStyle(
      fontFamily: font?.firstOrNull,
      fontFamilyFallback: font?.skip(1).toList(),
      fontWeight: weight != null ? _closestFontWeightFor(weight!) : null,
      fontSize: size,
      height: size != null && lineHeight != null ? lineHeight! / size! : null,
      letterSpacing: tracking,
      fontVariations: fontVariations,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<List<String>>("font", font, defaultValue: null),
    );
    properties.add(DoubleProperty("weight", weight, defaultValue: null));
    properties.add(DoubleProperty("size", size, defaultValue: null));
    properties.add(
      DoubleProperty("lineHeight", lineHeight, defaultValue: null),
    );
    properties.add(DoubleProperty("tracking", tracking, defaultValue: null));
    properties.add(DoubleProperty("wght", wght, defaultValue: null));
    properties.add(DoubleProperty("grad", grad, defaultValue: null));
    properties.add(DoubleProperty("wdth", wdth, defaultValue: null));
    properties.add(DoubleProperty("rond", rond, defaultValue: null));
    properties.add(DoubleProperty("opsz", opsz, defaultValue: null));
    properties.add(DoubleProperty("crsv", crsv, defaultValue: null));
    properties.add(DoubleProperty("slnt", slnt, defaultValue: null));
    properties.add(DoubleProperty("fill", fill, defaultValue: null));
    properties.add(DoubleProperty("hexp", hexp, defaultValue: null));
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
            tracking == other.tracking &&
            wght == other.wght &&
            grad == other.grad &&
            wdth == other.wdth &&
            rond == other.rond &&
            opsz == other.opsz &&
            crsv == other.crsv &&
            slnt == other.slnt &&
            fill == other.fill &&
            hexp == other.hexp;
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    font != null ? Object.hashAll(font!) : null,
    weight,
    size,
    lineHeight,
    tracking,
    wght,
    grad,
    wdth,
    rond,
    opsz,
    crsv,
    slnt,
    fill,
    hexp,
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
    required this.wght,
    required this.grad,
    required this.wdth,
    required this.rond,
    required this.opsz,
    required this.crsv,
    required this.slnt,
    required this.fill,
    required this.hexp,
  });

  const TypescaleStyle.withDefaults({
    required this.font,
    required this.weight,
    required this.size,
    required this.lineHeight,
    required this.tracking,
    double? wght,
    double? grad,
    double? wdth,
    double? rond,
    double? opsz,
    double? crsv,
    double? slnt,
    double? fill,
    double? hexp,
  }) : wght = wght ?? weight,
       grad = grad ?? 0.0,
       wdth = wdth ?? 100.0,
       rond = rond ?? 0.0,
       opsz = opsz ?? size,
       crsv = crsv ?? 0.0,
       slnt = slnt ?? 0.0,
       fill = fill ?? 0.0,
       hexp = hexp ?? 0.0;

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
    return TypescaleStyle.withDefaults(
      font: font,
      weight: weight,
      size: size,
      lineHeight: lineHeight,
      tracking: tracking,
      wght: style._variableFontAxis(_VariableFontAxes.wght),
      grad: style._variableFontAxis(_VariableFontAxes.grad),
      wdth: style._variableFontAxis(_VariableFontAxes.wdth),
      rond: style._variableFontAxis(_VariableFontAxes.rond),
      opsz: style._variableFontAxis(_VariableFontAxes.opsz),
      crsv: style._variableFontAxis(_VariableFontAxes.crsv),
      slnt: style._variableFontAxis(_VariableFontAxes.slnt),
      fill: style._variableFontAxis(_VariableFontAxes.fill),
      hexp: style._variableFontAxis(_VariableFontAxes.hexp),
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
  final double wght;

  @override
  final double grad;

  @override
  final double wdth;

  @override
  final double rond;

  @override
  final double opsz;

  @override
  final double crsv;

  @override
  final double slnt;

  @override
  final double fill;

  @override
  final double hexp;

  @override
  TypescaleStyle copyWith({
    List<String>? font,
    double? weight,
    double? size,
    double? lineHeight,
    double? tracking,
    double? wght,
    double? grad,
    double? wdth,
    double? rond,
    double? opsz,
    double? crsv,
    double? slnt,
    double? fill,
    double? hexp,
  }) {
    if (font == null &&
        weight == null &&
        size == null &&
        lineHeight == null &&
        tracking == null &&
        wght == null &&
        grad == null &&
        wdth == null &&
        rond == null &&
        opsz == null &&
        crsv == null &&
        slnt == null &&
        fill == null &&
        hexp == null) {
      return this;
    }
    return TypescaleStyle(
      font: font ?? this.font,
      weight: weight ?? this.weight,
      size: size ?? this.size,
      lineHeight: lineHeight ?? this.lineHeight,
      tracking: tracking ?? this.tracking,
      wght: wght ?? this.wght,
      grad: grad ?? this.grad,
      wdth: wdth ?? this.wdth,
      rond: rond ?? this.rond,
      opsz: opsz ?? this.opsz,
      crsv: crsv ?? this.crsv,
      slnt: slnt ?? this.slnt,
      fill: fill ?? this.fill,
      hexp: hexp ?? this.hexp,
    );
  }

  @override
  TypescaleStyle apply({
    List<String>? font,
    double? weight,
    double? size,
    double? lineHeight,
    double? tracking,
    double? wght,
    double? grad,
    double? wdth,
    double? rond,
    double? opsz,
    double? crsv,
    double? slnt,
    double? fill,
    double? hexp,
  }) {
    if (font == null &&
        weight == null &&
        size == null &&
        lineHeight == null &&
        tracking == null &&
        wght == null &&
        grad == null &&
        wdth == null &&
        rond == null &&
        opsz == null &&
        crsv == null &&
        slnt == null &&
        fill == null &&
        hexp == null) {
      return this;
    }
    return TypescaleStyle(
      font: font != null ? [...font, ...this.font] : this.font,
      weight: weight ?? this.weight,
      size: size ?? this.size,
      lineHeight: lineHeight ?? this.lineHeight,
      tracking: tracking ?? this.tracking,
      wght: wght ?? this.wght,
      grad: grad ?? this.grad,
      wdth: wdth ?? this.wdth,
      rond: rond ?? this.rond,
      opsz: opsz ?? this.opsz,
      crsv: crsv ?? this.crsv,
      slnt: slnt ?? this.slnt,
      fill: fill ?? this.fill,
      hexp: hexp ?? this.hexp,
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
      wght: other.wght,
      grad: other.grad,
      wdth: other.wdth,
      rond: other.rond,
      opsz: other.opsz,
      crsv: other.crsv,
      slnt: other.slnt,
      fill: other.fill,
      hexp: other.hexp,
    );
  }

  @override
  Map<String, double> get variableFontAxes => {
    _VariableFontAxes.wght: wght,
    _VariableFontAxes.grad: grad,
    _VariableFontAxes.wdth: wdth,
    _VariableFontAxes.rond: rond,
    _VariableFontAxes.opsz: opsz,
    _VariableFontAxes.crsv: crsv,
    _VariableFontAxes.slnt: slnt,
    _VariableFontAxes.fill: fill,
    _VariableFontAxes.hexp: hexp,
  };

  @override
  List<FontVariation> get fontVariations => [
    FontVariation(_VariableFontAxes.wght, wght),
    FontVariation(_VariableFontAxes.grad, grad),
    FontVariation(_VariableFontAxes.wdth, wdth),
    FontVariation(_VariableFontAxes.rond, rond),
    FontVariation(_VariableFontAxes.opsz, opsz),
    FontVariation(_VariableFontAxes.crsv, crsv),
    FontVariation(_VariableFontAxes.slnt, slnt),
    FontVariation(_VariableFontAxes.fill, fill),
    FontVariation(_VariableFontAxes.hexp, hexp),
  ];

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
      fontVariations: fontVariations,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<List<String>>("font", font));
    properties.add(DoubleProperty("weight", weight));
    properties.add(DoubleProperty("size", size));
    properties.add(DoubleProperty("lineHeight", lineHeight));
    properties.add(DoubleProperty("tracking", tracking));
    properties.add(DoubleProperty("wght", wght));
    properties.add(DoubleProperty("grad", grad));
    properties.add(DoubleProperty("wdth", wdth));
    properties.add(DoubleProperty("rond", rond));
    properties.add(DoubleProperty("opsz", opsz));
    properties.add(DoubleProperty("crsv", crsv));
    properties.add(DoubleProperty("slnt", slnt));
    properties.add(DoubleProperty("fill", fill));
    properties.add(DoubleProperty("hexp", hexp));
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
            tracking == other.tracking &&
            wght == other.wght &&
            grad == other.grad &&
            wdth == other.wdth &&
            rond == other.rond &&
            opsz == other.opsz &&
            crsv == other.crsv &&
            slnt == other.slnt &&
            fill == other.fill &&
            hexp == other.hexp;
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    Object.hashAll(font),
    weight,
    size,
    lineHeight,
    tracking,
    wght,
    grad,
    wdth,
    rond,
    opsz,
    crsv,
    slnt,
    fill,
    hexp,
  );

  static TypescaleStyle lerp(TypescaleStyle a, TypescaleStyle b, double t) {
    if (identical(a, b)) return a;
    return TypescaleStyle(
      font: t < 0.5 ? a.font : b.font,
      weight: lerpDouble(a.weight, b.weight, t)!,
      size: lerpDouble(a.size, b.size, t)!,
      lineHeight: lerpDouble(a.lineHeight, b.lineHeight, t)!,
      tracking: lerpDouble(a.tracking, b.tracking, t)!,
      wght: lerpDouble(a.wght, b.wght, t)!,
      grad: lerpDouble(a.grad, b.grad, t)!,
      wdth: lerpDouble(a.wdth, b.wdth, t)!,
      rond: lerpDouble(a.rond, b.rond, t)!,
      opsz: lerpDouble(a.opsz, b.opsz, t)!,
      crsv: lerpDouble(a.crsv, b.crsv, t)!,
      slnt: lerpDouble(a.slnt, b.slnt, t)!,
      fill: lerpDouble(a.fill, b.fill, t)!,
      hexp: lerpDouble(a.hexp, b.hexp, t)!,
    );
  }
}

abstract final class _VariableFontAxes {
  static const String wght = "wght";
  static const String grad = "GRAD";
  static const String wdth = "wdth";
  static const String rond = "ROND";
  static const String opsz = "opsz";
  static const String crsv = "CRSV";
  static const String slnt = "slnt";
  static const String fill = "FILL";
  static const String hexp = "HEXP";
}
