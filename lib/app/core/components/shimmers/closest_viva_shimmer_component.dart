import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/others/shimmer_component.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class ClosestVivaShimmerComponent extends StatelessWidget {
  const ClosestVivaShimmerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: ShimmerComponent(
          child: Container(
            color: MainColors.backgroundColor(context),
          ),
        ),
      ),
    );
  }
}
