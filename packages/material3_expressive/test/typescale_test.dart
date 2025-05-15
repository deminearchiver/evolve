import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material3_expressive/material3_expressive.dart';

void main() {
  group("TypescaleStylePartial", () {
    test("copyWith, apply, ==, hashCode basics", () {
      expect(
        const TypescaleStylePartial(),
        const TypescaleStylePartial().copyWith(),
      );
      expect(
        const TypescaleStylePartial().hashCode,
        const TypescaleStylePartial().copyWith().hashCode,
      );
      expect(
        const TypescaleStylePartial(),
        const TypescaleStylePartial().apply(),
      );
      expect(
        const TypescaleStylePartial().hashCode,
        const TypescaleStylePartial().apply().hashCode,
      );
      expect(
        const TypescaleStylePartial().copyWith(),
        const TypescaleStylePartial().apply(),
      );
      expect(
        const TypescaleStylePartial().copyWith().hashCode,
        const TypescaleStylePartial().apply().hashCode,
      );
    });
    testWidgets("Default debugFillProperties", (tester) async {
      final builder = DiagnosticPropertiesBuilder();
      const TypescaleStylePartial().debugFillProperties(builder);

      final description = builder.properties
          .where((node) => !node.isFiltered(DiagnosticLevel.info))
          .map((node) => node.toString())
          .toList();

      expect(description, <String>[]);
    });
  });
  group("TypescaleThemeDataPartial", () {
    test("copyWith, apply, ==, hashCode basics", () {
      expect(
        const TypescaleThemeDataPartial(),
        const TypescaleThemeDataPartial().copyWith(),
      );
      expect(
        const TypescaleThemeDataPartial().hashCode,
        const TypescaleThemeDataPartial().copyWith().hashCode,
      );
      expect(
        const TypescaleThemeDataPartial(),
        const TypescaleThemeDataPartial().apply(),
      );
      expect(
        const TypescaleThemeDataPartial().hashCode,
        const TypescaleThemeDataPartial().apply().hashCode,
      );
      expect(
        const TypescaleThemeDataPartial().copyWith(),
        const TypescaleThemeDataPartial().apply(),
      );
      expect(
        const TypescaleThemeDataPartial().copyWith().hashCode,
        const TypescaleThemeDataPartial().apply().hashCode,
      );
    });
    testWidgets("Default debugFillProperties", (tester) async {
      final builder = DiagnosticPropertiesBuilder();
      const TypescaleThemeDataPartial().debugFillProperties(builder);

      final description = builder.properties
          .where((node) => !node.isFiltered(DiagnosticLevel.info))
          .map((node) => node.toString())
          .toList();

      expect(description, <String>[]);
    });
  });
}
