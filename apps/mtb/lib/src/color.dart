import 'package:json_annotation/json_annotation.dart';
import 'package:mcu/mcu.dart' as mcu;

sealed class Color {
  const factory Color.argb(int argb) = _ColorArgb;
  const factory Color.rgba(int r, int g, int b, [int a]) = _ColorRgba;
  const factory Color.hex(String hex) = _ColorHex;
  const factory Color.hct(mcu.Hct hct) = _ColorHct;

  int get argb;
  String get hex;
  mcu.Hct get hct;

  static (double, bool)? _parsePercentOrFloat(String source) {
    if (source.endsWith("%")) {
      source = source.substring(0, source.length - 1);
      final t = double.tryParse(source);
      if (t != null) {
        return (t / 100.0, true);
      }
    } else {
      final t = double.tryParse(source);
      if (t != null) {
        return (t, false);
      }
    }
    return null;
  }

  static (double, bool)? _parsePercentOr255(String source) {
    if (source.endsWith("%")) {
      source = source.substring(0, source.length - 1);
      final t = double.tryParse(source);
      if (t != null) {
        return (t / 100.0, true);
      }
    } else {
      final t = double.tryParse(source);
      if (t != null) {
        return (t / 255.0, false);
      }
    }
    return null;
  }

  static int? _parseSingleDigit(String digit) {
    final result = int.tryParse(digit, radix: 16);
    if (result == null) return null;
    return (result << 4) | result;
  }

  static Color? _parseHex(String source) {
    final n = source.length;

    if (n == 3 || n == 4) {
      final r = _parseSingleDigit(source[0]);
      final g = _parseSingleDigit(source[1]);
      final b = _parseSingleDigit(source[2]);
      if (r == null || g == null || b == null) return null;
      final a = source.length == 4 ? _parseSingleDigit(source[3]) : null;
      return Color.rgba(r, g, b, a ?? 255);
    } else if (n == 6 || n == 8) {
      final r = int.tryParse(source.substring(0, 2), radix: 16);
      final g = int.tryParse(source.substring(2, 4), radix: 16);
      final b = int.tryParse(source.substring(4, 6), radix: 16);
      if (r == null || g == null || b == null) return null;
      final a = source.length == 8
          ? int.tryParse(source.substring(6, 8), radix: 16)
          : null;
      return Color.rgba(r, g, b, a ?? 255);
    }
    return null;
  }

  static Color? tryParse(String source) {
    // source = source.trim().replaceAll(r"\s", "");
    source = source.trim().toLowerCase();

    if (source == "transparent") {
      return Color.argb(0x00000000);
    }

    // Hex format
    if (source.startsWith("#")) {
      final hex = source.substring(1);
      return _parseHex(hex);
    }

    // TODO: add rgb / rgba formats here
    final i = source.indexOf("(");
    if (i != -1 && source.endsWith(")")) {
      final fname = source.substring(0, i).trimRight();
      source = source
          .substring(i + 1)
          .replaceAll(",", " ")
          .replaceAll("/", " ");
      final params = source.split(RegExp(r"\s+"));
      final pLen = params.length;

      switch (fname) {
        case "rgb" || "rgba":
          if (pLen != 3 && pLen != 4) {
            return null;
          }
          final r = _parsePercentOr255(params[0]);
          final g = _parsePercentOr255(params[1]);
          final b = _parsePercentOr255(params[2]);
          final a = pLen == 4 ? _parsePercentOrFloat(params[3]) : (1.0, true);
          if ((r, g, b, a) case (
            (final r, final rFormat)?,
            (final g, final gFormat)?,
            (final b, final bFormat)?,
            (final a, _)?,
          )) {
            if (rFormat == gFormat && gFormat == bFormat) {
              // return Color.rgba(r, g, b);
            }
          }
          break;
        default:
          return null;
      }
    }

    // Hex format without prefix "#"
    return _parseHex(source);
  }

  static Color parse(String source) {
    final value = tryParse(source);
    assert(value != null);
    return value!;
  }
}

class _ColorArgb implements Color {
  const _ColorArgb(this.argb);

  @override
  final int argb;

  @override
  String get hex => mcu.hexFromArgb(argb, leadingHashSign: false);

  @override
  mcu.Hct get hct => mcu.Hct.fromInt(argb);

  @override
  String toString() => "Color.argb(0x${argb.toRadixString(16)})";

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is _ColorArgb &&
            argb == other.argb;
  }

  @override
  int get hashCode => Object.hash(runtimeType, argb);
}

class _ColorRgba implements Color {
  const _ColorRgba(this.red, this.green, this.blue, [this.alpha = 255]);

  final int red;
  final int green;
  final int blue;
  final int alpha;

  @override
  int get argb =>
      (alpha << 24) | ((red & 255) << 16) | ((green & 255) << 8) | (blue & 255);

  @override
  String get hex => mcu.hexFromArgb(argb, leadingHashSign: false);

  @override
  mcu.Hct get hct => mcu.Hct.fromInt(argb);

  @override
  String toString() => "Color.rgba($red, $green, $blue, $alpha)";

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is _ColorRgba &&
            red == other.red &&
            green == other.green &&
            blue == other.blue &&
            alpha == other.alpha;
  }

  @override
  int get hashCode => Object.hash(runtimeType, red, green, blue, alpha);
}

class _ColorHex implements Color {
  const _ColorHex(this.hex);

  @override
  int get argb {
    final argb = mcu.argbFromHex(hex);
    assert(argb != null);
    return argb!;
  }

  @override
  final String hex;

  @override
  mcu.Hct get hct => mcu.Hct.fromInt(argb);

  @override
  String toString() => "Color.hex(#$hex)";

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is _ColorHex &&
            hex == other.hex;
  }

  @override
  int get hashCode => Object.hash(runtimeType, hex);
}

class _ColorHct implements Color {
  const _ColorHct(this.hct);

  @override
  int get argb => hct.toInt();

  @override
  String get hex => mcu.hexFromArgb(argb, leadingHashSign: false);

  @override
  final mcu.Hct hct;

  @override
  String toString() =>
      "Color.hct(${hct.hue.round()}, ${hct.chroma.round()}, ${hct.tone.round()})";

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is _ColorHct &&
            hct == other.hct;
  }

  @override
  int get hashCode => Object.hash(runtimeType, hct);
}

class ColorConverter implements JsonConverter<Color, String> {
  const ColorConverter();

  @override
  Color fromJson(String json) {
    return Color.parse(json);
  }

  @override
  String toJson(Color object) {
    return "#${object.hex}";
  }
}
