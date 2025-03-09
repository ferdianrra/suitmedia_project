import 'dart:convert';
import 'package:http/http.dart'  as http;
import 'package:practices/data/models/user_model.dart';
import 'package:practices/data/models/user_response.dart';
import '../../commons/exception.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUser([int size = 10, int? page = 1]);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  static const BASE_URL = 'https://reqres.in/api';
  final http.Client client;

  UserRemoteDataSourceImpl({
    required this.client
  });

  @override
  Future<List<UserModel>> getUser([int size = 10, int? page = 1]) async {
    final response = await client.get(Uri.parse('$BASE_URL/users?page=$page&per_page=$size'));

    if(response.statusCode == 200) {
      return UserResponse.fromJson(json.decode(response.body)).userList;
    } else {
      throw ServerException();
    }
  }}