import 'package:flutter/material.dart';
import 'package:flutter_group_1/models/carts_model.dart';
import 'package:flutter_group_1/service/carts_service.dart';
import 'package:flutter_group_1/views/widgets/item_card_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isLoading = true;
  List<Cart> cartList = [];

  Future<void> getData() async {
    cartList = await CartService.getCartData();
    isLoading = false;
    setState(() {});
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCard(
                  id: cartList[index].id ?? 0,
                  price: "${cartList[index].total}",
                  totalQuantity: cartList[index].totalQuantity ?? 0,
                );
              },
            ),
    );
  }
}
