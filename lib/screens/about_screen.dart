import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:futtler_vincitpizza/navbar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "about.facebook",
            onPressed: () async {
              String url = "https://www.facebook.com/kalangos.net/";
              await launchUrlString(url);
            },
            backgroundColor: Color(0xff1877f2),
            child: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "about.whatsapp",
            onPressed: () async {
              String url = "https://wa.me/+5581994701058/";
              await launchUrlString(url);
            },
            backgroundColor: Color(0xff25d366),
            child: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
          ),
        ],
      ),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(150, 0, 0, 0),
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
          child: Text(
            "Sobre a VinciPizza",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer: Navbar(),
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight,
        ),
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Expanded(
              flex: 2,
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
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "VinciPizza Pizzaria",
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                    Text(
                      "A pizzaria da Faculdade VINCIT",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Endereço.: Av. João Paulinho Vieira Filho, 870",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      "Primeiro andar, sala 11 a 14 - Centro",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      "Maringá - PR - Brasil",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Container(
                      width: 350,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/maps.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
