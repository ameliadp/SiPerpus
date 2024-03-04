import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/utils.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Payment',
            style: GoogleFonts.quicksand(
                color: colorPrimary,
                fontSize: 25.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 8.0),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: colorPrimary,
              size: 20.0,
            ),
          ),
        ),
        elevation: 3,
        shadowColor: colorgrey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  'assets/images/qr.png',
                  width: 250,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 40.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                          ),
                          onPressed: () {
                            controller.downloadQr();
                          },
                          child: Text(
                            'DOWNLOAD QR',
                            style: GoogleFonts.quicksand(
                                color: colorwhite, fontSize: 16.0),
                          ),
                        ),
                      ),
                      // 20.height,
                      // SizedBox(
                      //   width: double.infinity,
                      //   height: 40,
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: colorPrimary,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //       ),
                      //       padding: const EdgeInsets.symmetric(
                      //         horizontal: 4.0,
                      //       ),
                      //     ),
                      //     onPressed: () {
                      //       Get.back();
                      //     },
                      //     child: Text(
                      //       'DONE',
                      //       style: GoogleFonts.quicksand(
                      //           color: colorwhite, fontSize: 16.0),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
