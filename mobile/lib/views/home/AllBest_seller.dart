import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project1/common/app_style.dart';
import 'package:graduation_project1/common/reusable_text.dart';
import 'package:graduation_project1/constants/constants.dart';
import 'package:graduation_project1/hooks/fetch_all_products.dart';
import 'package:graduation_project1/models/products_model.dart';
import 'package:graduation_project1/data/product_sort.dart';
import 'package:graduation_project1/views/products/widgets/product_widget.dart';

class AllbestSeller extends HookWidget {
  const AllbestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllProducts();
    final products = hookResult.data;
    final isLoading = hookResult.isLoading;

    final originalProducts = useState<List<Product>>([]);
    final displayedProducts = useState<List<Product>>([]);

    useEffect(
      () {
        if (!isLoading && products != null) {
          originalProducts.value = [...products];
          displayedProducts.value = [...products];
        }
        return null;
      },
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Kbackground,
          title: ReusableText(
            text: "Best Seller",
            style: appStyle(16, kDarkBlue, FontWeight.w500),
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : (displayedProducts.value.isEmpty)
                ? const Center(child: Text("No best sellers found."))
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: displayedProducts.value.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 260.h,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final product = displayedProducts.value[index];
                        return ProductWidget(
                          id: product.id,
                          title: product.name,
                          brand: product.brand.name,
                          price: product.price.toStringAsFixed(2),
                          isDiscounted: product.isDiscounted,
                          discountAmount: product.discountAmount,
                          image:
                              "https://plus.unsplash.com/premium_photo-1664472724753-0a4700e4137b?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
