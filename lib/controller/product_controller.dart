import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:product_apiii/model/product_model.dart';
import 'package:product_apiii/service/product_service.dart';


class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = <Products>[].obs;

  final HttpService service=HttpService();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }
  void fetchProducts() async{
    try{
      isLoading(true);
      var products= await HttpService.fetchProducts();
      if(products !=null){
        productList.value = products;
      }
    }catch(e){
      print(e);
    }finally{
      isLoading(false);
    }
  }
}