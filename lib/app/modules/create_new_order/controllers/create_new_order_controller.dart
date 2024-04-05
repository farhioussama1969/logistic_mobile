import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';

class CreateNewOrderController extends GetxController {
  int step = 1;
  void setStep(int value) {
    step = value;
    update([GetBuildersIdsConstants.createOrderSteps]);
  }

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
}
