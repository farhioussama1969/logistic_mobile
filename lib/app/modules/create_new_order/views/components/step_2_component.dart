import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/inputs/text_input_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/modules/create_new_order/controllers/create_new_order_controller.dart';
import 'package:loogisti/app/modules/create_new_order/views/components/invoice_uploading_component.dart';

class Step2Component extends StatelessWidget {
  const Step2Component({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateNewOrderController>(
        id: GetBuildersIdsConstants.createOrderStep2,
        builder: (logic) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: MainColors.backgroundColor(context),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: MainColors.shadowColor(context)!.withOpacity(0.5),
                  blurRadius: 30.r,
                  offset: Offset(0, 40.h),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: MainColors.primaryColor!.withOpacity(0.1),
                    border: Border.all(
                      color: MainColors.primaryColor,
                      width: 1.r,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          StringsAssetsConstants.step2Description,
                          style: TextStyles.largeBodyTextStyle(context).copyWith(
                            color: MainColors.primaryColor,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SvgPicture.asset(
                        IconsAssetsConstants.aboutUsIcon,
                        width: 22.r,
                        color: MainColors.primaryColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        StringsAssetsConstants.step2EnterItemPrice,
                        style: TextStyles.largeBodyTextStyle(context),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                TextInputComponent(
                  label: StringsAssetsConstants.itemPrice,
                  isLabelOutside: true,
                  borderColor: MainColors.textColor(context),
                  hint: '${StringsAssetsConstants.enter} ${StringsAssetsConstants.itemPrice}...',
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: MainColors.textColor(context)!.withOpacity(0.1),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        StringsAssetsConstants.uploadTheItemInvoice,
                        style: TextStyles.largeBodyTextStyle(context),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                InvoiceUploadingComponent(
                  selectedInvoiceFile: logic.selectedInvoiceFile,
                  onFileSelected: logic.onFileSelected,
                  onFileRemoved: () => logic.onFileSelected(null),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          );
        });
  }
}
