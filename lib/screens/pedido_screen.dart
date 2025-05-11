import 'package:flutter/material.dart';
import 'package:futtler_vincitpizza/models/pedido.dart';
import 'package:futtler_vincitpizza/models/pedido_item.dart';
import 'package:futtler_vincitpizza/navbar.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PedidoScreen extends StatefulWidget {
  const PedidoScreen({super.key});

  @override
  State<PedidoScreen> createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> {
  Pedido? pedido;
  final cepController = TextEditingController();
  final logradouroController = TextEditingController();
  final numeroController = TextEditingController();
  final bairroController = TextEditingController();

  final format = NumberFormat("#,##0.00", "pt_BR");

  @override
  Widget build(BuildContext context) {
    pedido = ModalRoute.of(context)!.settings.arguments as Pedido;

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Navbar(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(150, 0, 0, 0),
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
          child: Text(
            "Pedido",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(flex: 6, child: buildPedido()),
              Expanded(flex: 4, child: buildPedidoEndereco()),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: FloatingActionButton(
                    heroTag: "pedido.enviar",
                    onPressed: () {
                      enviarPedidoWhatsapp();
                    },
                    backgroundColor: Colors.green,
                    child: Text(
                      "Enviar Pedido",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPedido() {
    double total =
        pedido!.items!.map((item) => item.total).reduce((a, b) => a! + b!)!;

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(200, 0, 0, 0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Itens do Pedido",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children:
                      pedido!.items!
                          .map((item) => buildPedidoItem(item))
                          .toList(),
                ),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  child: Text(
                    "R\$ ${format.format(total)}",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPedidoItem(PedidoItem item) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/cardapio/${item.produto!.imagem}",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "${item.produto!.descricao}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${item.produto!.tamanhos}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${item.quantidade}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  "R\$ ${format.format(item.total)}",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPedidoEndereco() {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(200, 0, 0, 0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Endereço para Entrega",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: cepController,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    decoration: InputDecoration(
                      label: Text(
                        "CEP",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: logradouroController,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    decoration: InputDecoration(
                      label: Text(
                        "Logradouro",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: numeroController,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    decoration: InputDecoration(
                      label: Text(
                        "Número",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: bairroController,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    decoration: InputDecoration(
                      label: Text(
                        "Bairro",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future enviarPedidoWhatsapp() async {
    String url = "https://wa.me/+5581994701058/?text=";
    String dadosPedido = "---------- NOVO PEDIDO ----------\n";

    pedido!.items!.forEach((item) {
      dadosPedido +=
          " - ${item.quantidade}: ${item.produto!.descricao} - R\$ ${format.format(item.total)}";
    });

    pedido!.enderecoCEP = cepController.text;
    pedido!.enderecoLogradouro = logradouroController.text;
    pedido!.enderecoNumero = numeroController.text;
    pedido!.enderecoBairro = bairroController.text;

    dadosPedido += "\n\nEndereço: \n";
    dadosPedido += "Logradouro: ${pedido!.enderecoLogradouro} \n";
    dadosPedido += "Número: ${pedido!.enderecoNumero} \n";
    dadosPedido += "Bairro: ${pedido!.enderecoBairro} \n";

    url += dadosPedido;

    await launchUrlString(url);
  }
}
