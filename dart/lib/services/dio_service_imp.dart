import 'package:chuva_dart/services/dio_service.dart';
import 'package:dio/dio.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://raw.githubusercontent.com/chuva-inc/exercicios-2023/master/dart/assets/',
        headers: {
          'content-type': 'application/json; charset=utf-8',
        },
      ),
    );
  }
}
