import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/cards/order_card_component.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
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
          )
              .animate(delay: (50).ms)
              .fadeIn(duration: 900.ms, delay: 300.ms)
              .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
              .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return OrderCardComponent()
                  .animate(delay: (index * 100).ms)
                  .fadeIn(duration: 900.ms, delay: 300.ms)
                  .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                  .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 22.h);
            },
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
