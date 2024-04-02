import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

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
            color: MainColors.warningColor(context),
            borderRadius: BorderRadius.circular(1000.r),
          ),
        ),
      ],
    );
  }
}
