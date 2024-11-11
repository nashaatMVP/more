abstract class ApiConsumer {

  Future<dynamic> get(
      String path , {
    Object? data,
    dynamic? query,
  });
  Future<dynamic> patch(String path , {
    Object? data,
    Map<String , dynamic>? query,
  });
  Future<dynamic> delete(String path , {
    Object? data,
    Map<String , dynamic>? query,
  });
  Future<dynamic> post(String path , {
    Object? data,
    Map<String , dynamic>? query,
  });
}