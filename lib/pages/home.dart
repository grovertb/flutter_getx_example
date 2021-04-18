import 'package:flutter/material.dart';
import 'package:flutter_example/controllers/global.dart';
// import 'package:flutter_example/pages/home_page_widgets/home_list.dart';
import 'package:flutter_example/widgets/product_list.dart';
import 'package:get/get.dart';
import 'package:flutter_example/controllers/home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          actions: [
            GetBuilder<GlobalController>(
              id: "favorites",
              builder: (_) => TextButton(
                child: Text(
                  "Favoritos ( ${_.favorites.length} )",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        // body: HomeList(),
        body: ProductList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _.increment();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
