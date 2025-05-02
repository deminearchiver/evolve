import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material3_expressive/material3_expressive.dart';
import 'typescale_style.dart';

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

  // const factory TypescaleThemeDataPartial.fallback(BuildContext context);

  factory TypescaleThemeDataPartial.fromTextTheme(TextTheme textTheme) {
    return TypescaleThemeDataPartial(
      displayLarge: TypescaleStylePartial.fromTextStyle(textTheme.displayLarge),
      displayMedium: TypescaleStylePartial.fromTextStyle(
        textTheme.displayMedium,
      ),
    );
  }

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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

mixin TypescaleThemeDataPartialMixin on Diagnosticable
    implements TypescaleThemeDataPartial {
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

  factory TypescaleThemeData.fallback(BuildContext context) =
      _TypescaleThemeDataFallback;

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

class _TypescaleThemeDataFallback with Diagnosticable, TypescaleThemeDataMixin {
  _TypescaleThemeDataFallback(this._context);

  final BuildContext _context;
  late final TypefaceThemeData _typeface = TypefaceTheme.of(_context);

  @override
  TypescaleStyle get displayLarge => TypescaleStyle(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 57.0,
    lineHeight: 64.0,
    tracking: -0.25,
  );

  @override
  TypescaleStyle get displayMedium => TypescaleStyle(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 45.0,
    lineHeight: 52.0,
    tracking: 0.0,
  );

  @override
  TypescaleStyle get displaySmall => TypescaleStyle(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 36.0,
    lineHeight: 44.0,
    tracking: 0.0,
  );

  @override
  TypescaleStyle get headlineLarge => TypescaleStyle(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 32.0,
    lineHeight: 40.0,
    tracking: 0.0,
  );

  @override
  TypescaleStyle get headlineMedium => TypescaleStyle(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 28.0,
    lineHeight: 36.0,
    tracking: 0.0,
  );

  @override
  TypescaleStyle get headlineSmall => TypescaleStyle(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 24.0,
    lineHeight: 32.0,
    tracking: 0.0,
  );

  @override
  TypescaleStyle get titleLarge => TypescaleStyle(
    font: _typeface.brand,
    weight: _typeface.weightRegular,
    size: 22.0,
    lineHeight: 28.0,
    tracking: 0.0,
  );

  @override
  TypescaleStyle get titleMedium => TypescaleStyle(
    font: _typeface.plain,
    weight: _typeface.weightMedium,
    size: 16.0,
    lineHeight: 24.0,
    tracking: 0.15,
  );

  @override
  TypescaleStyle get titleSmall => TypescaleStyle(
    font: _typeface.plain,
    weight: _typeface.weightMedium,
    size: 14.0,
    lineHeight: 20.0,
    tracking: 0.1,
  );

  @override
  TypescaleStyle get bodyLarge => TypescaleStyle(
    font: _typeface.plain,
    weight: _typeface.weightRegular,
    size: 16.0,
    lineHeight: 24.0,
    tracking: 0.5,
  );

  @override
  TypescaleStyle get bodyMedium => TypescaleStyle(
    font: _typeface.plain,
    weight: _typeface.weightRegular,
    size: 14.0,
    lineHeight: 20.0,
    tracking: 0.25,
  );

  @override
  TypescaleStyle get bodySmall => TypescaleStyle(
    font: _typeface.plain,
    weight: _typeface.weightRegular,
    size: 12.0,
    lineHeight: 16.0,
    tracking: 0.4,
  );

  @override
  TypescaleStyle get labelLarge => TypescaleStyle(
    font: _typeface.plain,
    weight: _typeface.weightMedium,
    size: 14.0,
    lineHeight: 20.0,
    tracking: 0.1,
  );

  @override
  TypescaleStyle get labelMedium => TypescaleStyle(
    font: _typeface.plain,
    weight: _typeface.weightMedium,
    size: 12.0,
    lineHeight: 16.0,
    tracking: 0.5,
  );

  @override
  TypescaleStyle get labelSmall => TypescaleStyle(
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TypescaleThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required TypescaleThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        TypescaleTheme(key: key, data: of(context).merge(data), child: child),
  );

  static TypescaleThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TypescaleTheme>()?.data;
  }

  static TypescaleThemeData of(BuildContext context) {
    final result = maybeOf(context);
    if (result != null) return result;
    return TypescaleThemeData.fallback(context);
  }
}
