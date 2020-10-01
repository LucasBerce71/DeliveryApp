import 'package:injectable/injectable.dart';
import 'package:pizza_delivery_api/modules/orders/controllers/models/register_order_rq.dart';
import 'package:pizza_delivery_api/modules/orders/service/i_order_service.dart';
import 'package:pizza_delivery_api/modules/orders/view_objects/save_order_input_model.dart';
import 'package:pizza_delivery_api/pizza_delivery_api.dart';

@Injectable()
class RegisterOrderController extends ResourceController {
  final IOrderService _service;

  RegisterOrderController(this._service);

  @Operation.post()
  Future<Response> saveOrder(@Bind.body() RegisterOrderRq orderRq) async {
    try {
      await _service.saveOrder(mapper(orderRq));
      return Response.ok({});
    } catch (e) {
      print(e);
      return Response.serverError(body: {'message': 'Erro ao registrar pedido'});
    }
  }

  SaveOrderInputModel mapper(RegisterOrderRq orderRq) => SaveOrderInputModel(
        userId: orderRq.userId,
        address: orderRq.address,
        paymentType: orderRq.paymentType,
        itemsId: orderRq.itemsId,
      );
}
