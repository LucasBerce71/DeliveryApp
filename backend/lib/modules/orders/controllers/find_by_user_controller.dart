import 'package:injectable/injectable.dart';
import 'package:pizza_delivery_api/modules/orders/service/i_order_service.dart';
import 'package:pizza_delivery_api/pizza_delivery_api.dart';

@Injectable()
class FindByUserController extends ResourceController {
  final IOrderService _service;

  FindByUserController(this._service);

  @Operation.get('userId')
  Future<Response> findById(@Bind.path('userId') int userId) async {
    try {
      final orders = await _service.findByUserId(userId);
      return Response.ok(orders.map((o) => o.toJson()).toList());
    } catch (e) {
      print(e);
      return Response.serverError(body: {'message': 'Erro ao buscar pedidos'});
    }
  }
}
