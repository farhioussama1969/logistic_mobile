import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/animations/animator_component.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/inputs/text_input_component.dart';
import 'package:loogisti/app/core/components/layouts/scrollable_body_component.dart';
import 'package:loogisti/app/core/components/text/animated_type_text_component.dart';
import 'package:loogisti/app/core/constants/fonts_family_assets_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

import '../../../../core/components/inputs/icon_button_component.dart';

class OrderSummaryWindowComponent extends StatelessWidget {
  const OrderSummaryWindowComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          decoration: BoxDecoration(
            color: MainColors.backgroundColor(context),
            borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(30.r)),
          ),
          child: ScrollableBodyComponent(
            children: [
              Center(
                child: Text(
                  StringsAssetsConstants.orderSummary,
                  style: TextStyles.mediumLabelTextStyle(context),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: MainColors.backgroundColor(context),
                  border: Border.all(
                    color: MainColors.inputColor(context)!,
                    width: 1.r,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${StringsAssetsConstants.senderPhoneNumber}: ',
                          style: TextStyles.mediumBodyTextStyle(context).copyWith(
                            color: MainColors.textColor(context)!.withOpacity(0.6),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '0663095778',
                            style: TextStyles.mediumBodyTextStyle(context).copyWith(
                              color: MainColors.primaryColor,
                              fontFamily: FontsFamilyAssetsConstants.bold,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          '${StringsAssetsConstants.receiverPhoneNumber}: ',
                          style: TextStyles.mediumBodyTextStyle(context).copyWith(
                            color: MainColors.textColor(context)!.withOpacity(0.6),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '0663095778',
                            style: TextStyles.mediumBodyTextStyle(context).copyWith(
                              color: MainColors.primaryColor,
                              fontFamily: FontsFamilyAssetsConstants.bold,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Divider(color: MainColors.textColor(context)!.withOpacity(0.1)),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        AnimatorComponent(
                          time: const Duration(milliseconds: 300),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                IconsAssetsConstants.pointIcon,
                                width: 22.r,
                                color: MainColors.textColor(context),
                              ),
                              SizedBox(
                                height: 40.h,
                                child: VerticalDivider(
                                  color: MainColors.textColor(context),
                                  thickness: 1.r,
                                  indent: 0.r,
                                  endIndent: 0.r,
                                ),
                              ),
                              SvgPicture.asset(
                                IconsAssetsConstants.locationIcon,
                                width: 22.r,
                                color: MainColors.textColor(context),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                            child: Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: AnimatedTypeTextComponent(
                                        text: StringsAssetsConstants.pickUpLocation,
                                        textStyle: TextStyles.smallBodyTextStyle(context).copyWith(
                                          color: MainColors.textColor(context)!.withOpacity(0.6),
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'ain nadja 2, 2eme etage, appartement 4, 16000, Alger',
                                        style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                          fontFamily: FontsFamilyAssetsConstants.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: AnimatedTypeTextComponent(
                                          text: StringsAssetsConstants.deliveryLocation,
                                          textStyle: TextStyles.smallBodyTextStyle(context).copyWith(
                                            color: MainColors.textColor(context)!.withOpacity(0.6),
                                          ),
                                          textAlign: TextAlign.start),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'ain nadja 2, 2eme etage, appartement 4, 16000, Alger',
                                        style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                          fontFamily: FontsFamilyAssetsConstants.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Divider(color: MainColors.textColor(context)!.withOpacity(0.1)),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          '${StringsAssetsConstants.preferredPickupTime}: ',
                          style: TextStyles.mediumBodyTextStyle(context).copyWith(
                            color: MainColors.textColor(context)!.withOpacity(0.6),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '19:30',
                            style: TextStyles.mediumBodyTextStyle(context).copyWith(
                              color: MainColors.primaryColor,
                              fontFamily: FontsFamilyAssetsConstants.bold,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Divider(color: MainColors.textColor(context)!.withOpacity(0.1)),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          '${StringsAssetsConstants.itemPrice}: ',
                          style: TextStyles.largeBodyTextStyle(context),
                        ),
                        Expanded(
                          child: Text(
                            '3000 ${StringsAssetsConstants.currency}',
                            style: TextStyles.largeBodyTextStyle(context).copyWith(
                              color: MainColors.primaryColor,
                              fontFamily: FontsFamilyAssetsConstants.bold,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          '${StringsAssetsConstants.deliveryPrice}: ',
                          style: TextStyles.largeBodyTextStyle(context),
                        ),
                        Expanded(
                          child: Text(
                            '600 ${StringsAssetsConstants.currency}',
                            style: TextStyles.largeBodyTextStyle(context).copyWith(
                              color: MainColors.primaryColor,
                              fontFamily: FontsFamilyAssetsConstants.bold,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          '${StringsAssetsConstants.totalPrice}: ',
                          style: TextStyles.mediumLabelTextStyle(context),
                        ),
                        Expanded(
                          child: Text(
                            '3600 ${StringsAssetsConstants.currency}',
                            style: TextStyles.mediumLabelTextStyle(context).copyWith(
                              color: MainColors.primaryColor,
                              fontFamily: FontsFamilyAssetsConstants.bold,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        StringsAssetsConstants.enterCouponCode,
                        style: TextStyles.largeBodyTextStyle(context),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Divider(
                            color: MainColors.textColor(context)!.withOpacity(0.1),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '35%',
                            style: TextStyles.largeBodyTextStyle(context).copyWith(
                              color: MainColors.primaryColor,
                              fontFamily: FontsFamilyAssetsConstants.bold,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          IconButtonComponent(
                            onTap: () {},
                            iconLink: IconsAssetsConstants.discountIcon,
                            buttonWidth: 30.r,
                            buttonHeight: 30.r,
                            iconWidth: 18.r,
                            iconHeight: 18.r,
                            border: Border.all(
                              color: MainColors.textColor(context)!.withOpacity(0.1),
                              width: 1.r,
                            ),
                            backgroundColor: MainColors.inputColor(context),
                            iconColor: MainColors.primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  TextInputComponent(
                    label: StringsAssetsConstants.couponCode,
                    hint: '${StringsAssetsConstants.enter} ${StringsAssetsConstants.couponCode}...',
                  ),
                ],
              ),
              const Expanded(child: SizedBox.shrink()),
              SizedBox(height: 15.h),
              PrimaryButtonComponent(
                onTap: () {},
                text: StringsAssetsConstants.confirm,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButtonComponent(
                onTap: () => Get.back(),
                iconLink: IconsAssetsConstants.closeIcon,
                buttonWidth: 23.r,
                buttonHeight: 23.r,
                iconWidth: 15.r,
                iconHeight: 15.r,
                backgroundColor: MainColors.disableColor(context)?.withOpacity(0.5),
                iconColor: MainColors.whiteColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
