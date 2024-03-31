import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/modules/home/views/components/create_order_card_component.dart';
import 'package:loogisti/app/modules/home/views/components/home_top_bar_component.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            HomeTopBarComponent()
                .animate(delay: 100.ms)
                .fadeIn(duration: 900.ms, delay: 300.ms)
                .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                .move(begin: const Offset(0, -16), curve: Curves.easeOutQuad),
            CreateOrderCardComponent()
                .animate(delay: 200.ms)
                .fadeIn(duration: 900.ms, delay: 300.ms)
                .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
          ],
        ),
      ),
    );
  }
}
