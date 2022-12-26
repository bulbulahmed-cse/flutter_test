import 'package:flutter_task/app/modules/product_details/bindings/product_details_binding.dart';
import 'package:flutter_task/app/modules/product_details/views/product_details_view.dart';
import 'package:flutter_task/app/modules/products/bindings/products_binding.dart';
import 'package:flutter_task/app/modules/products/views/products_view.dart';
import 'package:get/get.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PRODUCTS;

  static final routes = [
    GetPage(
      name: _Paths.PRODUCTS,
      page: () => ProductsView(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
  ];
}
