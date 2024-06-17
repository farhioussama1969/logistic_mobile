import 'package:get/get.dart';
import 'package:loogisti/app/core/components/pop_ups/toast_component.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/data/models/order_model.dart';
import 'package:loogisti/app/data/providers/loogistic_api/order_provider.dart';
import 'package:loogisti/app/modules/home/controllers/home_controller.dart';

class OrderDetailsController extends GetxController {
  OrderModel? orderData;

  Future<void> changeOrderStatus(int componentIndex) async {
    if (orderData?.orderComponent?.buttons?[componentIndex].isLoading == true) return;
    await OrderProvider()
        .orderAction(
            orderId: orderData?.id,
            statusId: orderData?.orderComponent?.buttons?[componentIndex].statusId,
            onLoading: () {
              orderData?.orderComponent?.buttons?[componentIndex].isLoading = true;
              update();
            },
            onFinal: () {
              orderData?.orderComponent?.buttons?[componentIndex].isLoading = false;
              update();
            })
        .then((value) {
      if (value != null) {
        Get.find<HomeController>().refreshHome();
        Get.back();
        ToastComponent.showSuccessToast(Get.context!, text: StringsAssetsConstants.orderStatusHasBeenUpdatedSuccessfully);
      }
    });
  }

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
