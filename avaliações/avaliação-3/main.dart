import 'dart:io';
import 'dart:async';
import 'dart:isolate';

void main() async {
  print('Isolates example - Ana Lívia');

  final receivePort = ReceivePort();
  await Isolate.spawn(doAsyncOperation, receivePort.sendPort);

  print('Fazendo outras tarefas...');
  await Future.delayed(Duration(seconds: 1));
  print('Ainda trabalhando...');

  final result = await receivePort.first;
  print('Resultado: $result');
}

void doAsyncOperation(SendPort sendPort) async {
  final result = await File('./aloha.txt').readAsString();
  sendPort.send(result);
}
