import 'package:flutter/material.dart';
import 'package:proyek_mobile_danielhanselc_123210063/views/homepage.dart';
import 'package:proyek_mobile_danielhanselc_123210063/views/login_page.dart';
import '../services/session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SessionService sessionService = SessionService();
  final bool isLoggedIn = await sessionService.isLoggedIn();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? HomePage() : LoginPage(),
    );
  }
}
