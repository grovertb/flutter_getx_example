import 'package:flutter/material.dart';
import 'package:flutter_example/controllers/globalController.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<GlobalController>();
    return GetBuilder<GlobalController>(
      id: 'products',
      builder: (_) {
        return ListView.builder(
          itemBuilder: (__, index) {
            final product = _.products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('USD ${product.price}'),
              trailing: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: product.isFavorite ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  _.onFavorite(index, !product.isFavorite);
                },
              ),
            );
          },
          itemCount: _.products.length,
        );
      },
    );
  }
}
