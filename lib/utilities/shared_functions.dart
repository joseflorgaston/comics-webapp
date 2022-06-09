import 'dart:ui' as ui;

import 'package:universal_html/html.dart';

class SharedFunctions {
  static String doNothing() {
    return "";
  }

  static getImage(String? originalUrl, int height, int width) {
    String imageUrl = originalUrl ??
        "https://img.freepik.com/vector-gratis/plantilla-portada-comic-brillante_225004-808.jpg?w=2000";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
          (int _) => ImageElement(height: height, width: width)
        ..style.width = '100%'
        ..style.height = '100%'
        ..src = imageUrl,
    );

    return imageUrl;
  }
}
