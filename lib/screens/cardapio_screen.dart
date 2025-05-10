import 'package:flutter/material.dart';

class CardapioScreen extends StatefulWidget {
  const CardapioScreen({super.key});

  @override
  State<CardapioScreen> createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  bool carrinhoVisible = false;

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
            buildCarrinhoFinalizar(),
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
    return Visibility(
      visible: carrinhoVisible,
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: const Color.fromARGB(225, 0, 0, 0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildCarrinhoItem(),
                    buildCarrinhoItem(),
                    buildCarrinhoItem(),
                    buildCarrinhoItem(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(width: 5),
                      ),
                    ),
                    child: FloatingActionButton(
                      onPressed: () {},
                      heroTag: "cardapio.adicionarmaisitens",
                      backgroundColor: Color(0xFF8B0000),
                      child: Text(
                        "Adicionar mais ítens",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(width: 5),
                      ),
                    ),
                    child: FloatingActionButton(
                      onPressed: () {},
                      heroTag: "cardapio.finalizarpedido",
                      backgroundColor: Colors.green,
                      child: Text(
                        "Finalizar Pedido",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCarrinhoItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Pizza Margherita",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Tamanho: FAMÍLIA",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Qtde.: 1",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 30),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Icon(Icons.remove, color: Colors.white, size: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCarrinhoFinalizar() {
    return Visibility(
      visible: !carrinhoVisible,
      child: GestureDetector(
        onTap: () {
          setState(() => carrinhoVisible = true);
        },
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(1),
            ),
          ),
          child: Center(
            child: Text(
              "Finalizar Pedido",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
