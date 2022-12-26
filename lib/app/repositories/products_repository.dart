import 'package:flutter_task/app/data/products.dart';

import '../app_helper/api_client.dart';
import '../utils/url.dart';

class ProductRepository{
  ApiClient apiClient = ApiClient();

  void close(){
    apiClient.close();
  }
  Future getProducts({required Function(List<Products>) onSuccess,required Function(Map<String,dynamic>) onError}) async {
    await apiClient.Request(
        url: URL.getProducts(),
        withAuth: false,
        onSuccess: (data) {
          onSuccess(Products.makeList(data));
        },
        onError: (Map<String,dynamic> data) {
          onError(data);
        }
    );
  }

  Future getSingleProduct({required int id,required Function(Products) onSuccess,required Function(Map<String,dynamic>) onError}) async {
    await apiClient.Request(
        url: URL.getSingleProducts(id: id),
        withAuth: false,
        onSuccess: (data) {
          onSuccess(Products.fromJson(data));
        },
        onError: (Map<String,dynamic> data) {
          onError(data);
        }
    );
  }
}