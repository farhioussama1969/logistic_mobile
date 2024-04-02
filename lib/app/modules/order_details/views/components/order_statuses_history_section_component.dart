import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/cards/order_status_card_component.dart';

class OrderStatusesHistorySectionComponent extends StatelessWidget {
  const OrderStatusesHistorySectionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return OrderStatusCardComponent();
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 20.h);
      },
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
