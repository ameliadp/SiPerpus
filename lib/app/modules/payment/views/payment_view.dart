import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('PaymentView'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Scan the QR below to make your transaction, ',
                    style: GoogleFonts.quicksand(
                      color: colorblack,
                      fontSize: 20.0,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Only Dana Available',
                        style: GoogleFonts.quicksand(
                          color: colorBlue,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/qr_code.png',
                  width: 250,
                  fit: BoxFit.contain,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      fixedSize: const Size(110, 2)),
                  onPressed: () {
                    controller.downloadQr(context);
                  },
                  child: Text(
                    'DOWNLOAD QR',
                    style: GoogleFonts.quicksand(
                        color: colorwhite, fontSize: 14.0),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      fixedSize: const Size(110, 2)),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'DONE',
                    style: GoogleFonts.quicksand(
                        color: colorwhite, fontSize: 14.0),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
