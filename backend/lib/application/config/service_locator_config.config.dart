// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../database/database_connection.dart';
import '../database/i_database_connection.dart';
import '../../modules/menu/data/i_menu_repository.dart';
import '../../modules/menu/service/i_menu_service.dart';
import '../../modules/users/data/i_user_repository.dart';
import '../../modules/users/service/i_user_service.dart';
import '../../modules/users/controller/login_user_controller.dart';
import '../../modules/menu/controllers/menu_find_controller.dart';
import '../../modules/menu/data/menu_repository.dart';
import '../../modules/menu/service/menu_service.dart';
import 'pizza_delivery_configuration.dart';
import '../../modules/users/controller/register_user_controller.dart';
import '../../modules/users/data/user_repository.dart';
import '../../modules/users/service/user_service.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<IDatabaseConnection>(
      () => DatabaseConnection(get<PizzaDeliveryConfiguration>()));
  gh.lazySingleton<IMenuRepository>(
      () => MenuRepository(get<IDatabaseConnection>()));
  gh.lazySingleton<IMenuService>(() => MenuService(get<IMenuRepository>()));
  gh.lazySingleton<IUserRepository>(
      () => UserRepository(get<IDatabaseConnection>()));
  gh.lazySingleton<IUserService>(() => UserService(get<IUserRepository>()));
  gh.factory<LoginUserController>(
      () => LoginUserController(get<IUserService>()));
  gh.factory<MenuFindController>(() => MenuFindController(get<IMenuService>()));
  gh.factory<RegisterUserController>(
      () => RegisterUserController(get<IUserService>()));
  return get;
}
