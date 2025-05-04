import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material3_expressive/material3_expressive.dart';
import 'package:collection/collection.dart';

part 'typescale_style.dart';
part 'typescale_theme_data_partial.dart';
part 'typescale_theme_data.dart';
part 'typescale_theme.dart';

extension on TextStyle {
  TypescaleStylePartial _toTypescaleStylePartial() =>
      TypescaleStylePartial.fromTextStyle(this);
  TypescaleStyle _toTypescaleStyle() => TypescaleStyle.fromTextStyle(this);
}
