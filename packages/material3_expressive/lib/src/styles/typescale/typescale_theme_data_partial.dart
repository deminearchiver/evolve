part of 'typescale.dart';

@immutable
abstract class TypescaleThemeDataPartial with Diagnosticable {
  const factory TypescaleThemeDataPartial({
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
  }) = _TypescaleThemeDataPartial;

  factory TypescaleThemeDataPartial.fromTextTheme(TextTheme textTheme) {
    return TypescaleThemeDataPartial(
      displayLarge: textTheme.displayLarge?._toTypescaleStylePartial(),
      displayMedium: textTheme.displayMedium?._toTypescaleStylePartial(),
      displaySmall: textTheme.displaySmall?._toTypescaleStylePartial(),
      headlineLarge: textTheme.headlineLarge?._toTypescaleStylePartial(),
      headlineMedium: textTheme.headlineMedium?._toTypescaleStylePartial(),
      headlineSmall: textTheme.headlineSmall?._toTypescaleStylePartial(),
      titleLarge: textTheme.titleLarge?._toTypescaleStylePartial(),
      titleMedium: textTheme.titleMedium?._toTypescaleStylePartial(),
      titleSmall: textTheme.titleSmall?._toTypescaleStylePartial(),
      bodyLarge: textTheme.bodyLarge?._toTypescaleStylePartial(),
      bodyMedium: textTheme.bodyMedium?._toTypescaleStylePartial(),
      bodySmall: textTheme.bodySmall?._toTypescaleStylePartial(),
      labelLarge: textTheme.labelLarge?._toTypescaleStylePartial(),
      labelMedium: textTheme.labelMedium?._toTypescaleStylePartial(),
      labelSmall: textTheme.labelSmall?._toTypescaleStylePartial(),
    );
  }

  // const factory TypescaleThemeDataPartial.fallback(BuildContext context);

  TypescaleStylePartial? get displayLarge;

  TypescaleStylePartial? get displayMedium;

  TypescaleStylePartial? get displaySmall;

  TypescaleStylePartial? get headlineLarge;

  TypescaleStylePartial? get headlineMedium;

  TypescaleStylePartial? get headlineSmall;

  TypescaleStylePartial? get titleLarge;

  TypescaleStylePartial? get titleMedium;

  TypescaleStylePartial? get titleSmall;

  TypescaleStylePartial? get bodyLarge;

  TypescaleStylePartial? get bodyMedium;

  TypescaleStylePartial? get bodySmall;

  TypescaleStylePartial? get labelLarge;

  TypescaleStylePartial? get labelMedium;

  TypescaleStylePartial? get labelSmall;

  TypescaleStylePartial? get displayLargeEmphasized;

  TypescaleStylePartial? get displayMediumEmphasized;

  TypescaleStylePartial? get displaySmallEmphasized;

  TypescaleStylePartial? get headlineLargeEmphasized;

  TypescaleStylePartial? get headlineMediumEmphasized;

  TypescaleStylePartial? get headlineSmallEmphasized;

  TypescaleStylePartial? get titleLargeEmphasized;

  TypescaleStylePartial? get titleMediumEmphasized;

  TypescaleStylePartial? get titleSmallEmphasized;

  TypescaleStylePartial? get bodyLargeEmphasized;

  TypescaleStylePartial? get bodyMediumEmphasized;

  TypescaleStylePartial? get bodySmallEmphasized;

  TypescaleStylePartial? get labelLargeEmphasized;

  TypescaleStylePartial? get labelMediumEmphasized;

  TypescaleStylePartial? get labelSmallEmphasized;

  TypescaleThemeDataPartial copyWith({
    covariant TypescaleStylePartial? displayLarge,
    covariant TypescaleStylePartial? displayMedium,
    covariant TypescaleStylePartial? displaySmall,
    covariant TypescaleStylePartial? headlineLarge,
    covariant TypescaleStylePartial? headlineMedium,
    covariant TypescaleStylePartial? headlineSmall,
    covariant TypescaleStylePartial? titleLarge,
    covariant TypescaleStylePartial? titleMedium,
    covariant TypescaleStylePartial? titleSmall,
    covariant TypescaleStylePartial? bodyLarge,
    covariant TypescaleStylePartial? bodyMedium,
    covariant TypescaleStylePartial? bodySmall,
    covariant TypescaleStylePartial? labelLarge,
    covariant TypescaleStylePartial? labelMedium,
    covariant TypescaleStylePartial? labelSmall,
    covariant TypescaleStylePartial? displayLargeEmphasized,
    covariant TypescaleStylePartial? displayMediumEmphasized,
    covariant TypescaleStylePartial? displaySmallEmphasized,
    covariant TypescaleStylePartial? headlineLargeEmphasized,
    covariant TypescaleStylePartial? headlineMediumEmphasized,
    covariant TypescaleStylePartial? headlineSmallEmphasized,
    covariant TypescaleStylePartial? titleLargeEmphasized,
    covariant TypescaleStylePartial? titleMediumEmphasized,
    covariant TypescaleStylePartial? titleSmallEmphasized,
    covariant TypescaleStylePartial? bodyLargeEmphasized,
    covariant TypescaleStylePartial? bodyMediumEmphasized,
    covariant TypescaleStylePartial? bodySmallEmphasized,
    covariant TypescaleStylePartial? labelLargeEmphasized,
    covariant TypescaleStylePartial? labelMediumEmphasized,
    covariant TypescaleStylePartial? labelSmallEmphasized,
  });

  TypescaleThemeDataPartial apply({
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

  TypescaleThemeDataPartial merge(TypescaleThemeDataPartial? other);

  TextTheme toTextTheme();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

mixin TypescaleThemeDataPartialMixin on Diagnosticable
    implements TypescaleThemeDataPartial {
  @override
  TypescaleThemeDataPartial copyWith({
    covariant TypescaleStylePartial? displayLarge,
    covariant TypescaleStylePartial? displayMedium,
    covariant TypescaleStylePartial? displaySmall,
    covariant TypescaleStylePartial? headlineLarge,
    covariant TypescaleStylePartial? headlineMedium,
    covariant TypescaleStylePartial? headlineSmall,
    covariant TypescaleStylePartial? titleLarge,
    covariant TypescaleStylePartial? titleMedium,
    covariant TypescaleStylePartial? titleSmall,
    covariant TypescaleStylePartial? bodyLarge,
    covariant TypescaleStylePartial? bodyMedium,
    covariant TypescaleStylePartial? bodySmall,
    covariant TypescaleStylePartial? labelLarge,
    covariant TypescaleStylePartial? labelMedium,
    covariant TypescaleStylePartial? labelSmall,
    covariant TypescaleStylePartial? displayLargeEmphasized,
    covariant TypescaleStylePartial? displayMediumEmphasized,
    covariant TypescaleStylePartial? displaySmallEmphasized,
    covariant TypescaleStylePartial? headlineLargeEmphasized,
    covariant TypescaleStylePartial? headlineMediumEmphasized,
    covariant TypescaleStylePartial? headlineSmallEmphasized,
    covariant TypescaleStylePartial? titleLargeEmphasized,
    covariant TypescaleStylePartial? titleMediumEmphasized,
    covariant TypescaleStylePartial? titleSmallEmphasized,
    covariant TypescaleStylePartial? bodyLargeEmphasized,
    covariant TypescaleStylePartial? bodyMediumEmphasized,
    covariant TypescaleStylePartial? bodySmallEmphasized,
    covariant TypescaleStylePartial? labelLargeEmphasized,
    covariant TypescaleStylePartial? labelMediumEmphasized,
    covariant TypescaleStylePartial? labelSmallEmphasized,
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
    return TypescaleThemeDataPartial(
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
  TypescaleThemeDataPartial apply({
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
    return TypescaleThemeDataPartial(
      displayLarge: this.displayLarge?.merge(displayLarge) ?? displayLarge,
      displayMedium: this.displayMedium?.merge(displayMedium) ?? displayMedium,
      displaySmall: this.displaySmall?.merge(displaySmall) ?? displaySmall,
      headlineLarge: this.headlineLarge?.merge(headlineLarge) ?? headlineLarge,
      headlineMedium:
          this.headlineMedium?.merge(headlineMedium) ?? headlineMedium,
      headlineSmall: this.headlineSmall?.merge(headlineSmall) ?? headlineSmall,
      titleLarge: this.titleLarge?.merge(titleLarge) ?? titleLarge,
      titleMedium: this.titleMedium?.merge(titleMedium) ?? titleMedium,
      titleSmall: this.titleSmall?.merge(titleSmall) ?? titleSmall,
      bodyLarge: this.bodyLarge?.merge(bodyLarge) ?? bodyLarge,
      bodyMedium: this.bodyMedium?.merge(bodyMedium) ?? bodyMedium,
      bodySmall: this.bodySmall?.merge(bodySmall) ?? bodySmall,
      labelLarge: this.labelLarge?.merge(labelLarge) ?? labelLarge,
      labelMedium: this.labelMedium?.merge(labelMedium) ?? labelMedium,
      labelSmall: this.labelSmall?.merge(labelSmall) ?? labelSmall,
      displayLargeEmphasized:
          this.displayLargeEmphasized?.merge(displayLargeEmphasized) ??
          displayLargeEmphasized,
      displayMediumEmphasized:
          this.displayMediumEmphasized?.merge(displayMediumEmphasized) ??
          displayMediumEmphasized,
      displaySmallEmphasized:
          this.displaySmallEmphasized?.merge(displaySmallEmphasized) ??
          displaySmallEmphasized,
      headlineLargeEmphasized:
          this.headlineLargeEmphasized?.merge(headlineLargeEmphasized) ??
          headlineLargeEmphasized,
      headlineMediumEmphasized:
          this.headlineMediumEmphasized?.merge(headlineMediumEmphasized) ??
          headlineMediumEmphasized,
      headlineSmallEmphasized:
          this.headlineSmallEmphasized?.merge(headlineSmallEmphasized) ??
          headlineSmallEmphasized,
      titleLargeEmphasized:
          this.titleLargeEmphasized?.merge(titleLargeEmphasized) ??
          titleLargeEmphasized,
      titleMediumEmphasized:
          this.titleMediumEmphasized?.merge(titleMediumEmphasized) ??
          titleMediumEmphasized,
      titleSmallEmphasized:
          this.titleSmallEmphasized?.merge(titleSmallEmphasized) ??
          titleSmallEmphasized,
      bodyLargeEmphasized:
          this.bodyLargeEmphasized?.merge(bodyLargeEmphasized) ??
          bodyLargeEmphasized,
      bodyMediumEmphasized:
          this.bodyMediumEmphasized?.merge(bodyMediumEmphasized) ??
          bodyMediumEmphasized,
      bodySmallEmphasized:
          this.bodySmallEmphasized?.merge(bodySmallEmphasized) ??
          bodySmallEmphasized,
      labelLargeEmphasized:
          this.labelLargeEmphasized?.merge(labelLargeEmphasized) ??
          labelLargeEmphasized,
      labelMediumEmphasized:
          this.labelMediumEmphasized?.merge(labelMediumEmphasized) ??
          labelMediumEmphasized,
      labelSmallEmphasized:
          this.labelSmallEmphasized?.merge(labelSmallEmphasized) ??
          labelSmallEmphasized,
    );
  }

  @override
  TypescaleThemeDataPartial merge(TypescaleThemeDataPartial? other) {
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
    displayLarge: displayLarge?.toTextStyle(),
    displayMedium: displayMedium?.toTextStyle(),
    displaySmall: displaySmall?.toTextStyle(),
    headlineLarge: headlineLarge?.toTextStyle(),
    headlineMedium: headlineMedium?.toTextStyle(),
    headlineSmall: headlineSmall?.toTextStyle(),
    titleLarge: titleLarge?.toTextStyle(),
    titleMedium: titleMedium?.toTextStyle(),
    titleSmall: titleSmall?.toTextStyle(),
    bodyLarge: bodyLarge?.toTextStyle(),
    bodyMedium: bodyMedium?.toTextStyle(),
    bodySmall: bodySmall?.toTextStyle(),
    labelLarge: labelLarge?.toTextStyle(),
    labelMedium: labelMedium?.toTextStyle(),
    labelSmall: labelSmall?.toTextStyle(),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "displayLarge",
        displayLarge,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "displayMedium",
        displayMedium,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "displaySmall",
        displaySmall,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "headlineLarge",
        headlineLarge,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "headlineMedium",
        headlineMedium,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "headlineSmall",
        headlineSmall,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "titleLarge",
        titleLarge,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "titleMedium",
        titleMedium,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "titleSmall",
        titleSmall,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "bodyLarge",
        bodyLarge,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "bodyMedium",
        bodyMedium,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "bodySmall",
        bodySmall,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "labelLarge",
        labelLarge,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "labelMedium",
        labelMedium,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "labelSmall",
        labelSmall,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "displayLargeEmphasized",
        displayLargeEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "displayMediumEmphasized",
        displayMediumEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "displaySmallEmphasized",
        displaySmallEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "headlineLargeEmphasized",
        headlineLargeEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "headlineMediumEmphasized",
        headlineMediumEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "headlineSmallEmphasized",
        headlineSmallEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "titleLargeEmphasized",
        titleLargeEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "titleMediumEmphasized",
        titleMediumEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "titleSmallEmphasized",
        titleSmallEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "bodyLargeEmphasized",
        bodyLargeEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "bodyMediumEmphasized",
        bodyMediumEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "bodySmallEmphasized",
        bodySmallEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "labelLargeEmphasized",
        labelLargeEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "labelMediumEmphasized",
        labelMediumEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TypescaleStylePartial>(
        "labelSmallEmphasized",
        labelSmallEmphasized,
        defaultValue: null,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is TypescaleThemeDataPartial &&
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
class _TypescaleThemeDataPartial
    with Diagnosticable, TypescaleThemeDataPartialMixin {
  const _TypescaleThemeDataPartial({
    this.displayLarge,
    this.displayMedium,
    this.displaySmall,
    this.headlineLarge,
    this.headlineMedium,
    this.headlineSmall,
    this.titleLarge,
    this.titleMedium,
    this.titleSmall,
    this.bodyLarge,
    this.bodyMedium,
    this.bodySmall,
    this.labelLarge,
    this.labelMedium,
    this.labelSmall,
    this.displayLargeEmphasized,
    this.displayMediumEmphasized,
    this.displaySmallEmphasized,
    this.headlineLargeEmphasized,
    this.headlineMediumEmphasized,
    this.headlineSmallEmphasized,
    this.titleLargeEmphasized,
    this.titleMediumEmphasized,
    this.titleSmallEmphasized,
    this.bodyLargeEmphasized,
    this.bodyMediumEmphasized,
    this.bodySmallEmphasized,
    this.labelLargeEmphasized,
    this.labelMediumEmphasized,
    this.labelSmallEmphasized,
  });

  @override
  final TypescaleStylePartial? displayLarge;

  @override
  final TypescaleStylePartial? displayMedium;

  @override
  final TypescaleStylePartial? displaySmall;

  @override
  final TypescaleStylePartial? headlineLarge;

  @override
  final TypescaleStylePartial? headlineMedium;

  @override
  final TypescaleStylePartial? headlineSmall;

  @override
  final TypescaleStylePartial? titleLarge;

  @override
  final TypescaleStylePartial? titleMedium;

  @override
  final TypescaleStylePartial? titleSmall;

  @override
  final TypescaleStylePartial? bodyLarge;

  @override
  final TypescaleStylePartial? bodyMedium;

  @override
  final TypescaleStylePartial? bodySmall;

  @override
  final TypescaleStylePartial? labelLarge;

  @override
  final TypescaleStylePartial? labelMedium;

  @override
  final TypescaleStylePartial? labelSmall;

  @override
  final TypescaleStylePartial? displayLargeEmphasized;

  @override
  final TypescaleStylePartial? displayMediumEmphasized;

  @override
  final TypescaleStylePartial? displaySmallEmphasized;

  @override
  final TypescaleStylePartial? headlineLargeEmphasized;

  @override
  final TypescaleStylePartial? headlineMediumEmphasized;

  @override
  final TypescaleStylePartial? headlineSmallEmphasized;

  @override
  final TypescaleStylePartial? titleLargeEmphasized;

  @override
  final TypescaleStylePartial? titleMediumEmphasized;

  @override
  final TypescaleStylePartial? titleSmallEmphasized;

  @override
  final TypescaleStylePartial? bodyLargeEmphasized;

  @override
  final TypescaleStylePartial? bodyMediumEmphasized;

  @override
  final TypescaleStylePartial? bodySmallEmphasized;

  @override
  final TypescaleStylePartial? labelLargeEmphasized;

  @override
  final TypescaleStylePartial? labelMediumEmphasized;

  @override
  final TypescaleStylePartial? labelSmallEmphasized;
}
