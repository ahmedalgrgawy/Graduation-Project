import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project1/common/GrideLayout.dart';
import 'package:graduation_project1/controllers/search_products_controller.dart';
import 'package:graduation_project1/models/products_model.dart';
import 'package:graduation_project1/views/products/Product_page.dart';
import 'package:graduation_project1/views/products/widgets/product_widget.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchProductsController());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GrideLayout(
        mainAxisspacing: 20,
        mainAxis: 0.33.sh, // ~38% of screen height
        crossAxiscount: 2,
        scrooldirection: Axis.vertical,
        shrinkwrap: false,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.searcResults?.length ?? 0,
        itemBuilder: (context, i) {
          final Product product = controller.searcResults![i];
          return ProductWidget(
            onTap: () {
              Get.to(() => ProductDetailScreen(product: product));
            },
            id: product.id,
            title: product.name,
            brand: product.brand.name,
            price: product.price.toStringAsFixed(2),
            isDiscounted: product.isDiscounted,
            discountAmount: product.discountAmount,
            image: product.imgUrl,
          );
        },
      ),
    );
  }
}
