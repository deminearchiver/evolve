import 'package:mcu/mcu.dart';
import 'package:mcu/src/dynamiccolor/color_spec.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final DynamicScheme scheme = SchemeExpressive(
      sourceColorHct: Hct.fromInt(0xFF6750A4),
      isDark: false,
      contrastLevel: 0.0,
      specVersion: SpecVersion.spec2025,
    );
    // final colorSpec = ColorSpecs.get(scheme.specVersion);
    // print("${colorSpec.primary().getArgb(scheme).toRadixString(16)}");
    final colors = const MaterialDynamicColors();
    // colors.primaryFixed().getArgb(scheme);
    final results = colors.allDynamicColors
        .map(
          (dynamicColor) =>
              "\"${dynamicColor.name}\": Color(0x${dynamicColor.getArgb(scheme).toRadixString(16)})",
        )
        .join(",\n");

    print(results);

    // test('First Test', () {
    //   expect(awesome.isAwesome, isTrue);
    // });
  });
}
