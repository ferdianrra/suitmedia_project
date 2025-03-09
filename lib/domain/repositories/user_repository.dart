import 'package:dartz/dartz.dart';
import 'package:practices/commons/failure.dart';
import 'package:practices/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers(int sizeItems, int? pageItems);
}