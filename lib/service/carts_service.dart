import 'package:dio/dio.dart';
import 'package:flutter_group_1/models/carts_model.dart';
import 'package:flutter_group_1/network_settings.dart';

class CartService {
  static final dio = Dio();

  static Future<List<Cart>> getCartData() async {
    final response = await dio.get("${NetworkSettings.url}carts");
    var cartData = response.data;
    CartModel cartModel = CartModel.fromJson(cartData);

    return cartModel.carts ?? [];
  }
}
