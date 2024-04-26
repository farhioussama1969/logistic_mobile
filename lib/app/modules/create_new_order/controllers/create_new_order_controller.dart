import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';

class CreateNewOrderController extends GetxController {
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

  //step 02

  File? selectedInvoiceFile;
  void onFileSelected(File? file) {
    selectedInvoiceFile = file;
    update([GetBuildersIdsConstants.createOrderStep2]);
  }

  //step 03
  bool isChosenTime = false;
  void changeChosenTime(bool value) {
    isChosenTime = value;
    update([GetBuildersIdsConstants.createOrderStep3]);
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
