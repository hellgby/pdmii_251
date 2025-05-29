
import 'dart:convert';
import 'package:provapratica1/classes.dart';
import 'email_sender.dart'; 

void main() async {
  final cliente = Cliente(codigo: 1, nome: 'bolinha', tipoCliente: 1);
  final vendedor = Vendedor(codigo: 1, nome: 'pitty', comissao: 5.0);
  final veiculo = Veiculo(codigo: 101, descricao: 'nisan altima', valor: 35000.0);

  final itens = [
    ItemPedido(sequencial: 1, descricao: 'pneu', quantidade: 1, valor: 1500.0),
    ItemPedido(sequencial: 2, descricao: 'parabrisa', quantidade: 4, valor: 300.0),
  ];

  final pedido = PedidoVenda(
    codigo: 'PV001',
    data: DateTime.now(),
    valorPedido: 0,
    cliente: cliente,
    vendedor: vendedor,
    veiculo: veiculo,
    items: itens,
  );

  final json = const JsonEncoder.withIndent('  ').convert(pedido.toJson());

  print(json);

  await enviarEmail(json);
}