import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/auth_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/registration.dart';
import 'package:flutter_application_1/pages/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      routes: {
        '/sign_up' : (context) => const Sign_UP(),
        '/home_page' : (context) => const HomePage(),
        '/login_page' : (context) => const LoginPage(),
        '/registration' : (context) => const Registration(),
      },
    );
  } 
}
