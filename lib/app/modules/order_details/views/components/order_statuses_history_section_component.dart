import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/cards/order_status_card_component.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class OrderStatusesHistorySectionComponent extends StatelessWidget {
  const OrderStatusesHistorySectionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return OrderStatusCardComponent();
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 30.h,
          child: Row(
            children: [
              SizedBox(width: 30.w),
              VerticalDivider(
                color: MainColors.textColor(context)!.withOpacity(0.1),
                thickness: 2.r,
              ),
            ],
          ),
        );
      },
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
