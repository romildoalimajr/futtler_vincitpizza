import 'package:flutter/material.dart';

class CardapioScreen extends StatefulWidget {
  const CardapioScreen({super.key});

  @override
  State<CardapioScreen> createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(150, 0, 0, 0),
        title: Center(
          child: Text(
            "Cardápio",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        bottom: const TabBar(
          tabs: [Tab(icon: Icon(Icons.local_pizza, color: Colors.white))],
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: TabBarView(children: [Column()]),
      ),
    );
  }
}
