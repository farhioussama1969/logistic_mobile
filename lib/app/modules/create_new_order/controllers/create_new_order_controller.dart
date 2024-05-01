import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/pop_ups/toast_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/modules/create_new_order/views/create_new_order_view.dart';

class CreateNewOrderController extends GetxController {
  final GlobalKey<FormState> step1FormKey = GlobalKey<FormState>();

  final TextEditingController pickUpLocationController = TextEditingController();
  final TextEditingController dropOffLocationController = TextEditingController();

  double? pickUpLatitude;
  double? pickUpLongitude;

  double? dropOffLatitude;
  double? dropOffLongitude;

  int step = 1;
  void setStep(int value) {
    step = value;
    update([GetBuildersIdsConstants.createOrderSteps]);
  }

  final TextEditingController senderPhoneNumberController = TextEditingController();
  final TextEditingController receiverPhoneNumberController = TextEditingController();

  //step 02

  final GlobalKey<FormState> step2FormKey = GlobalKey<FormState>();

  final TextEditingController itemPriceController = TextEditingController();

  File? selectedInvoiceFile;
  void onFileSelected(File? file) {
    selectedInvoiceFile = file;
    update([GetBuildersIdsConstants.createOrderStep2]);
  }

  //step 03

  final GlobalKey<FormState> step3FormKey = GlobalKey<FormState>();

  final TextEditingController pickupTimeController = TextEditingController();

  bool isChosenTime = false;
  void changeChosenTime(bool value) {
    isChosenTime = value;
    update([GetBuildersIdsConstants.createOrderStep3]);
  }

  DateTime? pickupTime;
  void onPickupTimeSelected(DateTime time) {
    pickupTimeController.text = time.toString().substring(10, 16);
    pickupTime = time;
    update([GetBuildersIdsConstants.createOrderStep3]);
  }

  void nextStep() {
    if (step == 1) {
      if (step1FormKey.currentState!.validate()) {
        setStep(2);
      }
    } else if (step == 2) {
      if (step2FormKey.currentState!.validate()) {
        if (selectedInvoiceFile != null) {
          setStep(3);
        } else {
          ToastComponent.showErrorToast(Get.context!, text: '${StringsAssetsConstants.check} ${StringsAssetsConstants.itemInvoice}');
        }
      }
    } else if (step == 3) {
      if (isChosenTime) {
        if (step3FormKey.currentState!.validate()) {
          const CreateNewOrderView().showOrderSummaryWindow();
        }
      } else {
        const CreateNewOrderView().showOrderSummaryWindow();
      }
    }
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
