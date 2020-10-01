import 'package:pizza_delivery_api/application/config/database_connection_configuration.dart';

import '../../pizza_delivery_api.dart';

class PizzaDeliveryConfiguration extends Configuration {
  PizzaDeliveryConfiguration(String fileName) : super.fromFile(File(fileName));
  DatabaseConnectionConfiguration database;
}