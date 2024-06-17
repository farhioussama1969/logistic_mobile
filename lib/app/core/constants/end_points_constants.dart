class EndPointsConstants {
  static const String baseUrl = 'https://loogisti.com/api/v1/';

  //config provider
  static const String termsAndConditions = 'terms-of-use';

  //auth provider
  static const String socialSignIn = 'user/login';
  static const String getUserData = 'user/info';
  static const String updateUserData = 'user/update';
  static const String logout = 'user/logout';

  //order provider
  static const String createOrder = 'order/create';
  static const String getOrders = 'user/order/all';
  static const String getDeliveryPricing = 'order/price';
  static const String couponValidate = 'coupon/validate';
  static String changeOrderStatus(int? orderId, int? statusId) => 'order/$orderId/action/$statusId';

  //notification provider
  static const String getNotifications = 'notification/all';
}
