import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

Future<void> enviarEmail(String conteudoJson) async {
  final smtpServer = gmail('ana.candido09@aluno.ifce.edu.br', 'mggx nbxh firb nmjj');

  final message = Message()
    ..from = Address('ana.candido09@aluno.ifce.edu.br', 'ana livia')
    ..recipients.add('taveira@ifce.edu.br')
    ..subject = 'prova prática 1'
    ..text = 'json do pedido:\n\n$conteudoJson';

  try {
    final sendReport = await send(message, smtpServer);
    print('e-mail enviado com sucesso: $sendReport');
  } on MailerException catch (e) {
    print('erro ao enviar e-mail: ${e.toString()}');
  }
}
