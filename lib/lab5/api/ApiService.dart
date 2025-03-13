import 'dart:convert';

import 'package:app8/lab5/api/apihttps.dart';
import 'package:app8/lab5/models/categersmodels.dart';
import 'package:dio/dio.dart';

class Apiservice {
  final Dio _dio;
  Apiservice(this._dio);
  Future<List<Categersmodels>> fetchcagters() async {
    List<Categersmodels> data = [];

    try {
      Response response = await _dio.get(
        "${Apihttps.baseuil}${Apihttps.endpoint}",
      );
      //var respon = jsonDecode(response.data);
      print(response.runtimeType);
      if (response.statusCode == 200) {
        for (var element in response.data['recipes']) {
          data.add(Categersmodels.fromJson(element));
        }
        print(data.length);
        return data;
      } else {
         throw Exception('this is error');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
     








     
  Future<List<String>> gettype() async {
    List<String> types = [];

    try {
      Response response = await _dio.get(
        "${Apihttps.baseuil}${Apihttps.endpoint}",
      );
      //var respon = jsonDecode(response.data);
      print(response.runtimeType);
      if (response.statusCode == 200) {
        for (var element in response.data['recipes'][0]["mealType"]) {
          types.add(element);
        }
        print(types);
        return types;
      } else {
        throw 'dfdfdfdfdffddfdfdfdfdfd';
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
