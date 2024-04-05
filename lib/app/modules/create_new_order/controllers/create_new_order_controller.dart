import 'dart:io';

import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';

class CreateNewOrderController extends GetxController {
  int step = 1;
  void setStep(int value) {
    step = value;
    update([GetBuildersIdsConstants.createOrderSteps]);
  }

  //step 02

  File? selectedInvoiceFile;
  void onFileSelected(File? file) {
    selectedInvoiceFile = file;
    update([GetBuildersIdsConstants.createOrderStep2]);
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
