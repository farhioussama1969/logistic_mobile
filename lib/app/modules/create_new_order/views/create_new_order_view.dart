import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/layouts/scrollable_body_component.dart';
import 'package:loogisti/app/core/components/others/header_component.dart';
import 'package:loogisti/app/core/components/pop_ups/bottom_sheet_component.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/modules/create_new_order/views/components/create_new_order_steps_component.dart';
import 'package:loogisti/app/modules/create_new_order/views/components/order_summary_window_component.dart';
import 'package:loogisti/app/modules/create_new_order/views/components/step_1_component.dart';
import 'package:loogisti/app/modules/create_new_order/views/components/step_2_component.dart';
import 'package:loogisti/app/modules/create_new_order/views/components/step_3_component.dart';

import '../controllers/create_new_order_controller.dart';

class CreateNewOrderView extends GetView<CreateNewOrderController> {
  const CreateNewOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(
        title: StringsAssetsConstants.createNewOrder,
      ),
      body: ScrollableBodyComponent(
        children: [
          CreateNewOrderStepsComponent(
            step: 1,
          ),
          AnimatedSize(
            alignment: Alignment.topCenter,
            duration: Duration(milliseconds: 300),
            child: Step3Component(),
          ),
          const Expanded(child: SizedBox.shrink()),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 40.h,
            ),
            child: PrimaryButtonComponent(
              text: StringsAssetsConstants.next,
              onTap: () => showOrderSummaryWindow(),
            ),
          ),
        ],
      ),
    );
  }

  void showOrderSummaryWindow() {
    BottomSheetComponent.show(
      Get.context!,
      body: OrderSummaryWindowComponent(),
    );
  }
}
