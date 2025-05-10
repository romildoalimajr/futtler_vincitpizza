import 'package:flutter/material.dart';

class CardapioScreen extends StatefulWidget {
  const CardapioScreen({super.key});

  @override
  State<CardapioScreen> createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(150, 0, 0, 0),
          title: Center(
            child: Text(
              "Cardápio",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.local_pizza, color: Colors.white)),
              Tab(icon: Icon(Icons.local_drink, color: Colors.white)),
              Tab(icon: Icon(Icons.icecream, color: Colors.white)),
            ],
          ),
        ),

        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                top:
                    MediaQuery.of(context).padding.top +
                    kToolbarHeight +
                    kTextTabBarHeight,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: buildCardapio(),
            ),
            buildCarrinho(),
          ],
        ),
      ),
    );
  }

  Widget buildCardapio() {
    return TabBarView(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              buildCardapioItem(),
              buildCardapioItem(),
              buildCardapioItem(),
              buildCardapioItem(),
              buildCardapioItem(),
              buildCardapioItem(),
              buildCardapioItem(),
              buildCardapioItem(),
              buildCardapioItem(),
              buildCardapioItem(),
            ],
          ),
        ),
        Column(),
        Column(),
      ],
    );
  }

  Widget buildCardapioItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 0, 0, 0),
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 5,
                  bottom: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/cardapio/pizza-margherita.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Placeholder(),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  top: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pizza Margherita",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "Molho de tomate, mussarela, majericão fresco, azeite de oliva.",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  print("Teste botão add!...");
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 45),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCarrinho() {
    return Container(decoration: BoxDecoration(color: Colors.black));
  }
}
