import 'package:futtler_vincitpizza/models/pedido_item.dart';

class Pedido {
  List<PedidoItem>? items;
  String? enderecoCEP;
  String? enderecoLogradouro;
  String? enderecoNumero;
  String? enderecoBairro;

  Pedido({
    this.items,
    this.enderecoCEP,
    this.enderecoLogradouro,
    this.enderecoNumero,
    this.enderecoBairro,
  });
}
