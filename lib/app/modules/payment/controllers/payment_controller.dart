import '../data/repository/payment_repository.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class PaymentController extends GetxController {
  final PaymentRepository paymentRepository = Get.find();
  // void downloadQr(BuildContext context) async {
  //   var time = DateTime.now().millisecondsSinceEpoch;
  //   var path = '/storage/emulated/0/Download/image-$time.jpg';
  //   var file = File(path);
  //   var res = await get(Uri.parse('https://shorturl.at/hyY69'));
  //   file.writeAsBytes(res.bodyBytes);

  //   Uint8List bytes = file.readAsBytesSync();

  //   try {
  //     await ImageGallerySaver.saveImage(bytes);
  //     print('Image saved to gallery.');
  //   } catch (e) {
  //     print('Failed to save image to gallery: $e');
  //   }
  // }
  void downloadQr() async {
    try {
      // final isGranted = await paymentRepository.requestPermission();
      // if (!isGranted) {
      //   throw 'Permission denied';
      // }
      var time = DateTime.now().millisecondsSinceEpoch;
      DownloadProgress downloadProgress;
      final DownloadFileModel downloadFile = DownloadFileModel(
        fullFileUrl: URL.defaultQRUrl,
        fileNameWithExt: 'qr-$time.jpg',
        downloadProgress: (downloadProgress) {
          downloadProgress = downloadProgress;
        },
      );
      paymentRepository.downloadFile(downloadFile);

      // showLoading();
      // await pa.removeFromSaveBook(collectionId);
      Get.showSnackbar(
        const GetSnackBar(
          message: "file downloaded",
          backgroundColor: colorPrimary,
          duration: Duration(seconds: 1),
          isDismissible: true,
        ),
      );
    } on String catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e,
          backgroundColor: colorRed,
          duration: const Duration(seconds: 1),
          isDismissible: true,
        ),
      );
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          message: "Failed to get saved books",
          backgroundColor: colorRed,
          duration: Duration(seconds: 1),
          isDismissible: true,
        ),
      );
    } finally {
      // dismissLoading();
    }
  }
}
