import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../commen/error_handling/check_exceptions.dart';
import '../../../../config/constants.dart';

class HomeApiProvider {
  Dio dio;
  HomeApiProvider(this.dio);


  dynamic callHomeData(lat, lon) async {
    final response = await dio.get(
        "${Constants.baseUrl}/mainData",
        queryParameters: {
          "lat" : lat,
          "long" : lon,
        }
    ).onError((DioError error, stackTrace){
      return CheckExceptions.response(error.response!);
    });

    log(response.toString());

    return response;
  }

}