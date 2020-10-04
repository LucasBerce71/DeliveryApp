
import 'package:dio/dio.dart';
import 'package:mobile/app/exceptions/rest_exception.dart';
import 'package:mobile/app/models/user_model.dart';

class AuthRepository {
  
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await Dio().post('http://10.0.2.2:8888/user/auth', data: {
        'email',
        'password'
      });

      return UserModel.fromMap(response.data);
    } on DioError catch (e) {
      print(e);
      String message = 'Erro ao autenticar o usuário';
      if(e?.response?.statusCode == 403) {
        message = 'Usuário ou senha inválidos';
      }
      throw RestException(message);
    }
  }  

}