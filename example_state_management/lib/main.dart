import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1. O ChangeNotifierProvider é o "Contêiner" que disponibiliza os dados.
    // Usamos 'create' (padrão atual) para instanciar nossa classe de estado.
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(), // Este widget vai ler o dado do Provider
          ),
          body: Level1(), // Inicia a árvore de widgets
        ),
      ),
    );
  }
}




class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Aqui o listen é TRUE (padrão).
    // Sempre que notifyListeners() for chamado, este Text será reconstruído.
    return Text(
      Provider.of<Data>(context, listen: false).data,
      style: TextStyle(fontSize: 20),
    );
  }
}


class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context, listen: false).data);
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        Provider.of<Data>(context, listen: false).changeString(newText);
      },
    );
  }
}


class Data extends ChangeNotifier {
  String data = 'Some data';

  void changeString(String newString) {
    data = newString;
    // O segredo está aqui: avisa a todos os widgets que estão "ouvindo"
    // para se redesenharem com o novo valor.
    notifyListeners();
  }
}