import 'package:get/get.dart';
import 'package:loogisti/app/modules/create_new_order/bindings/create_new_order_binding.dart';
import 'package:loogisti/app/modules/create_new_order/views/create_new_order_view.dart';
import 'package:loogisti/app/modules/home/bindings/home_binding.dart';
import 'package:loogisti/app/modules/home/views/home_view.dart';
import 'package:loogisti/app/modules/order_details/bindings/order_details_binding.dart';
import 'package:loogisti/app/modules/order_details/views/order_details_view.dart';
import 'package:loogisti/app/modules/pick_location/bindings/pick_location_binding.dart';
import 'package:loogisti/app/modules/pick_location/views/pick_location_view.dart';
import 'package:loogisti/app/modules/sign_in/bindings/sign_in_binding.dart';
import 'package:loogisti/app/modules/sign_in/views/sign_in_view.dart';

import '../modules/banned/bindings/banned_binding.dart';
import '../modules/banned/views/banned_view.dart';

import '../modules/new_update/bindings/new_update_binding.dart';
import '../modules/new_update/views/new_update_view.dart';

import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.NEW_UPDATE,
      page: () => const NewUpdateView(),
      binding: NewUpdateBinding(),
    ),
    GetPage(
      name: _Paths.BANNED,
      page: () => const BannedView(),
      binding: BannedBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_NEW_ORDER,
      page: () => const CreateNewOrderView(),
      binding: CreateNewOrderBinding(),
    ),
    GetPage(
      name: _Paths.PICK_LOCATION,
      page: () => const PickLocationView(),
      binding: PickLocationBinding(),
    ),
  ];
}
