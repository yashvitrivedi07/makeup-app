import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/app_bloc.dart';
import 'package:flutter_application_1/view/cart/cart_page.dart';
import 'package:flutter_application_1/view/detail/detail_page.dart';
import 'package:flutter_application_1/view/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => AppBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => child!,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "Inter"),
          routes: {
            '/': (context) => HomePage(),
            '/detail': (context) => DetailPage(),
            '/cart': (context) => CartPage()
          },
        ));
  }
}
