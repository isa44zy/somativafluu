import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const cadastroprodutos(),
    );
  }
}

class cadastroprodutos extends StatefulWidget {
  const cadastroprodutos({super.key});

  @override
  State<cadastroprodutos> createState() => _cadastroprodutosState();
}

class _cadastroprodutosState extends State<cadastroprodutos> {
  TextEditingController usuarioController = new TextEditingController();
  TextEditingController produtoController = new TextEditingController();
  String _textoInfo = "informe os seus dados";

  void _limpar_Tela() {
    usuarioController.text = "";
    produtoController.text = "";
    setState(() {
      _textoInfo = "Informe seus dados";
    });
  }

  void _cadastrar() {
    setState(() {
      String usuario = usuarioController.text;
      String senha = produtoController.text;
      if (usuario.isEmpty || senha.isEmpty) {
        _textoInfo = "Dados incorretos";
      } else {
        _textoInfo = "Compra efetuada com sucesso";
        _limpar_Tela();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cadastro"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(onPressed: _limpar_Tela, icon: Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.person_outline,
              size: 120.0,
              color: Colors.deepPurple,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "usuário",
                  labelStyle: TextStyle(color: Colors.deepPurple)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: usuarioController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "produto",
                  labelStyle: TextStyle(color: Colors.deepPurple)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: produtoController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _cadastrar,
                  child: const Text("pagar"),
                ),
              ),
            ),
            Text(_textoInfo,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
