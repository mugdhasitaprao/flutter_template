import 'package:data/data.dart';
import 'package:data/src/repository/home_repository_impl.dart';
import 'package:data/src/repository/user_repository.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @lazySingleton
  UserRepository userRepositoryProvider(
      DatabasePort databasePort, NetworkPort networkPort) {
    return UserRepositoryImpl(databasePort, networkPort);
  }

  @lazySingleton
  HomeRepository homeRepositoryProvider(
      DatabasePort databasePort, NetworkPort networkPort) {
    return HomeRepositoryImpl(databasePort, networkPort);
  }
}
