import 'package:dio/dio.dart';
import 'package:more/core/api/api_consumer.dart';
import 'package:more/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer{

  final Dio dio;

  DioConsumer({required this.dio}) {
    // dio.options.baseUrl = "https://newsapi.org/";
  }

  @override
  Future delete(String path, {Object? data, Map<String, dynamic>? query}) async {
     try {
       final response = await dio.delete(path,data: data,queryParameters: query);
       return response.data;
     } on DioException catch (e) {
       return handleDioExceptions(e);
     }
  }

  @override
  Future get(String path, {Object? data, dynamic? query}) async{
    try {
      final response = await dio.get(path,data: data,queryParameters: query);
      return response.data;
    } on DioException catch (e) {
      return handleDioExceptions(e);
    }
  }

  @override
  Future patch(String path, {Object? data, Map<String, dynamic>? query}) async{
    try {
      final response = await dio.patch(path,data: data,queryParameters: query);
      return response.data;
    } on DioException catch (e) {
      return handleDioExceptions(e);
    }
  }

  @override
  Future post(String path, {Object? data, Map<String, dynamic>? query}) async {
    try {
      final response = await dio.post(path,data: data,queryParameters: query);
      return response.data;
    } on DioException catch (e) {
      return handleDioExceptions(e);
    }
  }



}