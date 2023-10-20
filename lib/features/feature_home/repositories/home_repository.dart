
import 'package:dio/dio.dart';

import '../../../commen/error_handling/app_exception.dart';
import '../../../commen/error_handling/check_exceptions.dart';
import '../../../commen/resources/data_state.dart';
import '../data/data_source/home_api_provider.dart';
import '../data/models/home_model.dart';



class HomeRepository {
  HomeApiProvider apiProvider;
  HomeRepository(this.apiProvider);

  Future<DataState<HomeModel>> fetchHomeData(lat, lon) async {
    try{
      Response response = await apiProvider.callHomeData(lat, lon);
      final HomeModel homeModel = HomeModel.fromJson(response.data);
      return DataSuccess(homeModel);
    } on AppException catch(e){
      return await CheckExceptions.getError(e);
    }
  }
}