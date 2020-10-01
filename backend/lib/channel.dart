import 'package:get_it/get_it.dart';
import 'package:pizza_delivery_api/application/config/pizza_delivery_configuration.dart';
import 'package:pizza_delivery_api/application/config/service_locator_config.dart';
import 'package:pizza_delivery_api/application/routers/routers_configure.dart';
import 'package:pizza_delivery_api/pizza_delivery_api.dart';

class PizzaDeliveryApiChannel extends ApplicationChannel {

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    GetIt.I.registerLazySingleton(() => PizzaDeliveryConfiguration(options.configurationFilePath));
    configureDependencies();
  }

  @override
  Controller get entryPoint {
    
    final router = Router();

    RoutersConfigure(router).configure();

    return router;
  }
}