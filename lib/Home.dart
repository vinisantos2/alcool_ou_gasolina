import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'componetes/Interface.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "Resultado";
  bool checkbox = false;

  checkBox(bool valor) {
    setState(() {
      checkbox = valor;
    });
  }

  _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);
    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número invalido digite um valo acima de 0 e utilize (.)";
      });
    } else {
      if (precoAlcool / precoGasolina >= 0.7) {
        setState(() {
          _textoResultado = "melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "melhor abastecer com alcool";
        });
      }
      _limpavalores();
    }
  }

  void _limpavalores() {
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Interface.appBar("Alcool ou gasolina"),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("imagens/logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Interface.text(
                  "Saiba qual a melhor opção para abastecimento"),
            ),
            Interface.textField("Preço alcool EX 1.99", _controllerAlcool),
            Interface.textField("Preço alcool EX 1.99", _controllerGasolina),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Interface.botao("calcular", _calcular)),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Interface.text(_textoResultado),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: CheckboxListTile(
                    value: checkbox,
                    title: Interface.text("titulo"),
                    onChanged: (bool b) {
                      setState(() {
                        checkbox = b;
                      });
                    }
                    )
            ),
          ],
        ),
      )),
    );
  }
}
