
import 'package:dio/dio.dart';

import '../../../commen/error_handling/app_exception.dart';
import '../../../commen/error_handling/check_exceptions.dart';
import '../../../commen/params/products_params.dart';
import '../../../commen/resources/data_state.dart';
import '../data/data_source/product_api_provider.dart';
import '../data/models/all_products_model.dart';

class AllProductsRepository {
  ProductsApiProvider apiProvider;
  AllProductsRepository(this.apiProvider);

  Future<dynamic> fetchAllProductsData(ProductsParams productsParams) async {
    try{
      // convert json to models class
      Response response = await apiProvider.callAllProducts(productsParams);
      final AllProductsModel allProductsModel = AllProductsModel.fromJson(response.data);
      return DataSuccess(allProductsModel);
    } on AppException catch(e){
      print(e);
      return CheckExceptions.getError(e);
    }
  }

  Future<List<Products>> fetchAllProductsDataSearch(ProductsParams productsParams) async {
    Response response = await apiProvider.callAllProducts(productsParams);
    final AllProductsModel allProductsModel = AllProductsModel.fromJson(response.data);
    return allProductsModel.data![0].products!;
  }
}