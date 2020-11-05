import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rtad/data/api/apiservice.dart';
import 'package:rtad/data/repository.dart';
void module(){
  final Dio _dio = Dio();
  _dio.interceptors.add(LogInterceptor(responseBody: true, logPrint: (log) => print(log)));
  final ApiService _apiService = ApiService(_dio);
  Repository _repository = Repository(_apiService);
  GetIt.I.registerLazySingleton(() => _repository);
}