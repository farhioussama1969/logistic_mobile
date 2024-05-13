import 'package:get/get.dart';
import 'package:loogisti/app/data/models/order_model.dart';

class OrderDetailsController extends GetxController {
  OrderModel? orderData;

  @override
  void onInit() {
    if (Get.arguments != null) {
      orderData = Get.arguments['order'];
    }
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
}
