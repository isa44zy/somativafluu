import 'dart:math';
import 'package:flutter/material.dart';
import 'contador.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const telaimc(),
    );
  }
}

class telaimc extends StatefulWidget {
  const telaimc({super.key});

  @override
  State<telaimc> createState() => _telaimcState();
}

class _telaimcState extends State<telaimc> {
  TextEditingController pesoController = new TextEditingController();
  TextEditingController alturaController = new TextEditingController();
  String _textoInfo = "informe os seus dados";

  void _limpar_Tela(){
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _textoInfo = "Informe seus dados";
    });
  }
  void _calcular_Imc(){
    setState((){
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      double imc = peso/pow((altura/100),2);

      if (imc < 16.5){
        _textoInfo = "Desnutrido (${imc})";
      }
      else if (imc <=20.5){
        _textoInfo = "Abaixo do peso (${imc})";
      }
      else if (imc <= 50.5){
        _textoInfo = "Peso ideal (${imc})";
      }
      else if (imc <= 80.9){
        _textoInfo = "Sobre peso (${imc})";
      }
      else if (imc <= 110.0){
        _textoInfo = "Obesidade grau 1 (${imc})";
      }
      else if (imc <= 150.5){
        _textoInfo = "Obesidade indo de base (${imc})";
      }
      else if (imc <= 200.0){
        _textoInfo = "Como voce ta vivo ainda? (${imc})";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
              onPressed: _limpar_Tela,
              icon: Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(Icons.person_outline,
              size: 120.0,
              color: Colors.deepPurple,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "PESO (KG)",
                  labelStyle: TextStyle(color: Colors.deepPurple)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: pesoController,
            ),
            //segundo Input para a altura
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "ALTURA (CM)",
                  labelStyle: TextStyle(color: Colors.deepPurple)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: alturaController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                    onPressed: _calcular_Imc,
                    child: const Text ("Calcular")
                ),
              ),
            ),
            Text (
                _textoInfo,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25.0
                )
            )

          ],
        ),
      ),
    );
  }
}