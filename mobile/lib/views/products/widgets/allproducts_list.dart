import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project1/models/products_model.dart';
import 'package:graduation_project1/views/products/widgets/product_widget.dart';

class AllProductsList extends StatelessWidget {
  final List<Product> products;
  final bool scrollable;
  final bool showEmptyMessage;

  const AllProductsList({
    super.key,
    required this.products,
    this.scrollable = false,
    this.showEmptyMessage = true,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty && showEmptyMessage) {
      return const Center(child: Text("No products found."));
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: GridView.builder(
        shrinkWrap: !scrollable,
        physics: scrollable
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 260.h,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductWidget(
            id: product.id,
            title: product.name,
            brand: product.brand.name,
            price: product.price.toStringAsFixed(2),
            isDiscounted: product.isDiscounted,
            discountAmount: product.discountAmount,
            image:
                "https://plus.unsplash.com/premium_photo-1664472724753-0a4700e4137b?q=80&w=1780&auto=format&fit=crop",
          );
        },
      ),
    );
  }
}
