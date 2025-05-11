import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project1/common/GrideLayout.dart';
import 'package:graduation_project1/common/shimmers/nearby_shimmer.dart';
import 'package:graduation_project1/models/hook_result.dart';
import 'package:graduation_project1/views/products/Product_page.dart';
import 'package:graduation_project1/views/products/widgets/product_widget.dart';

class ProductList extends HookWidget {
  const ProductList({
    super.key,
    this.isAll = false,
    this.scrooldirection = Axis.horizontal,
    required this.hookresults,
  });
  final bool isAll;
  final FetchHook hookresults;
  final Axis scrooldirection;

  @override
  Widget build(BuildContext context) {
    final hookResult = hookresults;
    final products = hookResult.data;
    final isLoading = hookResult.isLoading;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      height: 260.h,
      child: isLoading
          ? const NearbyShimmer()
          : GrideLayout(
              crossAxisspacing: 20,
              scrooldirection: scrooldirection,
              itemCount: products.length < 4 ? products.length : 4,
              itemBuilder: (context, i) {
                final product = products[i];
                return ProductWidget(
                  onTap: () {
                    Get.to(() => ProductPage());
                  },
                  brand: product.brand.name,
                  price: product.price.toStringAsFixed(2),
                  title: product.name,
                  id: product.id,
                  // image: product.imageUrl ??
                  //     "https://plus.unsplash.com/premium_photo-1664472724753-0a4700e4137b?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  isDiscounted: product.isDiscounted,
                  discountAmount: product.discountAmount,
                );
              },
            ),
    );
  }
}
