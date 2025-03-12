import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/app_bloc.dart';
import 'package:flutter_application_1/bloc/app_state.dart';
import 'package:flutter_application_1/colors/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({super.key});

  @override
  State<HomeComponent> createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  @override
  void initState() {
    super.initState();

    context.read<AppBloc>().getData();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return (state.img.isNotEmpty && state.modal.isNotEmpty)
          ? Column(
              children: [
                SizedBox(
                  height: 45.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: 280.w,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0.w),
                        child: SearchBar(
                          controller: searchController,
                          leading: Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.search,
                                      color: Colors.white, size: 18.sp),
                                ),
                                TextSpan(
                                  text: " Search",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          padding: WidgetStatePropertyAll(
                              EdgeInsets.only(left: 10.w)),
                          backgroundColor: WidgetStatePropertyAll(AppColors.c2),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10.w),
                        height: 40.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: AppColors.c9),
                        child: Icon(Icons.filter_2),
                      ),
                    ),
                  ],
                ),

                // SizedBox(height: 10.h,),

                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                      mainAxisSpacing: 15.h,
                      mainAxisExtent: 210.h,
                      crossAxisSpacing: 10.w,
                    ),
                    itemCount: state.modal.length,
                    itemBuilder: (BuildContext context, int index) {
                      return (index % 2 == 0)
                          ? SizedBox(
                              height: 150.h,
                              width: 120.w,
                              child: InkWell(
                                onTap: () {
                                  int colorIndex = index % state.color!.length;
                                  Navigator.pushNamed(context, '/detail');
                                  context
                                      .read<AppBloc>()
                                      .setIndex(index, colorIndex);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 15.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: (state.color != null &&
                                            state.color!.isNotEmpty)
                                        ? state
                                            .color![index % state.color!.length]
                                        : Colors.grey,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    spacing: 2.h,
                                    children: [
                                      SizedBox(
                                          height: 120.h,
                                          width: 160.w,
                                          child:
                                              Image.memory(state.img[index])),
                                      Text(
                                        "${state.modal[index].name}",
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                          "${state.modal[index].product_type}"),
                                      Container(
                                        padding: EdgeInsets.all(2),
                                        alignment: Alignment.center,
                                        height: 35.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.r),
                                            color: Colors.white),
                                        child: Text(
                                          "${state.modal[index].price}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 150.h,
                              width: 120.w,
                              child: Transform.translate(
                                offset: Offset(0, 35.h),
                                child: InkWell(
                                  onTap: () {
                                    int colorIndex =
                                        index % state.color!.length;
                                    Navigator.pushNamed(context, '/detail');
                                    context.read<AppBloc>().setIndex(
                                        index, colorIndex); // Update later
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 15.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.r),
                                      color: (state.color != null &&
                                              state.color!.isNotEmpty)
                                          ? state.color![
                                              index % state.color!.length]
                                          : Colors.grey,
                                    ),
                                    child: Column(
                                      spacing: 2.h,
                                      children: [
                                        SizedBox(
                                            height: 120.h,
                                            width: 160.w,
                                            child:
                                                Image.memory(state.img[index])),
                                        Text(
                                          "${state.modal[index].name}",
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp),
                                        ),
                                        Text(
                                            "${state.modal[index].product_type}"),
                                        Container(
                                          padding: EdgeInsets.all(2),
                                          alignment: Alignment.center,
                                          height: 35.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50.r),
                                              color: Colors.white),
                                          child: Text(
                                            "${state.modal[index].price}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
