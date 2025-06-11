import 'color_utils.dart' as color_utils;

String hexFromArgb(int argb, {bool leadingHashSign = true}) {
  final red = color_utils.redFromArgb(argb);
  final green = color_utils.greenFromArgb(argb);
  final blue = color_utils.blueFromArgb(argb);
  return "${leadingHashSign ? "#" : ""}"
      "${red.toRadixString(16).padLeft(2, "0").toUpperCase()}"
      "${green.toRadixString(16).padLeft(2, "0").toUpperCase()}"
      "${blue.toRadixString(16).padLeft(2, "0").toUpperCase()}";
}

int? argbFromHex(String hex) {
  return int.tryParse(hex.replaceAll("#", ""), radix: 16);
}
