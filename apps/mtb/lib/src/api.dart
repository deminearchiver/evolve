import 'package:mcu/mcu.dart';
import 'cli.dart' show DynamicSchemes;

// Map<String, Object?> generateJson({}) {

// }

abstract class Format {
  String serialize();
}

class FormatJsonLegacy {}
