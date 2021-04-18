import 'package:flutter/material.dart';
import 'package:flutter_example/controllers/home.dart';
import 'package:get/get.dart';

class HomeLabel extends StatelessWidget {
  const HomeLabel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'text',
      builder: (_) => Text(_.counter.toString()),
    );
  }
}
