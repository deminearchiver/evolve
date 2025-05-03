import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material3_expressive/material3_expressive.dart';

abstract class WearTypographyThemeDataPartial with Diagnosticable {
  const factory WearTypographyThemeDataPartial({
    TypescaleStylePartial? display1,
    TypescaleStylePartial? display2,
    TypescaleStylePartial? display3,
    TypescaleStylePartial? title1,
    TypescaleStylePartial? title2,
    TypescaleStylePartial? title3,
    TypescaleStylePartial? body1,
    TypescaleStylePartial? body2,
    TypescaleStylePartial? button,
    TypescaleStylePartial? caption1,
    TypescaleStylePartial? caption2,
    TypescaleStylePartial? caption3,
  }) = _WearTypographyThemeDataPartial;

  TypescaleStylePartial? get display1;
  TypescaleStylePartial? get display2;
  TypescaleStylePartial? get display3;
  TypescaleStylePartial? get title1;
  TypescaleStylePartial? get title2;
  TypescaleStylePartial? get title3;
  TypescaleStylePartial? get body1;
  TypescaleStylePartial? get body2;
  TypescaleStylePartial? get button;
  TypescaleStylePartial? get caption1;
  TypescaleStylePartial? get caption2;
  TypescaleStylePartial? get caption3;

  WearTypographyThemeDataPartial copyWith({
    covariant TypescaleStylePartial? display1,
    covariant TypescaleStylePartial? display2,
    covariant TypescaleStylePartial? display3,
    covariant TypescaleStylePartial? title1,
    covariant TypescaleStylePartial? title2,
    covariant TypescaleStylePartial? title3,
    covariant TypescaleStylePartial? body1,
    covariant TypescaleStylePartial? body2,
    covariant TypescaleStylePartial? button,
    covariant TypescaleStylePartial? caption1,
    covariant TypescaleStylePartial? caption2,
    covariant TypescaleStylePartial? caption3,
  });

  WearTypographyThemeDataPartial apply({
    TypescaleStylePartial? display1,
    TypescaleStylePartial? display2,
    TypescaleStylePartial? display3,
    TypescaleStylePartial? title1,
    TypescaleStylePartial? title2,
    TypescaleStylePartial? title3,
    TypescaleStylePartial? body1,
    TypescaleStylePartial? body2,
    TypescaleStylePartial? button,
    TypescaleStylePartial? caption1,
    TypescaleStylePartial? caption2,
    TypescaleStylePartial? caption3,
  });

  WearTypographyThemeDataPartial merge(WearTypographyThemeDataPartial? other);
}

mixin WearTypographyThemeDataPartialMixin on Diagnosticable
    implements WearTypographyThemeDataPartial {
  @override
  WearTypographyThemeDataPartial copyWith({
    covariant TypescaleStylePartial? display1,
    covariant TypescaleStylePartial? display2,
    covariant TypescaleStylePartial? display3,
    covariant TypescaleStylePartial? title1,
    covariant TypescaleStylePartial? title2,
    covariant TypescaleStylePartial? title3,
    covariant TypescaleStylePartial? body1,
    covariant TypescaleStylePartial? body2,
    covariant TypescaleStylePartial? button,
    covariant TypescaleStylePartial? caption1,
    covariant TypescaleStylePartial? caption2,
    covariant TypescaleStylePartial? caption3,
  }) {
    if (display1 == null &&
        display2 == null &&
        display3 == null &&
        title1 == null &&
        title2 == null &&
        title3 == null &&
        body1 == null &&
        body2 == null &&
        button == null &&
        caption1 == null &&
        caption2 == null &&
        caption3 == null) {
      return this;
    }
    return WearTypographyThemeDataPartial(
      display1: display1 ?? this.display1,
      display2: display2 ?? this.display2,
      display3: display3 ?? this.display3,
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      title3: title3 ?? this.title3,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      button: button ?? this.button,
      caption1: caption1 ?? this.caption1,
      caption2: caption2 ?? this.caption2,
      caption3: caption3 ?? this.caption3,
    );
  }

  @override
  WearTypographyThemeDataPartial apply({
    TypescaleStylePartial? display1,
    TypescaleStylePartial? display2,
    TypescaleStylePartial? display3,
    TypescaleStylePartial? title1,
    TypescaleStylePartial? title2,
    TypescaleStylePartial? title3,
    TypescaleStylePartial? body1,
    TypescaleStylePartial? body2,
    TypescaleStylePartial? button,
    TypescaleStylePartial? caption1,
    TypescaleStylePartial? caption2,
    TypescaleStylePartial? caption3,
  }) {
    if (display1 == null &&
        display2 == null &&
        display3 == null &&
        title1 == null &&
        title2 == null &&
        title3 == null &&
        body1 == null &&
        body2 == null &&
        button == null &&
        caption1 == null &&
        caption2 == null &&
        caption3 == null) {
      return this;
    }
    return WearTypographyThemeDataPartial(
      display1: this.display1?.merge(display1) ?? display1,
      display2: this.display2?.merge(display2) ?? display2,
      display3: this.display3?.merge(display3) ?? display3,
      title1: this.title1?.merge(title1) ?? title1,
      title2: this.title2?.merge(title2) ?? title2,
      title3: this.title3?.merge(title3) ?? title3,
      body1: this.body1?.merge(body1) ?? body1,
      body2: this.body2?.merge(body2) ?? body2,
      button: this.button?.merge(button) ?? button,
      caption1: this.caption1?.merge(caption1) ?? caption1,
      caption2: this.caption2?.merge(caption2) ?? caption2,
      caption3: this.caption3?.merge(caption3) ?? caption3,
    );
  }

  @override
  WearTypographyThemeDataPartial merge(WearTypographyThemeDataPartial? other) {
    if (other == null) return this;
    return apply(
      display1: other.display1,
      display2: other.display2,
      display3: other.display3,
      title1: other.title1,
      title2: other.title2,
      title3: other.title3,
      body1: other.body1,
      body2: other.body2,
      button: other.button,
      caption1: other.caption1,
      caption2: other.caption2,
      caption3: other.caption3,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is WearTypographyThemeDataPartial &&
            display1 == other.display1 &&
            display2 == other.display2 &&
            display3 == other.display3 &&
            title1 == other.title1 &&
            title2 == other.title2 &&
            title3 == other.title3 &&
            body1 == other.body1 &&
            body2 == other.body2 &&
            button == other.button &&
            caption1 == other.caption1 &&
            caption2 == other.caption2 &&
            caption3 == other.caption3;
  }

  @override
  int get hashCode => Object.hash(
    display1,
    display2,
    display3,
    title1,
    title2,
    title3,
    body1,
    body2,
    button,
    caption1,
    caption2,
    caption3,
  );
}

class _WearTypographyThemeDataPartial
    with Diagnosticable, WearTypographyThemeDataPartialMixin {
  const _WearTypographyThemeDataPartial({
    this.display1,
    this.display2,
    this.display3,
    this.title1,
    this.title2,
    this.title3,
    this.body1,
    this.body2,
    this.button,
    this.caption1,
    this.caption2,
    this.caption3,
  });

  @override
  final TypescaleStylePartial? display1;

  @override
  final TypescaleStylePartial? display2;

  @override
  final TypescaleStylePartial? display3;

  @override
  final TypescaleStylePartial? title1;

  @override
  final TypescaleStylePartial? title2;

  @override
  final TypescaleStylePartial? title3;

  @override
  final TypescaleStylePartial? body1;

  @override
  final TypescaleStylePartial? body2;

  @override
  final TypescaleStylePartial? button;

  @override
  final TypescaleStylePartial? caption1;

  @override
  final TypescaleStylePartial? caption2;

  @override
  final TypescaleStylePartial? caption3;
}

abstract class WearTypographyThemeData
    with Diagnosticable
    implements WearTypographyThemeDataPartial {
  const factory WearTypographyThemeData({
    required TypescaleStyle display1,
    required TypescaleStyle display2,
    required TypescaleStyle display3,
    required TypescaleStyle title1,
    required TypescaleStyle title2,
    required TypescaleStyle title3,
    required TypescaleStyle body1,
    required TypescaleStyle body2,
    required TypescaleStyle button,
    required TypescaleStyle caption1,
    required TypescaleStyle caption2,
    required TypescaleStyle caption3,
  }) = _WearTypographyThemeData;

  @override
  TypescaleStyle get display1;

  @override
  TypescaleStyle get display2;

  @override
  TypescaleStyle get display3;

  @override
  TypescaleStyle get title1;

  @override
  TypescaleStyle get title2;

  @override
  TypescaleStyle get title3;

  @override
  TypescaleStyle get body1;

  @override
  TypescaleStyle get body2;

  @override
  TypescaleStyle get button;

  @override
  TypescaleStyle get caption1;

  @override
  TypescaleStyle get caption2;

  @override
  TypescaleStyle get caption3;

  @override
  WearTypographyThemeData copyWith({
    covariant TypescaleStyle? display1,
    covariant TypescaleStyle? display2,
    covariant TypescaleStyle? display3,
    covariant TypescaleStyle? title1,
    covariant TypescaleStyle? title2,
    covariant TypescaleStyle? title3,
    covariant TypescaleStyle? body1,
    covariant TypescaleStyle? body2,
    covariant TypescaleStyle? button,
    covariant TypescaleStyle? caption1,
    covariant TypescaleStyle? caption2,
    covariant TypescaleStyle? caption3,
  });

  @override
  WearTypographyThemeData apply({
    TypescaleStylePartial? display1,
    TypescaleStylePartial? display2,
    TypescaleStylePartial? display3,
    TypescaleStylePartial? title1,
    TypescaleStylePartial? title2,
    TypescaleStylePartial? title3,
    TypescaleStylePartial? body1,
    TypescaleStylePartial? body2,
    TypescaleStylePartial? button,
    TypescaleStylePartial? caption1,
    TypescaleStylePartial? caption2,
    TypescaleStylePartial? caption3,
  });

  @override
  WearTypographyThemeData merge(WearTypographyThemeDataPartial? other);
}

mixin WearTypographyThemeDataMixin on Diagnosticable
    implements WearTypographyThemeData {
  @override
  WearTypographyThemeData copyWith({
    TypescaleStyle? display1,
    TypescaleStyle? display2,
    TypescaleStyle? display3,
    TypescaleStyle? title1,
    TypescaleStyle? title2,
    TypescaleStyle? title3,
    TypescaleStyle? body1,
    TypescaleStyle? body2,
    TypescaleStyle? button,
    TypescaleStyle? caption1,
    TypescaleStyle? caption2,
    TypescaleStyle? caption3,
  }) {
    if (display1 == null &&
        display2 == null &&
        display3 == null &&
        title1 == null &&
        title2 == null &&
        title3 == null &&
        body1 == null &&
        body2 == null &&
        button == null &&
        caption1 == null &&
        caption2 == null &&
        caption3 == null) {
      return this;
    }
    return WearTypographyThemeData(
      display1: display1 ?? this.display1,
      display2: display2 ?? this.display2,
      display3: display3 ?? this.display3,
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      title3: title3 ?? this.title3,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      button: button ?? this.button,
      caption1: caption1 ?? this.caption1,
      caption2: caption2 ?? this.caption2,
      caption3: caption3 ?? this.caption3,
    );
  }

  @override
  WearTypographyThemeData apply({
    TypescaleStylePartial? display1,
    TypescaleStylePartial? display2,
    TypescaleStylePartial? display3,
    TypescaleStylePartial? title1,
    TypescaleStylePartial? title2,
    TypescaleStylePartial? title3,
    TypescaleStylePartial? body1,
    TypescaleStylePartial? body2,
    TypescaleStylePartial? button,
    TypescaleStylePartial? caption1,
    TypescaleStylePartial? caption2,
    TypescaleStylePartial? caption3,
  }) {
    if (display1 == null &&
        display2 == null &&
        display3 == null &&
        title1 == null &&
        title2 == null &&
        title3 == null &&
        body1 == null &&
        body2 == null &&
        button == null &&
        caption1 == null &&
        caption2 == null &&
        caption3 == null) {
      return this;
    }
    return WearTypographyThemeData(
      display1: this.display1.merge(display1),
      display2: this.display2.merge(display2),
      display3: this.display3.merge(display3),
      title1: this.title1.merge(title1),
      title2: this.title2.merge(title2),
      title3: this.title3.merge(title3),
      body1: this.body1.merge(body1),
      body2: this.body2.merge(body2),
      button: this.button.merge(button),
      caption1: this.caption1.merge(caption1),
      caption2: this.caption2.merge(caption2),
      caption3: this.caption3.merge(caption3),
    );
  }

  @override
  WearTypographyThemeData merge(WearTypographyThemeDataPartial? other) {
    if (other == null) return this;
    return apply(
      display1: other.display1,
      display2: other.display2,
      display3: other.display3,
      title1: other.title1,
      title2: other.title2,
      title3: other.title3,
      body1: other.body1,
      body2: other.body2,
      button: other.button,
      caption1: other.caption1,
      caption2: other.caption2,
      caption3: other.caption3,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is WearTypographyThemeData &&
            display1 == other.display1 &&
            display2 == other.display2 &&
            display3 == other.display3 &&
            title1 == other.title1 &&
            title2 == other.title2 &&
            title3 == other.title3 &&
            body1 == other.body1 &&
            body2 == other.body2 &&
            button == other.button &&
            caption1 == other.caption1 &&
            caption2 == other.caption2 &&
            caption3 == other.caption3;
  }

  @override
  int get hashCode => Object.hash(
    display1,
    display2,
    display3,
    title1,
    title2,
    title3,
    body1,
    body2,
    button,
    caption1,
    caption2,
    caption3,
  );
}

class _WearTypographyThemeData
    with Diagnosticable, WearTypographyThemeDataMixin {
  const _WearTypographyThemeData({
    required this.display1,
    required this.display2,
    required this.display3,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.body1,
    required this.body2,
    required this.button,
    required this.caption1,
    required this.caption2,
    required this.caption3,
  });

  @override
  final TypescaleStyle display1;

  @override
  final TypescaleStyle display2;

  @override
  final TypescaleStyle display3;

  @override
  final TypescaleStyle title1;

  @override
  final TypescaleStyle title2;

  @override
  final TypescaleStyle title3;

  @override
  final TypescaleStyle body1;

  @override
  final TypescaleStyle body2;

  @override
  final TypescaleStyle button;

  @override
  final TypescaleStyle caption1;

  @override
  final TypescaleStyle caption2;

  @override
  final TypescaleStyle caption3;
}

class _WearTypographyThemeDataFallback
    with Diagnosticable, WearTypographyThemeDataMixin {
  _WearTypographyThemeDataFallback(this.context);

  final BuildContext context;

  @override
  TypescaleStyle get display1 => const TypescaleStyle(
    font: ["Roboto"],
    weight: 500.0,
    size: 40.0,
    lineHeight: 46.0,
    tracking: 0.5,
  );

  @override
  TypescaleStyle get display2 => const TypescaleStyle(
    font: ["Roboto"],
    weight: 500.0,
    size: 34.0,
    lineHeight: 40.0,
    tracking: 1.0,
  );

  @override
  TypescaleStyle get display3 => const TypescaleStyle(
    font: ["Roboto"],
    weight: 500.0,
    size: 30.0,
    lineHeight: 36.0,
    tracking: 0.8,
  );

  @override
  TypescaleStyle get title1 => const TypescaleStyle(
    font: ["Roboto"],
    weight: 500.0,
    size: 24.0,
    lineHeight: 28.0,
    tracking: 0.2,
  );

  @override
  TypescaleStyle get title2 => const TypescaleStyle(
    font: ["Roboto"],
    weight: 500.0,
    size: 20.0,
    lineHeight: 24.0,
    tracking: 0.2,
  );

  @override
  TypescaleStyle get title3 => const TypescaleStyle(
    font: ["Roboto"],
    weight: 500.0,
    size: 16.0,
    lineHeight: 20.0,
    tracking: 0.2,
  );

  @override
  TypescaleStyle get body1 => const TypescaleStyle(
    font: ["Roboto"],
    weight: 400.0,
    size: 16.0,
    lineHeight: 20.0,
    tracking: 0.18,
  );

  @override
  TypescaleStyle get body2 => const TypescaleStyle(
    font: ["Roboto"],
    weight: 400.0,
    size: 14.0,
    lineHeight: 18.0,
    tracking: 0.2,
  );

  @override
  TypescaleStyle get button => const TypescaleStyle(
    font: ["Roboto"],
    weight: 700.0,
    size: 15.0,
    lineHeight: 19.0,
    tracking: 0.38,
  );

  @override
  TypescaleStyle get caption1 => const TypescaleStyle(
    font: ["Roboto"],
    weight: 500.0,
    size: 14.0,
    lineHeight: 18.0,
    tracking: 0.1,
  );

  @override
  TypescaleStyle get caption2 => const TypescaleStyle(
    font: ["Roboto"],
    weight: 500.0,
    size: 12.0,
    lineHeight: 16.0,
    tracking: 0.1,
  );

  @override
  TypescaleStyle get caption3 => const TypescaleStyle(
    font: ["Roboto"],
    weight: 500.0,
    size: 10.0,
    lineHeight: 14.0,
    tracking: 0.1,
  );
}

class WearTypographyTheme extends InheritedTheme {
  const WearTypographyTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final WearTypographyThemeData data;

  @override
  bool updateShouldNotify(covariant WearTypographyTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return WearTypographyTheme(data: data, child: child);
  }

  static Widget merge({
    Key? key,
    required WearTypographyThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) => WearTypographyTheme(
      key: key,
      data: of(context).merge(data),
      child: child,
    ),
  );

  static WearTypographyThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<WearTypographyTheme>()
        ?.data;
  }

  static WearTypographyThemeData of(BuildContext context) {
    return maybeOf(context) ?? _WearTypographyThemeDataFallback(context);
  }
}
