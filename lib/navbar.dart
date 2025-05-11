import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(color: Color.fromARGB(255, 33, 0, 0)),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/");
                    },
                    leading: Icon(
                      Icons.local_pizza,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text(
                      "Cardápio",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/about");
                    },
                    leading: Icon(Icons.home, color: Colors.white, size: 30),
                    title: Text(
                      "Sobre a VinciPizza",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(color: Color.fromARGB(255, 33, 0, 0)),
              child: ListTile(
                onTap: () {
                  SystemNavigator.pop();
                },
                leading: Icon(Icons.exit_to_app, color: Colors.white, size: 30),
                title: Text(
                  "Sair",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
