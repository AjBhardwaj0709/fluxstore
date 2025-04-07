import 'dart:ui';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    final cleanedHex = hexColor.toUpperCase().replaceAll("#", "");
    final formattedHex = cleanedHex.length == 6 ? "FF$cleanedHex" : cleanedHex;
    return int.parse(formattedHex, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
