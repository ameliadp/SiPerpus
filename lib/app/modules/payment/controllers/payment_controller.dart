import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class PaymentController extends GetxController {
  void downloadQr(BuildContext context) async {
    var time = DateTime.now().millisecondsSinceEpoch;
    var path = '/storage/emulated/0/Download/image-$time.jpg';
    var file = File(path);
    var res = await get(Uri.parse('https://shorturl.at/hyY69'));
    file.writeAsBytes(res.bodyBytes);

    Uint8List bytes = file.readAsBytesSync();

    try {
      await ImageGallerySaver.saveImage(bytes);
      print('Image saved to gallery.');
    } catch (e) {
      print('Failed to save image to gallery: $e');
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
