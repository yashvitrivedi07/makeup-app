import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/app_bloc.dart';
import 'package:flutter_application_1/bloc/app_state.dart';
import 'package:flutter_application_1/colors/app_colors.dart';
import 'package:flutter_application_1/modal/cart_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailComponent extends StatelessWidget {
  const DetailComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      int ind = state.index ?? 0;
      return Stack(
        children: [
          Container(
            width: 360.w,
            height: 500.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: state.color![state.cIndex!],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(145.r),
                  bottomRight: Radius.circular(145.r)),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 25.h,
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.c2,
                        )),
                  ),
                ),
                Positioned(
                  top: 60.h,
                  left: 110.w,
                  child: CircleAvatar(
                    radius: 105.r,
                    backgroundColor: Colors.white,
                    child: Image.memory(
                      state.img[ind],
                      height: 140.h,
                    ),
                  ),
                ),
                Positioned(
                  top: 60.h,
                  left: 130.w,
                  child: Container(
                    width: 230.r,
                    height: 230.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.c8,
                        width: 1.w,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 115.r,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80.h,
                  left: 10.w,
                  child: SizedBox(
                    width: 200.w,
                    child: Column(
                      spacing: 8.0.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${state.modal[ind].brand}",
                          style: TextStyle(
                              fontSize: 22.h,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${state.modal[ind].name}",
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 18.h,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w200),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 10.h,
                          thickness: .5.w,
                          endIndent: 5.w,
                        ),
                        Text(
                          "${state.modal[ind].price}",
                          style: TextStyle(
                              fontSize: 30.h,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),

                Positioned(
                  left: 210.w,
                  bottom: 80.h,
                  child: TextButton(
                    onPressed: () {
                      showBottomSheet(
                        showDragHandle: true,
                        backgroundColor: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        enableDrag: true,
                        sheetAnimationStyle: AnimationStyle(
                            curve: Curves.bounceIn,
                            duration: Duration(seconds: 1)),
                        context: context,
                        builder: (context) {
                          return Container(
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: state.color![state.cIndex!],
                                borderRadius: BorderRadius.circular(15.r),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 2)
                                ]),
                            height: 400.h,
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.w, right: 15.w),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "\nName : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.sp),
                                          ),
                                          TextSpan(
                                              text:
                                                  "${state.modal[ind].name}\n\n"),
                                          TextSpan(
                                            text: "Description : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.sp),
                                          ),
                                          TextSpan(
                                            text:
                                                "${state.modal[ind].description?.trim()}\n\n",
                                            style: TextStyle(height: 1.2),
                                          ),
                                          TextSpan(
                                            text: "Brand : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.sp),
                                          ),
                                          TextSpan(
                                              text:
                                                  "${state.modal[ind].brand}\n\n"),
                                          TextSpan(
                                            text: "Price : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.sp),
                                          ),
                                          TextSpan(
                                              text:
                                                  "${state.modal[ind].price}\n\n"),
                                          TextSpan(
                                            text: "Product Type : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.sp),
                                          ),
                                          TextSpan(
                                              text:
                                                  "${state.modal[ind].product_type}\n\n"),
                                          TextSpan(
                                            text: "Rating: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.sp),
                                          ),
                                          TextSpan(
                                              text:
                                                  "${state.modal[ind].rating}\n\n"),
                                        ],
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text("in detail >",
                        style: TextStyle(
                            fontSize: 14.h,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                )
                // Positioned(
                //   left: 65.w,
                //   top: -7.h,
                //   child: SizedBox(
                //     height: 320.h,
                //     child: Image.memory(
                //       state.img[ind],
                //       height: 60.h,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 360.w,
              height: 215.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: state.color![state.cIndex!],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(130.r),
                  topRight: Radius.circular(130.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 90.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ActionSlider.standard(
                      direction: TextDirection.rtl,
                      sliderBehavior: SliderBehavior.move,
                      icon: Icon(
                        Icons.card_travel,
                        color: AppColors.c2,
                      ),
                      height: 60.h,
                      width: 450.w,
                      backgroundColor: AppColors.c2,
                      action: (controller) async {
                        controller.loading();

                        await Future.delayed(Duration(milliseconds: 500), () {
                          final appBloc = context.read<AppBloc>();
                          CartModal m = CartModal(
                              description: state.modal[ind].description,
                              image: state.img[ind],
                              name: state.modal[ind].name,
                              price: state.modal[ind].price,
                              qty: state.qty);
                          appBloc.addToCart(m);
                        });

                        controller.success();

                        await Future.delayed(Duration(seconds: 1));
                        controller.reset();
                      },
                      toggleColor: Colors.white,
                      backgroundBorderRadius: BorderRadius.circular(50.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Text(
                              "Add To Cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 185.h,
            left: 5.w,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 23.r,
              child: IconButton(
                  onPressed: () {
                    context.read<AppBloc>().increment();
                  },
                  icon: Icon(
                    Icons.add,
                    color: AppColors.c2,
                  )),
            ),
          ),
          Positioned(
            bottom: 185.h,
            right: 5.w,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 23.r,
              child: IconButton(
                  onPressed: () {
                    context.read<AppBloc>().decrement(context);
                  },
                  icon: Icon(
                    Icons.remove,
                    color: AppColors.c2,
                  )),
            ),
          ),
          Positioned(
              bottom: 185.h,
              left: 130.w,
              child: Container(
                alignment: Alignment.center,
                height: 50.h,
                width: 110.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Colors.white),
                child: Text(
                  "${state.qty
                  }",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
              ))
        ],
      );
    });
  }
}
