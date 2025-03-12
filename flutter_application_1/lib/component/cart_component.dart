import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/app_bloc.dart';
import 'package:flutter_application_1/bloc/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartComponent extends StatefulWidget {
  const CartComponent({super.key});

  @override
  State<CartComponent> createState() => _CartComponentState();
}

class _CartComponentState extends State<CartComponent> {
  @override
  void initState() {
    super.initState();
    context.read<AppBloc>().fetchCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = state.cartItems[index];
                  return Container(
                    margin: EdgeInsets.all(20),
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 3)
                        ]),
                    child: Row(
                  children: [
                  Image.memory(item.image, height: 80.h),
                  SizedBox(width: 10.w), // Adding spacing between image and text
                  Expanded(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                  "${item.name}",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.sp),
                  ),
                  Row(
                    children: [
                      Text(
                      "\$${item.price}",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      
                      Text("${item.qty}")
                    ],
                  ),
                  ],
                  ),
                  ),
                  ],
                  ),

                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
