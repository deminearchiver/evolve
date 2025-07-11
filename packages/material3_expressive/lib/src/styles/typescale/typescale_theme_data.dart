part of 'typescale.dart';

@immutable
abstract class TypescaleThemeData
    with Diagnosticable
    implements TypescaleThemeDataPartial {
  const factory TypescaleThemeData({
    required TypescaleStyle displayLarge,
    required TypescaleStyle displayMedium,
    required TypescaleStyle displaySmall,
    required TypescaleStyle headlineLarge,
    required TypescaleStyle headlineMedium,
    required TypescaleStyle headlineSmall,
    required TypescaleStyle titleLarge,
    required TypescaleStyle titleMedium,
    required TypescaleStyle titleSmall,
    required TypescaleStyle bodyLarge,
    required TypescaleStyle bodyMedium,
    required TypescaleStyle bodySmall,
    required TypescaleStyle labelLarge,
    required TypescaleStyle labelMedium,
    required TypescaleStyle labelSmall,
    required TypescaleStyle displayLargeEmphasized,
    required TypescaleStyle displayMediumEmphasized,
    required TypescaleStyle displaySmallEmphasized,
    required TypescaleStyle headlineLargeEmphasized,
    required TypescaleStyle headlineMediumEmphasized,
    required TypescaleStyle headlineSmallEmphasized,
    required TypescaleStyle titleLargeEmphasized,
    required TypescaleStyle titleMediumEmphasized,
    required TypescaleStyle titleSmallEmphasized,
    required TypescaleStyle bodyLargeEmphasized,
    required TypescaleStyle bodyMediumEmphasized,
    required TypescaleStyle bodySmallEmphasized,
    required TypescaleStyle labelLargeEmphasized,
    required TypescaleStyle labelMediumEmphasized,
    required TypescaleStyle labelSmallEmphasized,
  }) = _TypescaleThemeData;

  factory TypescaleThemeData.fallback({
    required TypefaceThemeData typefaceTheme,
  }) = _TypescaleThemeDataFallback;

  @override
  TypescaleStyle get displayLarge;

  @override
  TypescaleStyle get displayMedium;

  @override
  TypescaleStyle get displaySmall;

  @override
  TypescaleStyle get headlineLarge;

  @override
  TypescaleStyle get headlineMedium;

  @override
  TypescaleStyle get headlineSmall;

  @override
  TypescaleStyle get titleLarge;

  @override
  TypescaleStyle get titleMedium;

  @override
  TypescaleStyle get titleSmall;

  @override
  TypescaleStyle get bodyLarge;

  @override
  TypescaleStyle get bodyMedium;

  @override
  TypescaleStyle get bodySmall;

  @override
  TypescaleStyle get labelLarge;

  @override
  TypescaleStyle get labelMedium;

  @override
  TypescaleStyle get labelSmall;

  @override
  TypescaleStyle get displayLargeEmphasized;

  @override
  TypescaleStyle get displayMediumEmphasized;

  @override
  TypescaleStyle get displaySmallEmphasized;

  @override
  TypescaleStyle get headlineLargeEmphasized;

  @override
  TypescaleStyle get headlineMediumEmphasized;

  @override
  TypescaleStyle get headlineSmallEmphasized;

  @override
  TypescaleStyle get titleLargeEmphasized;

  @override
  TypescaleStyle get titleMediumEmphasized;

  @override
  TypescaleStyle get titleSmallEmphasized;

  @override
  TypescaleStyle get bodyLargeEmphasized;

  @override
  TypescaleStyle get bodyMediumEmphasized;

  @override
  TypescaleStyle get bodySmallEmphasized;

  @override
  TypescaleStyle get labelLargeEmphasized;

  @override
  TypescaleStyle get labelMediumEmphasized;

  @override
  TypescaleStyle get labelSmallEmphasized;

  @override
  TypescaleThemeData copyWith({
    covariant TypescaleStyle? displayLarge,
    covariant TypescaleStyle? displayMedium,
    covariant TypescaleStyle? displaySmall,
    covariant TypescaleStyle? headlineLarge,
    covariant TypescaleStyle? headlineMedium,
    covariant TypescaleStyle? headlineSmall,
    covariant TypescaleStyle? titleLarge,
    covariant TypescaleStyle? titleMedium,
    covariant TypescaleStyle? titleSmall,
    covariant TypescaleStyle? bodyLarge,
    covariant TypescaleStyle? bodyMedium,
    covariant TypescaleStyle? bodySmall,
    covariant TypescaleStyle? labelLarge,
    covariant TypescaleStyle? labelMedium,
    covariant TypescaleStyle? labelSmall,
    covariant TypescaleStyle? displayLargeEmphasized,
    covariant TypescaleStyle? displayMediumEmphasized,
    covariant TypescaleStyle? displaySmallEmphasized,
    covariant TypescaleStyle? headlineLargeEmphasized,
    covariant TypescaleStyle? headlineMediumEmphasized,
    covariant TypescaleStyle? headlineSmallEmphasized,
    covariant TypescaleStyle? titleLargeEmphasized,
    covariant TypescaleStyle? titleMediumEmphasized,
    covariant TypescaleStyle? titleSmallEmphasized,
    covariant TypescaleStyle? bodyLargeEmphasized,
    covariant TypescaleStyle? bodyMediumEmphasized,
    covariant TypescaleStyle? bodySmallEmphasized,
    covariant TypescaleStyle? labelLargeEmphasized,
    covariant TypescaleStyle? labelMediumEmphasized,
    covariant TypescaleStyle? labelSmallEmphasized,
  });

  @override
  TypescaleThemeData apply({
    TypescaleStylePartial? displayLarge,
    TypescaleStylePartial? displayMedium,
    TypescaleStylePartial? displaySmall,
    TypescaleStylePartial? headlineLarge,
    TypescaleStylePartial? headlineMedium,
    TypescaleStylePartial? headlineSmall,
    TypescaleStylePartial? titleLarge,
    TypescaleStylePartial? titleMedium,
    TypescaleStylePartial? titleSmall,
    TypescaleStylePartial? bodyLarge,
    TypescaleStylePartial? bodyMedium,
    TypescaleStylePartial? bodySmall,
    TypescaleStylePartial? labelLarge,
    TypescaleStylePartial? labelMedium,
    TypescaleStylePartial? labelSmall,
    TypescaleStylePartial? displayLargeEmphasized,
    TypescaleStylePartial? displayMediumEmphasized,
    TypescaleStylePartial? displaySmallEmphasized,
    TypescaleStylePartial? headlineLargeEmphasized,
    TypescaleStylePartial? headlineMediumEmphasized,
    TypescaleStylePartial? headlineSmallEmphasized,
    TypescaleStylePartial? titleLargeEmphasized,
    TypescaleStylePartial? titleMediumEmphasized,
    TypescaleStylePartial? titleSmallEmphasized,
    TypescaleStylePartial? bodyLargeEmphasized,
    TypescaleStylePartial? bodyMediumEmphasized,
    TypescaleStylePartial? bodySmallEmphasized,
    TypescaleStylePartial? labelLargeEmphasized,
    TypescaleStylePartial? labelMediumEmphasized,
    TypescaleStylePartial? labelSmallEmphasized,
  });

  @override
  TypescaleThemeData merge(TypescaleThemeDataPartial? other);

  @override
  TextTheme toTextTheme();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

mixin TypescaleThemeDataMixin on Diagnosticable implements TypescaleThemeData {
  @override
  TypescaleThemeData copyWith({
    covariant TypescaleStyle? displayLarge,
    covariant TypescaleStyle? displayMedium,
    covariant TypescaleStyle? displaySmall,
    covariant TypescaleStyle? headlineLarge,
    covariant TypescaleStyle? headlineMedium,
    covariant TypescaleStyle? headlineSmall,
    covariant TypescaleStyle? titleLarge,
    covariant TypescaleStyle? titleMedium,
    covariant TypescaleStyle? titleSmall,
    covariant TypescaleStyle? bodyLarge,
    covariant TypescaleStyle? bodyMedium,
    covariant TypescaleStyle? bodySmall,
    covariant TypescaleStyle? labelLarge,
    covariant TypescaleStyle? labelMedium,
    covariant TypescaleStyle? labelSmall,
    covariant TypescaleStyle? displayLargeEmphasized,
    covariant TypescaleStyle? displayMediumEmphasized,
    covariant TypescaleStyle? displaySmallEmphasized,
    covariant TypescaleStyle? headlineLargeEmphasized,
    covariant TypescaleStyle? headlineMediumEmphasized,
    covariant TypescaleStyle? headlineSmallEmphasized,
    covariant TypescaleStyle? titleLargeEmphasized,
    covariant TypescaleStyle? titleMediumEmphasized,
    covariant TypescaleStyle? titleSmallEmphasized,
    covariant TypescaleStyle? bodyLargeEmphasized,
    covariant TypescaleStyle? bodyMediumEmphasized,
    covariant TypescaleStyle? bodySmallEmphasized,
    covariant TypescaleStyle? labelLargeEmphasized,
    covariant TypescaleStyle? labelMediumEmphasized,
    covariant TypescaleStyle? labelSmallEmphasized,
  }) {
    if (displayLarge == null &&
        displayMedium == null &&
        displaySmall == null &&
        headlineLarge == null &&
        headlineMedium == null &&
        headlineSmall == null &&
        titleLarge == null &&
        titleMedium == null &&
        titleSmall == null &&
        bodyLarge == null &&
        bodyMedium == null &&
        bodySmall == null &&
        labelLarge == null &&
        labelMedium == null &&
        labelSmall == null &&
        displayLargeEmphasized == null &&
        displayMediumEmphasized == null &&
        displaySmallEmphasized == null &&
        headlineLargeEmphasized == null &&
        headlineMediumEmphasized == null &&
        headlineSmallEmphasized == null &&
        titleLargeEmphasized == null &&
        titleMediumEmphasized == null &&
        titleSmallEmphasized == null &&
        bodyLargeEmphasized == null &&
        bodyMediumEmphasized == null &&
        bodySmallEmphasized == null &&
        labelLargeEmphasized == null &&
        labelMediumEmphasized == null &&
        labelSmallEmphasized == null) {
      return this;
    }
    return TypescaleThemeData(
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      displayLargeEmphasized:
          displayLargeEmphasized ?? this.displayLargeEmphasized,
      displayMediumEmphasized:
          displayMediumEmphasized ?? this.displayMediumEmphasized,
      displaySmallEmphasized:
          displaySmallEmphasized ?? this.displaySmallEmphasized,
      headlineLargeEmphasized:
          headlineLargeEmphasized ?? this.headlineLargeEmphasized,
      headlineMediumEmphasized:
          headlineMediumEmphasized ?? this.headlineMediumEmphasized,
      headlineSmallEmphasized:
          headlineSmallEmphasized ?? this.headlineSmallEmphasized,
      titleLargeEmphasized: titleLargeEmphasized ?? this.titleLargeEmphasized,
      titleMediumEmphasized:
          titleMediumEmphasized ?? this.titleMediumEmphasized,
      titleSmallEmphasized: titleSmallEmphasized ?? this.titleSmallEmphasized,
      bodyLargeEmphasized: bodyLargeEmphasized ?? this.bodyLargeEmphasized,
      bodyMediumEmphasized: bodyMediumEmphasized ?? this.bodyMediumEmphasized,
      bodySmallEmphasized: bodySmallEmphasized ?? this.bodySmallEmphasized,
      labelLargeEmphasized: labelLargeEmphasized ?? this.labelLargeEmphasized,
      labelMediumEmphasized:
          labelMediumEmphasized ?? this.labelMediumEmphasized,
      labelSmallEmphasized: labelSmallEmphasized ?? this.labelSmallEmphasized,
    );
  }

  @override
  TypescaleThemeData apply({
    TypescaleStylePartial? displayLarge,
    TypescaleStylePartial? displayMedium,
    TypescaleStylePartial? displaySmall,
    TypescaleStylePartial? headlineLarge,
    TypescaleStylePartial? headlineMedium,
    TypescaleStylePartial? headlineSmall,
    TypescaleStylePartial? titleLarge,
    TypescaleStylePartial? titleMedium,
    TypescaleStylePartial? titleSmall,
    TypescaleStylePartial? bodyLarge,
    TypescaleStylePartial? bodyMedium,
    TypescaleStylePartial? bodySmall,
    TypescaleStylePartial? labelLarge,
    TypescaleStylePartial? labelMedium,
    TypescaleStylePartial? labelSmall,
    TypescaleStylePartial? displayLargeEmphasized,
    TypescaleStylePartial? displayMediumEmphasized,
    TypescaleStylePartial? displaySmallEmphasized,
    TypescaleStylePartial? headlineLargeEmphasized,
    TypescaleStylePartial? headlineMediumEmphasized,
    TypescaleStylePartial? headlineSmallEmphasized,
    TypescaleStylePartial? titleLargeEmphasized,
    TypescaleStylePartial? titleMediumEmphasized,
    TypescaleStylePartial? titleSmallEmphasized,
    TypescaleStylePartial? bodyLargeEmphasized,
    TypescaleStylePartial? bodyMediumEmphasized,
    TypescaleStylePartial? bodySmallEmphasized,
    TypescaleStylePartial? labelLargeEmphasized,
    TypescaleStylePartial? labelMediumEmphasized,
    TypescaleStylePartial? labelSmallEmphasized,
  }) {
    if (displayLarge == null &&
        displayMedium == null &&
        displaySmall == null &&
        headlineLarge == null &&
        headlineMedium == null &&
        headlineSmall == null &&
        titleLarge == null &&
        titleMedium == null &&
        titleSmall == null &&
        bodyLarge == null &&
        bodyMedium == null &&
        bodySmall == null &&
        labelLarge == null &&
        labelMedium == null &&
        labelSmall == null &&
        displayLargeEmphasized == null &&
        displayMediumEmphasized == null &&
        displaySmallEmphasized == null &&
        headlineLargeEmphasized == null &&
        headlineMediumEmphasized == null &&
        headlineSmallEmphasized == null &&
        titleLargeEmphasized == null &&
        titleMediumEmphasized == null &&
        titleSmallEmphasized == null &&
        bodyLargeEmphasized == null &&
        bodyMediumEmphasized == null &&
        bodySmallEmphasized == null &&
        labelLargeEmphasized == null &&
        labelMediumEmphasized == null &&
        labelSmallEmphasized == null) {
      return this;
    }
    return TypescaleThemeData(
      displayLarge: this.displayLarge.merge(displayLarge),
      displayMedium: this.displayMedium.merge(displayMedium),
      displaySmall: this.displaySmall.merge(displaySmall),
      headlineLarge: this.headlineLarge.merge(headlineLarge),
      headlineMedium: this.headlineMedium.merge(headlineMedium),
      headlineSmall: this.headlineSmall.merge(headlineSmall),
      titleLarge: this.titleLarge.merge(titleLarge),
      titleMedium: this.titleMedium.merge(titleMedium),
      titleSmall: this.titleSmall.merge(titleSmall),
      bodyLarge: this.bodyLarge.merge(bodyLarge),
      bodyMedium: this.bodyMedium.merge(bodyMedium),
      bodySmall: this.bodySmall.merge(bodySmall),
      labelLarge: this.labelLarge.merge(labelLarge),
      labelMedium: this.labelMedium.merge(labelMedium),
      labelSmall: this.labelSmall.merge(labelSmall),
      displayLargeEmphasized: this.displayLargeEmphasized.merge(
        displayLargeEmphasized,
      ),
      displayMediumEmphasized: this.displayMediumEmphasized.merge(
        displayMediumEmphasized,
      ),
      displaySmallEmphasized: this.displaySmallEmphasized.merge(
        displaySmallEmphasized,
      ),
      headlineLargeEmphasized: this.headlineLargeEmphasized.merge(
        headlineLargeEmphasized,
      ),
      headlineMediumEmphasized: this.headlineMediumEmphasized.merge(
        headlineMediumEmphasized,
      ),
      headlineSmallEmphasized: this.headlineSmallEmphasized.merge(
        headlineSmallEmphasized,
      ),
      titleLargeEmphasized: this.titleLargeEmphasized.merge(
        titleLargeEmphasized,
      ),
      titleMediumEmphasized: this.titleMediumEmphasized.merge(
        titleMediumEmphasized,
      ),
      titleSmallEmphasized: this.titleSmallEmphasized.merge(
        titleSmallEmphasized,
      ),
      bodyLargeEmphasized: this.bodyLargeEmphasized.merge(bodyLargeEmphasized),
      bodyMediumEmphasized: this.bodyMediumEmphasized.merge(
        bodyMediumEmphasized,
      ),
      bodySmallEmphasized: this.bodySmallEmphasized.merge(bodySmallEmphasized),
      labelLargeEmphasized: this.labelLargeEmphasized.merge(
        labelLargeEmphasized,
      ),
      labelMediumEmphasized: this.labelMediumEmphasized.merge(
        labelMediumEmphasized,
      ),
      labelSmallEmphasized: this.labelSmallEmphasized.merge(
        labelSmallEmphasized,
      ),
    );
  }

  @override
  TypescaleThemeData merge(TypescaleThemeDataPartial? other) {
    if (other == null) return this;
    return apply(
      displayLarge: other.displayLarge,
      displayMedium: other.displayMedium,
      displaySmall: other.displaySmall,
      headlineLarge: other.headlineLarge,
      headlineMedium: other.headlineMedium,
      headlineSmall: other.headlineSmall,
      titleLarge: other.titleLarge,
      titleMedium: other.titleMedium,
      titleSmall: other.titleSmall,
      bodyLarge: other.bodyLarge,
      bodyMedium: other.bodyMedium,
      bodySmall: other.bodySmall,
      labelLarge: other.labelLarge,
      labelMedium: other.labelMedium,
      labelSmall: other.labelSmall,
      displayLargeEmphasized: other.displayLargeEmphasized,
      displayMediumEmphasized: other.displayMediumEmphasized,
      displaySmallEmphasized: other.displaySmallEmphasized,
      headlineLargeEmphasized: other.headlineLargeEmphasized,
      headlineMediumEmphasized: other.headlineMediumEmphasized,
      headlineSmallEmphasized: other.headlineSmallEmphasized,
      titleLargeEmphasized: other.titleLargeEmphasized,
      titleMediumEmphasized: other.titleMediumEmphasized,
      titleSmallEmphasized: other.titleSmallEmphasized,
      bodyLargeEmphasized: other.bodyLargeEmphasized,
      bodyMediumEmphasized: other.bodyMediumEmphasized,
      bodySmallEmphasized: other.bodySmallEmphasized,
      labelLargeEmphasized: other.labelLargeEmphasized,
      labelMediumEmphasized: other.labelMediumEmphasized,
      labelSmallEmphasized: other.labelSmallEmphasized,
    );
  }

  @override
  TextTheme toTextTheme() => TextTheme(
    displayLarge: displayLarge.toTextStyle(),
    displayMedium: displayMedium.toTextStyle(),
    displaySmall: displaySmall.toTextStyle(),
    headlineLarge: headlineLarge.toTextStyle(),
    headlineMedium: headlineMedium.toTextStyle(),
    headlineSmall: headlineSmall.toTextStyle(),
    titleLarge: titleLarge.toTextStyle(),
    titleMedium: titleMedium.toTextStyle(),
    titleSmall: titleSmall.toTextStyle(),
    bodyLarge: bodyLarge.toTextStyle(),
    bodyMedium: bodyMedium.toTextStyle(),
    bodySmall: bodySmall.toTextStyle(),
    labelLarge: labelLarge.toTextStyle(),
    labelMedium: labelMedium.toTextStyle(),
    labelSmall: labelSmall.toTextStyle(),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>("displayLarge", displayLarge),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "displayMedium",
        displayMedium,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>("displaySmall", displaySmall),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "headlineLarge",
        headlineLarge,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "headlineMedium",
        headlineMedium,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "headlineSmall",
        headlineSmall,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>("titleLarge", titleLarge),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>("titleMedium", titleMedium),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>("titleSmall", titleSmall),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>("bodyLarge", bodyLarge),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>("bodyMedium", bodyMedium),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>("bodySmall", bodySmall),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>("labelLarge", labelLarge),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>("labelMedium", labelMedium),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>("labelSmall", labelSmall),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "displayLargeEmphasized",
        displayLargeEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "displayMediumEmphasized",
        displayMediumEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "displaySmallEmphasized",
        displaySmallEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "headlineLargeEmphasized",
        headlineLargeEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "headlineMediumEmphasized",
        headlineMediumEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "headlineSmallEmphasized",
        headlineSmallEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "titleLargeEmphasized",
        titleLargeEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "titleMediumEmphasized",
        titleMediumEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "titleSmallEmphasized",
        titleSmallEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "bodyLargeEmphasized",
        bodyLargeEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "bodyMediumEmphasized",
        bodyMediumEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "bodySmallEmphasized",
        bodySmallEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "labelLargeEmphasized",
        labelLargeEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "labelMediumEmphasized",
        labelMediumEmphasized,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "labelSmallEmphasized",
        labelSmallEmphasized,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is TypescaleThemeData &&
            displayLarge == other.displayLarge &&
            displayMedium == other.displayMedium &&
            displaySmall == other.displaySmall &&
            headlineLarge == other.headlineLarge &&
            headlineMedium == other.headlineMedium &&
            headlineSmall == other.headlineSmall &&
            titleLarge == other.titleLarge &&
            titleMedium == other.titleMedium &&
            titleSmall == other.titleSmall &&
            bodyLarge == other.bodyLarge &&
            bodyMedium == other.bodyMedium &&
            bodySmall == other.bodySmall &&
            labelLarge == other.labelLarge &&
            labelMedium == other.labelMedium &&
            labelSmall == other.labelSmall &&
            displayLargeEmphasized == other.displayLargeEmphasized &&
            displayMediumEmphasized == other.displayMediumEmphasized &&
            displaySmallEmphasized == other.displaySmallEmphasized &&
            headlineLargeEmphasized == other.headlineLargeEmphasized &&
            headlineMediumEmphasized == other.headlineMediumEmphasized &&
            headlineSmallEmphasized == other.headlineSmallEmphasized &&
            titleLargeEmphasized == other.titleLargeEmphasized &&
            titleMediumEmphasized == other.titleMediumEmphasized &&
            titleSmallEmphasized == other.titleSmallEmphasized &&
            bodyLargeEmphasized == other.bodyLargeEmphasized &&
            bodyMediumEmphasized == other.bodyMediumEmphasized &&
            bodySmallEmphasized == other.bodySmallEmphasized &&
            labelLargeEmphasized == other.labelLargeEmphasized &&
            labelMediumEmphasized == other.labelMediumEmphasized &&
            labelSmallEmphasized == other.labelSmallEmphasized;
  }

  @override
  int get hashCode => Object.hashAll([
    displayLarge,
    displayMedium,
    displaySmall,
    headlineLarge,
    headlineMedium,
    headlineSmall,
    titleLarge,
    titleMedium,
    titleSmall,
    bodyLarge,
    bodyMedium,
    bodySmall,
    labelLarge,
    labelMedium,
    labelSmall,
    displayLargeEmphasized,
    displayMediumEmphasized,
    displaySmallEmphasized,
    headlineLargeEmphasized,
    headlineMediumEmphasized,
    headlineSmallEmphasized,
    titleLargeEmphasized,
    titleMediumEmphasized,
    titleSmallEmphasized,
    bodyLargeEmphasized,
    bodyMediumEmphasized,
    bodySmallEmphasized,
    labelLargeEmphasized,
    labelMediumEmphasized,
    labelSmallEmphasized,
  ]);
}

@immutable
class _TypescaleThemeData with Diagnosticable, TypescaleThemeDataMixin {
  const _TypescaleThemeData({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.displayLargeEmphasized,
    required this.displayMediumEmphasized,
    required this.displaySmallEmphasized,
    required this.headlineLargeEmphasized,
    required this.headlineMediumEmphasized,
    required this.headlineSmallEmphasized,
    required this.titleLargeEmphasized,
    required this.titleMediumEmphasized,
    required this.titleSmallEmphasized,
    required this.bodyLargeEmphasized,
    required this.bodyMediumEmphasized,
    required this.bodySmallEmphasized,
    required this.labelLargeEmphasized,
    required this.labelMediumEmphasized,
    required this.labelSmallEmphasized,
  });

  @override
  final TypescaleStyle displayLarge;

  @override
  final TypescaleStyle displayMedium;

  @override
  final TypescaleStyle displaySmall;

  @override
  final TypescaleStyle headlineLarge;

  @override
  final TypescaleStyle headlineMedium;

  @override
  final TypescaleStyle headlineSmall;

  @override
  final TypescaleStyle titleLarge;

  @override
  final TypescaleStyle titleMedium;

  @override
  final TypescaleStyle titleSmall;

  @override
  final TypescaleStyle bodyLarge;

  @override
  final TypescaleStyle bodyMedium;

  @override
  final TypescaleStyle bodySmall;

  @override
  final TypescaleStyle labelLarge;

  @override
  final TypescaleStyle labelMedium;

  @override
  final TypescaleStyle labelSmall;

  @override
  final TypescaleStyle displayLargeEmphasized;

  @override
  final TypescaleStyle displayMediumEmphasized;

  @override
  final TypescaleStyle displaySmallEmphasized;

  @override
  final TypescaleStyle headlineLargeEmphasized;

  @override
  final TypescaleStyle headlineMediumEmphasized;

  @override
  final TypescaleStyle headlineSmallEmphasized;

  @override
  final TypescaleStyle titleLargeEmphasized;

  @override
  final TypescaleStyle titleMediumEmphasized;

  @override
  final TypescaleStyle titleSmallEmphasized;

  @override
  final TypescaleStyle bodyLargeEmphasized;

  @override
  final TypescaleStyle bodyMediumEmphasized;

  @override
  final TypescaleStyle bodySmallEmphasized;

  @override
  final TypescaleStyle labelLargeEmphasized;

  @override
  final TypescaleStyle labelMediumEmphasized;

  @override
  final TypescaleStyle labelSmallEmphasized;
}

@immutable
class _TypescaleThemeDataFallback with Diagnosticable, TypescaleThemeDataMixin {
  _TypescaleThemeDataFallback({required TypefaceThemeData typefaceTheme})
    : _typeface = typefaceTheme;

  final TypefaceThemeData _typeface;

  TypescaleStyle _buildTypescale({
    required List<String> font,
    required double weight,
    required double size,
    required double lineHeight,
    required double tracking,
  }) => TypescaleStyle(
    font: font,
    weight: weight,
    size: size,
    lineHeight: lineHeight,
    tracking: tracking,
    wght: weight,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: size,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TypescaleStyle get displayLarge => _buildTypescale(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 57.0,
    lineHeight: 64.0,
    tracking: -0.25,
  );

  @override
  TypescaleStyle get displayMedium => _buildTypescale(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 45.0,
    lineHeight: 52.0,
    tracking: 0.0,
  );

  @override
  TypescaleStyle get displaySmall => _buildTypescale(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 36.0,
    lineHeight: 44.0,
    tracking: 0.0,
  );

  @override
  TypescaleStyle get headlineLarge => _buildTypescale(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 32.0,
    lineHeight: 40.0,
    tracking: 0.0,
  );

  @override
  TypescaleStyle get headlineMedium => _buildTypescale(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 28.0,
    lineHeight: 36.0,
    tracking: 0.0,
  );

  @override
  TypescaleStyle get headlineSmall => _buildTypescale(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 24.0,
    lineHeight: 32.0,
    tracking: 0.0,
  );

  @override
  TypescaleStyle get titleLarge => _buildTypescale(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 22.0,
    lineHeight: 28.0,
    tracking: 0.0,
  );

  @override
  TypescaleStyle get titleMedium => _buildTypescale(
    font: _typeface.plain,
    weight: _typeface.weightMedium,
    size: 16.0,
    lineHeight: 24.0,
    tracking: 0.15,
  );

  @override
  TypescaleStyle get titleSmall => _buildTypescale(
    font: _typeface.plain,
    weight: _typeface.weightMedium,
    size: 14.0,
    lineHeight: 20.0,
    tracking: 0.1,
  );

  @override
  TypescaleStyle get bodyLarge => _buildTypescale(
    font: _typeface.plain,
    weight: _typeface.weightRegular,
    size: 16.0,
    lineHeight: 24.0,
    tracking: 0.5,
  );

  @override
  TypescaleStyle get bodyMedium => _buildTypescale(
    font: _typeface.plain,
    weight: _typeface.weightRegular,
    size: 14.0,
    lineHeight: 20.0,
    tracking: 0.25,
  );

  @override
  TypescaleStyle get bodySmall => _buildTypescale(
    font: _typeface.plain,
    weight: _typeface.weightRegular,
    size: 12.0,
    lineHeight: 16.0,
    tracking: 0.4,
  );

  @override
  TypescaleStyle get labelLarge => _buildTypescale(
    font: _typeface.plain,
    weight: _typeface.weightMedium,
    size: 14.0,
    lineHeight: 20.0,
    tracking: 0.1,
  );

  @override
  TypescaleStyle get labelMedium => _buildTypescale(
    font: _typeface.plain,
    weight: _typeface.weightMedium,
    size: 12.0,
    lineHeight: 16.0,
    tracking: 0.5,
  );

  @override
  TypescaleStyle get labelSmall => _buildTypescale(
    font: _typeface.plain,
    weight: _typeface.weightMedium,
    size: 11.0,
    lineHeight: 16.0,
    tracking: 0.5,
  );

  @override
  TypescaleStyle get displayLargeEmphasized =>
      displayLarge.copyWith(weight: _typeface.weightMedium);

  @override
  TypescaleStyle get displayMediumEmphasized =>
      displayMedium.copyWith(weight: _typeface.weightMedium);

  @override
  TypescaleStyle get displaySmallEmphasized =>
      displaySmall.copyWith(weight: _typeface.weightMedium);

  @override
  TypescaleStyle get headlineLargeEmphasized =>
      headlineLarge.copyWith(weight: _typeface.weightMedium);

  @override
  TypescaleStyle get headlineMediumEmphasized =>
      headlineMedium.copyWith(weight: _typeface.weightMedium);

  @override
  TypescaleStyle get headlineSmallEmphasized =>
      headlineSmall.copyWith(weight: _typeface.weightMedium);

  @override
  TypescaleStyle get titleLargeEmphasized =>
      titleLarge.copyWith(weight: _typeface.weightMedium);

  @override
  TypescaleStyle get titleMediumEmphasized =>
      titleMedium.copyWith(weight: _typeface.weightBold);

  @override
  TypescaleStyle get titleSmallEmphasized =>
      titleSmall.copyWith(weight: _typeface.weightBold);

  @override
  TypescaleStyle get bodyLargeEmphasized =>
      bodyLarge.copyWith(weight: _typeface.weightMedium);

  @override
  TypescaleStyle get bodyMediumEmphasized =>
      bodyMedium.copyWith(weight: _typeface.weightMedium);

  @override
  TypescaleStyle get bodySmallEmphasized =>
      bodySmall.copyWith(weight: _typeface.weightMedium);

  @override
  TypescaleStyle get labelLargeEmphasized =>
      labelLarge.copyWith(weight: _typeface.weightBold);

  @override
  TypescaleStyle get labelMediumEmphasized =>
      labelMedium.copyWith(weight: _typeface.weightBold);

  @override
  TypescaleStyle get labelSmallEmphasized =>
      labelSmall.copyWith(weight: _typeface.weightBold);
}
