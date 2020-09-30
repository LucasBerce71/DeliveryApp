import 'package:pizza_delivery_api/application/entities/menu.dart';

abstract class IMenuRepository {
  Future<List<Menu>> findAll();
}