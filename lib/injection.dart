import 'package:get_it/get_it.dart';
import 'package:practices/data/datasources/user_remote_data_source.dart';
import 'package:practices/data/repositories/user_repository_impl.dart';
import 'package:practices/domain/repositories/user_repository.dart';
import 'package:practices/domain/usecases/get_user.dart';
import 'package:practices/presentation/provider/user_list_notifier.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  locator.registerFactory(
      () => UserListNotifier(getUser: locator())
  );

  locator.registerLazySingleton(() => GetUser(locator()));

  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: locator())
  );

  locator.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: locator())
  );

  locator.registerLazySingleton(() => http.Client());
}
