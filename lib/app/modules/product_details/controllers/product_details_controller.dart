import 'package:flutter_task/app/data/products.dart';
import 'package:flutter_task/app/utils/app_constant.dart';
import 'package:get/get.dart';
import '../../../repositories/products_repository.dart';

class ProductDetailsController extends GetxController {
  ProductRepository productRepository = ProductRepository();
  RxBool isLoading = false.obs;

  Products? product;

  final count = 0.obs;

  @override
  void onInit() {
    int id = Get.arguments[AppConstant.id];
    getProduct(id: id);
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

  Future getProduct({required int id}) async {
    isLoading(true);
    await productRepository.getSingleProduct(
      id: id,
      onSuccess: (Products product) {
        this.product = product;
      },
      onError: (dynamic) {},
    );
    isLoading(false);
    update();
  }
}
