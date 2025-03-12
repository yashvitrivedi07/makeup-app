import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/app_state.dart';
import 'package:flutter_application_1/colors/app_colors.dart';
import 'package:flutter_application_1/helper/app_helper.dart';
import 'package:flutter_application_1/helper/database_helper.dart';
import 'package:flutter_application_1/modal/app_modal.dart';
import 'package:flutter_application_1/modal/cart_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc()
      : super(AppState(
            qty: 1,
            modal: [],
            img: [],
            cartItems: [],
            color: [AppColors.c1, AppColors.c4, AppColors.c5, AppColors.c7]));

  Future<void> getData() async {
    List<Uint8List?> mem = [];
    List<AppModal> m = await AppHelper.ah.apiCalling() ?? [];

    for (int i = 0; i < m.length; i++) {
      var img = m[i].image_link;
      if (img != null) {
        var imageBytes = await AppHelper.ah.removeBg(img);
        mem.add(imageBytes);
      }
    }

    emit(AppState(
      cartItems: [],
      qty: 1,
      modal: m,
      img: mem,
      color: [AppColors.c1, AppColors.c4, AppColors.c5, AppColors.c7],
    ));
  }

  void setIndex(int index, int ci) {
    emit(AppState(
        cartItems: [],
        qty: 1,
        modal: state.modal,
        img: state.img,
        index: index,
        color: state.color,
        cIndex: ci));
  }

  void increment() {
    int currentQuantity = state.qty;
    emit(AppState(
      cartItems: [],
      modal: state.modal,
      img: state.img,
      qty: currentQuantity + 1,
      index: state.index,
      color: state.color,
    ));
  }

  void decrement(BuildContext context) {
    int currentQuantity = state.qty;
    if (currentQuantity > 1) {
      emit(AppState(
        cartItems: [],
        modal: state.modal,
        img: state.img,
        qty: currentQuantity - 1,
        index: state.index,
        color: state.color,
      ));
    } else {
      Navigator.pop(context);
    }
  }

  List<CartModal> cartList = [];

  Future<void> addToCart(CartModal modal) async {
    await DatabaseHelper.dbh.addCart(modal);
  }

  Future<void> fetchCart() async {
    cartList = await DatabaseHelper.dbh.fetchCart();
    emit(AppState(
      modal: state.modal,
      img: state.img,
      qty: state.qty,
      cartItems: cartList,
      index: state.index,
      color: state.color,
      cIndex: state.cIndex,
    ));
  }
}
