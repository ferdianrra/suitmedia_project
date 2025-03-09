import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:practices/commons/const.dart';
import 'package:practices/commons/failure.dart';
import 'package:practices/data/datasources/user_remote_data_source.dart';
import 'package:practices/domain/entities/user.dart';
import 'package:practices/domain/repositories/user_repository.dart';

import '../../commons/exception.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource
  });

  @override
  Future<Either<Failure, List<User>>> getUsers(int sizeItems, int? pageItems) async {
    try {
      final result = await remoteDataSource.getUser(sizeItems, pageItems);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(""));
    } on SocketException {
      return Left(ConnectionFailure(socketExceptionText));
    }
  }

}