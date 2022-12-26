

class URL {
  static String baseUrl = 'https://fakestoreapi.com/';
  static String getProducts() => 'products';
  static String getSingleProducts({required int id}) => 'products/$id';
}