import 'package:apidemo/model.dart';
import 'package:dio/dio.dart';

const String baseURL="https://kurminfotech.in/faculty/";

Future<Dio> getDio()async{
  var option= BaseOptions(
    baseUrl: baseURL+'api/',
    validateStatus: (status){
      return status! < 500;
    },
    responseType: ResponseType.json,
    followRedirects: false,
  );
  Dio dio=Dio(option);
  return dio;
}

Future<Respose> getcategory() async{
  Dio dio= await getDio();
  Response response= await dio.post("listCategories");
  try {
    final respose = Respose.fromJson(response.data);
    return respose;
  } catch (error) {
    var respose = Respose();
    return respose;
  }
}