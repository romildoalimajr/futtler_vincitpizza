import 'package:flutter/material.dart';
import 'package:futtler_vincitpizza/screens/about_screen.dart';
import 'package:futtler_vincitpizza/screens/cardapio_screen.dart';
import 'package:futtler_vincitpizza/screens/pedido_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/about",
      routes: {
        "/": (context) => const CardapioScreen(),
        "/pedido": (context) => const PedidoScreen(),
        "/about": (context) => const AboutScreen(),
      },
    );
  }
}
