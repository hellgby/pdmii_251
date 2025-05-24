import 'dart:io';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

void main() async {
  final myEmail = 'analiviacandido100@gmail.com';
  final password = 'dwkb verl dfcz ibxv'; // senha de app
  final smtpServer = gmail(myEmail, password);

  final List<String> destinatarios = [
    'ana.candido09@aluno.ifce.edu.br',
  
  ];

  for (final email in destinatarios) {
    for (int i = 1; i <= 50; i++) {
      final message = Message()
        ..from = Address(myEmail, 'oi livia')
        ..recipients.add(email)
        ..subject = 'teste $i para $email'
        ..text = 'este é o e-mail número $i enviado para $email.';

      try {
        final sendReport = await send(message, smtpServer);
        print('e-mail $i enviado para $email: ${sendReport.toString()}');
        await Future.delayed(Duration(seconds: 1)); // Evita bloqueios rápidos
      } on MailerException catch (e) {
        print('Erro ao enviar e-mail $i para $email: ${e.toString()}');
        break; // Para de tentar enviar mensagem caso um email dê erro para evitar spam
      }
    }
  }
}