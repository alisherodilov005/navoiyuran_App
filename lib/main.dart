import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:test/pages/frontend/MainPage.dart';
import 'package:test/pages/frontend/qrCodeScanner.dart';
import 'package:test/pages/languageChoose.dart';
import 'package:test/pages/login.dart';
import 'package:test/pages/passwordPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    isLogin();
    super.initState();
  }

  bool isAuth = false;
  Future<void> isLogin() async {
    // ignore: unused_local_variable
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (localStorage.getString("token") != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isAuth ? 'password_page' : 'login_screen',
      routes: {
        'lang_scren': (context) => LanguagePage(),
        'login_screen': (context) => LoginPage(),
        'home_screen': (context) => LeadingPage(),
        'password_page': (context) => PasswordPage(),
        'qr_code': (context) => QRViewExample(),
      },
    );
  }
}
