import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/cards/order_card_component.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class OrdersSectionComponent extends StatelessWidget {
  const OrdersSectionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Text(
                  StringsAssetsConstants.orders,
                  style: TextStyles.mediumLabelTextStyle(context),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return OrderCardComponent();
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 15.h);
            },
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
