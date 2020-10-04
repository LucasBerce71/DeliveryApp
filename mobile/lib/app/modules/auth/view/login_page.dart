import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mobile/app/modules/auth/controllers/login_controller.dart';
import 'package:mobile/app/modules/splash/view/splash_page.dart';
import 'package:mobile/app/shared/components/pizza_delivery_button.dart';
import 'package:mobile/app/shared/components/pizza_delivery_input.dart';
import 'package:mobile/app/shared/mixins/loader_mixin.dart';
import 'package:mobile/app/shared/mixins/messages_mixin.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatelessWidget {
  static const router = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (context) => LoginController(),
            child: LoginContent(),
          ),
        ),
      ),
    );
  }
}

class LoginContent extends StatefulWidget {
  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> with LoaderMixin, MessagesMixin {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final obscurePasswordValueNotifier = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    final loginController = context.read<LoginController>();
    loginController.addListener(() { 
      showHideLoaderHelper(context, loginController.showLoader);

      if(!isNull(loginController.error)) {
        showError(message: loginController.error, context: context);
      }

      if(loginController.loginSuccess) {
        Navigator.of(context).pushNamedAndRemoveUntil(SplashPage.router, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 250,
        ),
        Container(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  PizzaDeliveryInput(
                    label: 'E-mail',
                    controller: emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (!isEmail(value?.toString() ?? '')) {
                        return 'E-mail inválido!';
                      }
                      return null;
                    },
                  ),
                  ValueListenableBuilder(
                      valueListenable: obscurePasswordValueNotifier,
                      builder: (_, obscurePasswordValueNotifierValue, child) {
                          return PizzaDeliveryInput(
                            label: 'Senha',
                            controller: passwordEditingController,
                            sufixIcon: Icon(FontAwesome.key),
                            sufixIconOnPressed: (){
                              obscurePasswordValueNotifier.value = !obscurePasswordValueNotifierValue;
                            },
                            obscureText: obscurePasswordValueNotifierValue,
                            validator: (value) {
                              if(!isLength(value.toString(), 6)) {
                                return 'A senha deve cointer no minímo 6 caracteres';
                              }
                              return null;
                            },
                          );
                      },
                  ),
                  SizedBox(height: 20),
                  PizzaDeliveryButton(
                    onPressed: () {
                      if(formKey.currentState.validate()) {
                        context.read<LoginController>().login(
                          emailEditingController.text, 
                          passwordEditingController.text
                        );
                      }
                    },
                    labelColor: Colors.white,
                    buttonColor: Theme.of(context).primaryColor,
                    label: 'Login',
                    height: 50,
                    width: MediaQuery.of(context).size.width * .8,
                    labelSize: 18,
                  ),
                  SizedBox(height: 50),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
