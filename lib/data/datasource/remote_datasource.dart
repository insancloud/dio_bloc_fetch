import 'package:dio/dio.dart';
import 'package:dio_bloc/data/model/user.dart';

class RemoteDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://reqres.in/api',
  ));

  Future<DataUser> getUsers() async {
    final response = await dio.get('/users');
    return DataUser.fromJson(response.data);
  }
}