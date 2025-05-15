import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material3_expressive/material3_expressive.dart';

void main() {
  group("TypefaceThemeDataPartial", () {
    test("copyWith, apply, merge, ==, hashCode basics", () {
      expect(
        const TypefaceThemeDataPartial(),
        const TypefaceThemeDataPartial().copyWith(),
      );
      expect(
        const TypefaceThemeDataPartial().hashCode,
        const TypefaceThemeDataPartial().copyWith().hashCode,
      );
      expect(
        const TypefaceThemeDataPartial(),
        const TypefaceThemeDataPartial().apply(),
      );
      expect(
        const TypefaceThemeDataPartial().hashCode,
        const TypefaceThemeDataPartial().apply().hashCode,
      );
      expect(
        const TypefaceThemeDataPartial().copyWith(),
        const TypefaceThemeDataPartial().apply(),
      );
      expect(
        const TypefaceThemeDataPartial().copyWith().hashCode,
        const TypefaceThemeDataPartial().apply().hashCode,
      );
      expect(
        const TypefaceThemeDataPartial(),
        const TypefaceThemeDataPartial().merge(null),
      );
      expect(
        const TypefaceThemeDataPartial().hashCode,
        const TypefaceThemeDataPartial().merge(null).hashCode,
      );
    });

    testWidgets("Default debugFillProperties", (tester) async {
      final builder = DiagnosticPropertiesBuilder();
      const TypefaceThemeDataPartial().debugFillProperties(builder);

      final description = builder.properties
          .where((node) => !node.isFiltered(DiagnosticLevel.info))
          .map((node) => node.toString())
          .toList();

      expect(description, <String>[]);
    });
    test("lerp special cases", () {
      // TODO: add condition identical(a, b) && a != null -> return a
      // expect(
      //   TypefaceThemeDataPartial.lerp(null, null, 0),
      //   const TypefaceThemeDataPartial(),
      // );
      const theme = TypefaceThemeDataPartial();
      expect(
        identical(TypefaceThemeDataPartial.lerp(theme, theme, 0.5), theme),
        true,
      );
    });
  });
}
