import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/cards/tag_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/logos_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class CreateOrderCardComponent extends StatelessWidget {
  const CreateOrderCardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        gradient: MainColors.primaryGradientColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              LogosAssetsConstants.vectorLogo,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        IconsAssetsConstants.orderIcon,
                        color: MainColors.whiteColor,
                        width: 24.r,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        '17 ${StringsAssetsConstants.orders}',
                        style: TextStyles.mediumLabelTextStyle(context).copyWith(
                          color: MainColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: TagComponent(
                    title: '',
                    disableShadow: true,
                    backgroundColor: MainColors.backgroundColor(context),
                    borderRadius: BorderRadius.circular(10.r),
                    titleWidget: Row(
                      children: [
                        SvgPicture.asset(
                          IconsAssetsConstants.addIcon,
                          color: MainColors.textColor(context),
                          width: 20.r,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          StringsAssetsConstants.createNewOrder,
                          style: TextStyles.smallBodyTextStyle(context),
                        ),
                      ],
                    ),
                    textColor: MainColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
