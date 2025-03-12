import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/detail_component.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DetailComponent(),
    );
  }
}