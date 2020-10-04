import 'package:flutter/material.dart';
import 'package:mobile/app/modules/auth/view/login_page.dart';
import 'package:mobile/app/modules/home/home_page.dart';
import 'package:mobile/app/modules/splash/view/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0XFF9D0000),
        primarySwatch: Colors.red
      ),
      initialRoute: SplashPage.router,
      routes: {
        SplashPage.router: (_) => SplashPage(),
        LoginPage.router: (_) => LoginPage(),
        HomePage.router: (_) => HomePage()
      },
    );
  }
}
