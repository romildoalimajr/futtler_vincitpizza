import 'package:flutter/material.dart';
import 'package:futtler_vincitpizza/models/pedido.dart';
import 'package:futtler_vincitpizza/models/pedido_item.dart';
import 'package:futtler_vincitpizza/models/produto.dart';
import 'package:futtler_vincitpizza/models/produto_tamanho.dart';
import 'package:futtler_vincitpizza/navbar.dart';
import 'package:futtler_vincitpizza/screens/pedido_screen.dart';
import 'package:intl/intl.dart';

class CardapioScreen extends StatefulWidget {
  const CardapioScreen({super.key});

  @override
  State<CardapioScreen> createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  bool carrinhoVisible = false;
  Pedido pedido = Pedido(items: []);
  final format = NumberFormat("#,##0.00", "pt_BR");
  final List<Produto> produtos = [
    Produto(
      id: 1,
      descricao: "Pizza Margherita",
      ingredientes: "Farinha de trigo, óleo...",
      categoria: "pizza",
      imagem: "pizza-margherita.jpg",
      tamanhos: [
        ProdutoTamanho(descricao: "PEQUENA", valor: 15.00),
        ProdutoTamanho(descricao: "MÉDIA", valor: 25.00),
        ProdutoTamanho(descricao: "GRANDE", valor: 40.00),
      ],
    ),
    Produto(
      id: 2,
      descricao: "Pizza Quatro Queijos",
      ingredientes: "Farinha de trigo, óleo...",
      categoria: "pizza",
      imagem: "pizza-quatro-queijos.jpg",
      tamanhos: [
        ProdutoTamanho(descricao: "PEQUENA", valor: 15.00),
        ProdutoTamanho(descricao: "MÉDIA", valor: 25.00),
        ProdutoTamanho(descricao: "GRANDE", valor: 40.00),
      ],
    ),
    Produto(
      id: 3,
      descricao: "Pizza Frango com Catupiry",
      ingredientes: "Farinha de trigo, óleo...",
      categoria: "pizza",
      imagem: "pizza-frango-catupiry.jpg",
      tamanhos: [
        ProdutoTamanho(descricao: "PEQUENA", valor: 15.00),
        ProdutoTamanho(descricao: "MÉDIA", valor: 25.00),
        ProdutoTamanho(descricao: "GRANDE", valor: 40.00),
      ],
    ),
    Produto(
      id: 4,
      descricao: "Refrigerante Coca-Cola",
      ingredientes: "Saboroso e Refrescante sabor cola.",
      categoria: "bebida",
      imagem: "bebida-coca-cola.jpg",
      tamanhos: [
        ProdutoTamanho(descricao: "600ml", valor: 5.90),
        ProdutoTamanho(descricao: "MÉDIA", valor: 25.00),
        ProdutoTamanho(descricao: "GRANDE", valor: 40.00),
      ],
    ),
    Produto(
      id: 5,
      descricao: "Sorvete Napolitano",
      ingredientes: "Sobremesa de Sorvete tipo napolitano.",
      categoria: "sobremesa",
      imagem: "sobremesa-sorvete-napolitano.jpg",
      tamanhos: [
        ProdutoTamanho(descricao: "600ml", valor: 5.90),
        ProdutoTamanho(descricao: "MÉDIA", valor: 25.00),
        ProdutoTamanho(descricao: "GRANDE", valor: 40.00),
      ],
    ),
    Produto(
      id: 6,
      descricao: "Torta Mesclada",
      ingredientes: "Sobremesa de Torta mesclada.",
      categoria: "sobremesa",
      imagem: "sobremesa-torta-mesclada.jpg",
      tamanhos: [
        ProdutoTamanho(descricao: "600ml", valor: 5.90),
        ProdutoTamanho(descricao: "MÉDIA", valor: 25.00),
        ProdutoTamanho(descricao: "GRANDE", valor: 40.00),
      ],
    ),
    Produto(
      id: 7,
      descricao: "Água Mineral",
      ingredientes: "Água mineral das melhores fontes.",
      categoria: "bebida",
      imagem: "bebida-agua-mineral.jpg",
      tamanhos: [
        ProdutoTamanho(descricao: "600ml", valor: 5.90),
        ProdutoTamanho(descricao: "MÉDIA", valor: 25.00),
        ProdutoTamanho(descricao: "GRANDE", valor: 40.00),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: Navbar(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(150, 0, 0, 0),
          iconTheme: IconThemeData(color: Colors.white),
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
            children:
                produtos
                    .where((produto) => produto.categoria == "pizza")
                    .map((produto) => buildCardapioItem(produto))
                    .toList(),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children:
                produtos
                    .where((produto) => produto.categoria == "bebida")
                    .map((produto) => buildCardapioItem(produto))
                    .toList(),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children:
                produtos
                    .where((produto) => produto.categoria == "sobremesa")
                    .map((produto) => buildCardapioItem(produto))
                    .toList(),
          ),
        ),
      ],
    );
  }

  Widget buildCardapioItem(Produto produto) {
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
                        "assets/images/cardapio/${produto.imagem}",
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
                      produto.descricao!,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      produto.ingredientes!,
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
                  var result = retornarTamanho(context, produto);

                  result.then((tamanho) {
                    if (tamanho != null) {
                      var pedidoItem = PedidoItem(
                        produto: produto,
                        produtoTamanho: tamanho,
                        quantidade: 1,
                        total: tamanho.valor,
                      );

                      setState(() => pedido.items!.add(pedidoItem));
                    }
                  });
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
      visible: pedido.items!.isNotEmpty && carrinhoVisible,
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
                  children:
                      pedido.items!
                          .map((produtoItem) => buildCarrinhoItem(produtoItem))
                          .toList(),
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
                      onPressed: () {
                        setState(() => carrinhoVisible = false);
                      },
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PedidoScreen(),
                            settings: RouteSettings(arguments: pedido),
                          ),
                        );
                      },
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

  Widget buildCarrinhoItem(PedidoItem item) {
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
                          item.produto!.descricao!,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            item.produtoTamanho!.descricao!,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Qtde.: ${item.quantidade}",
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
                onTap: () {
                  setState(() {
                    int qtde = item.quantidade! + 1;
                    double valor = item.produtoTamanho!.valor!;
                    double total = qtde * valor;

                    item.quantidade = qtde;
                    item.total = total;
                  });
                },
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
                onTap: () {
                  setState(() {
                    int qtde = item.quantidade! - 1;

                    if (qtde > 0) {
                      double valor = item.produtoTamanho!.valor!;
                      double total = qtde * valor;

                      item.quantidade = qtde;
                      item.total = total;
                    } else {
                      pedido.items!.remove(item);
                    }

                    if (pedido.items!.isEmpty) {
                      carrinhoVisible = false;
                    }
                  });
                },
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
      visible: pedido.items!.isNotEmpty && !carrinhoVisible,
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

  Future<ProdutoTamanho> retornarTamanho(
    BuildContext context,
    Produto produto,
  ) async {
    List<ProdutoTamanho> tamanhos = produto.tamanhos!;
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(225, 0, 0, 0),
          title: Text(
            produto.descricao!,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Escolha um tamanho",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions:
              tamanhos.map((tamanho) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                    width: double.infinity,
                    child: FloatingActionButton(
                      heroTag: "cardapio.tamanho.${tamanho.descricao}",
                      child: Text(
                        "${tamanho.descricao} (R\$ ${format.format(tamanho.valor)})",
                      ),
                      onPressed: () => Navigator.of(context).pop(tamanho),
                    ),
                  ),
                );
              }).toList(),
        );
      },
    );
  }
}
