import 'dart:typed_data';
import 'package:flutter_application_1/modal/app_modal.dart';
import 'package:flutter_application_1/modal/cart_modal.dart';

class AppState {
  List<AppModal> modal = [];
  Uint8List? bytes;
  List img = [];
  List? color = [];
  int? index;
  int qty;
  int? cIndex;
  List<CartModal> cartItems = [];

  AppState(
      {required this.modal,
      this.bytes,
      required this.img,
      this.color,
      required this.cartItems,
      this.index,
      this.cIndex,
      required this.qty});
}

// class DatabaseState
// {

// }
