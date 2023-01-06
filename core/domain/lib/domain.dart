/// Support for doing something awesome.
///
/// More dartdocs go here.
library domain;

export 'src/di/domain_dependency_configurator.dart';
export 'package:dartz/dartz.dart';

//repository contracts
export 'src/repository/user_repository.dart';
export 'src/repository/home_repository.dart';

//use-cases
export 'src/usecase/base/params.dart';
export 'src/usecase/user/login_usecase.dart';
export 'package:shared/shared.dart';
export 'src/usecase/home/get_joke_usecase.dart';
export 'src/usecase/home/store_joke_usecase.dart';
export 'src/usecase/home/get_bookmarked_joke_usecase.dart';

