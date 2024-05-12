import 'dart:io';

import 'package:loogisti/app/core/constants/end_points_constants.dart';
import 'package:loogisti/app/core/services/http_client_service.dart';
import 'package:loogisti/app/data/models/api_response.dart';
import 'package:loogisti/app/data/models/home_orders_model.dart';
import 'package:loogisti/app/data/models/order_model.dart';
import 'package:dio/dio.dart' as dio;

class OrderProvider {
  Future<OrderModel?> createNewOrder({
    required String pickupName,
    required double pickupLocationLong,
    required double pickupLocationLate,
    required String deliveryName,
    required double deliveryLocationLong,
    required double deliveryLocationLate,
    required double distance,
    required double deliveryCost,
    required String senderPhone,
    required String reciverPhone,
    required double price,
    required String bestTimeDelevery,
    required String coupon,
    required File? image,
    required Function onLoading,
    required Function onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.createOrder,
      requestType: HttpRequestTypes.post,
      data: dio.FormData.fromMap({
        "pickup_name": pickupName,
        "pickup_location_long": pickupLocationLong,
        "pickup_location_late": pickupLocationLate,
        "delivery_name": deliveryName,
        "delivery_location_long": deliveryLocationLong,
        "delivery_location_late": deliveryLocationLate,
        "distance": distance,
        "delevery_cost": deliveryCost,
        "sender_phone": senderPhone,
        "reciver_phone": reciverPhone,
        "price": price,
        "best_time_delevery": bestTimeDelevery,
        "coupon": coupon,
        "image": image == null ? null : await dio.MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
      }),
      onLoading: () => onLoading(),
      onFinal: () => onFinal(),
    );
    if (response?.body != null) {
      return OrderModel.fromJson(response?.body['order']);
    }
    return null;
  }

  Future<double?> getDeliveryPricing({
    required double pickupLocationLong,
    required double pickupLocationLate,
    required double deliveryLocationLong,
    required double deliveryLocationLate,
    required Function onLoading,
    required Function onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.getDeliveryPricing,
      requestType: HttpRequestTypes.post,
      data: {
        "pickup_location_long": pickupLocationLong,
        "pickup_location_late": pickupLocationLate,
        "delivery_location_long": deliveryLocationLong,
        "delivery_location_late": deliveryLocationLate,
      },
      onLoading: () => onLoading(),
      onFinal: () => onFinal(),
    );
    if (response?.body != null) {
      if (response?.body['totalPrice'] != null) {
        return double.parse(response!.body['totalPrice'].toString());
      }
    }
    return null;
  }

  Future<HomeOrdersModel?> getHomeOrders({
    required Function onLoading,
    required Function onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.getOrders,
      requestType: HttpRequestTypes.get,
      onLoading: () => onLoading(),
      onFinal: () => onFinal(),
    );
    if (response?.body != null) {
      return HomeOrdersModel.fromJson(response?.body);
    }
    return null;
  }

  Future<double?> couponValidate({
    required String couponCode,
    required Function onLoading,
    required Function onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.couponValidate,
      requestType: HttpRequestTypes.post,
      data: {'code': couponCode},
      onLoading: () => onLoading(),
      onFinal: () => onFinal(),
    );
    if (response?.body != null) {
      return double.parse(response!.body['discount_percentage'].toString());
    }
    return null;
  }
}
