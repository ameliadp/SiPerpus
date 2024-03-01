import '../data/repository/payment_repository.dart';
import 'package:get/get.dart';

import '../controllers/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(
      () => PaymentController(),
    );
    Get.lazyPut<PaymentRepository>(
      () => PaymentRepository(),
    );
  }
}
