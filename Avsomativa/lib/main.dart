import 'Home.dart';
import 'package:avsomativa/telaimc.dart';
import 'package:flutter/material.dart';
import 'cadastroprodutos.dart';
import 'cadastrousuario.dart';
import 'contador.dart';

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
      title: 'somativa',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/seg': (context) => const telaimc(),
        '/ter': (context) => const contador(),
        '/quar': (context) => const cadastrousuario(),
        '/qui': (context) => const cadastroprodutos(),
      },
    );
  }
}
