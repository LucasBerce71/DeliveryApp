
import 'package:get_it/get_it.dart';
import 'package:pizza_delivery_api/application/routers/i_router_configure.dart';
import 'package:pizza_delivery_api/modules/orders/controllers/find_by_user_controller.dart';
import 'package:pizza_delivery_api/modules/orders/controllers/register_order_controller.dart';
import 'package:pizza_delivery_api/pizza_delivery_api.dart';

class OrdersRouters implements IRouterConfigure {
  @override
  void configure(Router router) {
    router
      .route('/order')
      .link(() => GetIt.I.get<RegisterOrderController>());

    router
      .route('/orders/user/:userId')
      .link(() => GetIt.I.get<FindByUserController>());
  }
  
}