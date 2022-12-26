import 'package:flutter_task/app/data/products.dart';
import 'package:flutter_task/app/repositories/products_repository.dart';
import 'package:flutter_task/app/routes/app_pages.dart';
import 'package:flutter_task/app/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsController extends GetxController {
  ProductRepository productRepository = ProductRepository();

  RxBool isLoading = false.obs;

  List<Products>? productList;

  @override
  void onInit() {

    getProductList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    productRepository.close();
  }

  Future<void> refreshProduct() async {
    productList = null;
  }

  Future<void> getProductList() async {
    try {
      await productRepository.getProducts(
        onSuccess: (data) {
          if (data.isNotEmpty) {
              productList = data;
          }
        },
        onError: (Map<String, dynamic> error) {
        },
      );
    } catch (error) {}
    update();
  }

  void gotoDetails(Products item) {
    Get.toNamed(Routes.PRODUCT_DETAILS, arguments: {
      AppConstant.id : item.id
    });
  }
}
