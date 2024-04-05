import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/components/others/header_component.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/modules/create_new_order/views/components/create_new_order_steps_component.dart';

import '../controllers/create_new_order_controller.dart';

class CreateNewOrderView extends GetView<CreateNewOrderController> {
  const CreateNewOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(
        title: StringsAssetsConstants.createNewOrder,
      ),
      body: Column(
        children: [
          CreateNewOrderStepsComponent(
            step: 1,
          ),
        ],
      ),
    );
  }
}
