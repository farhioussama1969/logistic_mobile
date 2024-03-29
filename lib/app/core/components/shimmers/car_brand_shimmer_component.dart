import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/others/shimmer_component.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class CarBrandShimmerComponent extends StatelessWidget {
  const CarBrandShimmerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: MainColors.backgroundColor(context),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: MainColors.shadowColor(context)!,
            blurRadius: 5.r,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            height: 40.r,
            width: 40.r,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000.r),
              child: ShimmerComponent(
                child: Container(
                  color: MainColors.backgroundColor(context),
                ),
              ),
            ),
          ),
          SizedBox(width: 15.w),
          SizedBox(
            height: 20.r,
            width: 100.r,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: ShimmerComponent(
                child: Container(
                  color: MainColors.backgroundColor(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
