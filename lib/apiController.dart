import 'package:get/get.dart';
import 'httpHelper.dart';
import 'model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  RxList<ProductModel> productList = RxList<ProductModel>();

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var products = await HttpHelper.fetchDetails();
      if (products.isNotEmpty) {
        productList.value = products;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
