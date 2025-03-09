import 'package:dartz/dartz.dart';
import 'package:practices/commons/failure.dart';
import 'package:practices/domain/entities/user.dart';
import 'package:practices/domain/repositories/user_repository.dart';

class GetUser{
  final UserRepository _repository;

  GetUser(this._repository);

  Future<Either<Failure, List<User>>> execute(int sizeItems, int? pageItems) {
    return _repository.getUsers(sizeItems, pageItems);
  }
}