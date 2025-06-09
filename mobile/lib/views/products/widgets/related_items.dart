import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project1/common/GrideLayout.dart';
import 'package:graduation_project1/models/products_model.dart';
import 'package:graduation_project1/views/products/Product_page.dart';
import 'package:graduation_project1/views/products/widgets/product_widget.dart';

class RelatedItems extends StatelessWidget {
  final List<Product> products;
  const RelatedItems({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GrideLayout(
        mainAxisspacing: 16,
        mainAxis: 275,
        crossAxiscount: 2,
        scrooldirection: Axis.vertical,
        shrinkwrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length < 2 ? products.length : 2,
        itemBuilder: (context, i) {
          final product = products[i];

          return ProductWidget(
            onTap: () => Get.to(() => ProductDetailScreen(product: product)),
            brand: product.brand.name,
            price: product.price.toStringAsFixed(2),
            title: product.name,
            image: product.imgUrl,
            isDiscounted: product.isDiscounted,
            discountAmount: product.discountAmount,
            id: product.id,
          );
        },
      ),
    );
  }
}
