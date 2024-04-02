import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class OrderStatusCardComponent extends StatelessWidget {
  const OrderStatusCardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80.r,
          width: 80.r,
          decoration: BoxDecoration(
            color: MainColors.inputColor(context),
            borderRadius: BorderRadius.circular(1000.r),
            border: Border.all(
              color: MainColors.textColor(context)!.withOpacity(0.1),
              width: 2.r,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              IconsAssetsConstants.orderPendingIcon,
              width: 40.r,
              color: MainColors.textColor(context),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      StringsAssetsConstants.pendingOrderTitle,
                      style: TextStyles.mediumLabelTextStyle(context).copyWith(
                        color: MainColors.warningColor(context),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      StringsAssetsConstants.pendingOrderDescription,
                      style: TextStyles.mediumBodyTextStyle(context).copyWith(
                        color: MainColors.textColor(context)!.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
