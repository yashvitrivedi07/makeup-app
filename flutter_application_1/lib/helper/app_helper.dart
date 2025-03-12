import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_application_1/modal/app_modal.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

class AppHelper {
  AppHelper._();
  static AppHelper ah = AppHelper._();

  Future<List<AppModal>?> apiCalling() async {
    String api =
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      List m = jsonDecode(res.body);
      List<AppModal> modal = m.map((e) => AppModal.toMap(e)).toList();
      return modal;
    }

    return null;
  }

  Future<Uint8List?> removeBg(String imageUrl) async {
    http.Response response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      Uint8List imageBytes = response.bodyBytes;
      img.Image? image = img.decodeImage(imageBytes);

      if (image == null) return null;

      img.Image newImage =
          img.Image(width: image.width, height: image.height, numChannels: 4);

      for (int y = 0; y < image.height; y++) {
        for (int x = 0; x < image.width; x++) {
          img.Pixel pixel = image.getPixelSafe(x, y);
          int r = pixel.r.toInt();
          int g = pixel.g.toInt();
          int b = pixel.b.toInt();

          if (r > 200 && g > 200 && b > 200) {
            newImage.setPixel(x, y, img.ColorInt32.rgba(0, 0, 0, 0));
          } else {
            newImage.setPixel(x, y, pixel);
          }
        }
      }

      return Uint8List.fromList(img.encodePng(newImage));
    }
    return null;
  }

  // Future<Uint8List?> bgRemove(String imageUrl) async {
  //   String key = "9Y6XXDvqwSh4wwFSQezWs18v";
  //   Uri api = Uri.parse('https://api.remove.bg/v1.0/removebg');

  //   try {
  //     final response = await http.post(
  //       api,
  //       headers: {
  //         "X-Api-Key": key,
  //       },
  //       body: {
  //         "image_url": imageUrl,
  //         "size": "auto",
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       print("✅ Background removed for: $imageUrl");
  //       return response.bodyBytes;
  //     } else {
  //       print("❌ API Error (${response.statusCode}): ${response.body}");
  //     }
  //   } catch (e) {
  //     print("❌ Exception: $e");
  //   }

  //   return null;
  // }
}

/**
 * product_type       string
 * product_category
 * product_tags
 * brand
 * price_greater_than
 * price_less_than
 * rating_greater_than
  rating_less_than

 */
