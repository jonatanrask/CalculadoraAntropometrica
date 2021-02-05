import 'package:IMC/primeira_pagina.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: primeiraPagina(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightControler = TextEditingController();
  TextEditingController heightControler = TextEditingController();
  String _infoText = "Informe seus dados!";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    weightControler.text = "";
    heightControler.text = "";
    setState(() {
      _infoText = "Informe seus dados!";

      _formKey = GlobalKey<FormState>();
    });
  }

  void _calcule() {
    setState(() {
      double peso = double.parse(weightControler.text);
      double altura = double.parse(heightControler.text) / 100;
      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _infoText =
            "Seu IMC é igual a ${imc.toStringAsPrecision(4)}, Você está abaixo do peso ideal";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText =
            "Seu IMC é igual a ${imc.toStringAsPrecision(4)}, Você está no peso ideal";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText =
            "Seu IMC é igual a ${imc.toStringAsPrecision(4)}, Você está levemente acima do peso ideal";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText =
            "Seu IMC é igual a ${imc.toStringAsPrecision(4)}, Obesidade grau I";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText =
            "Seu IMC é igual a ${imc.toStringAsPrecision(4)}, Obesidade grau II";
      } else if (imc >= 40) {
        _infoText =
            "Seu IMC é igual a ${imc.toStringAsPrecision(4)}, Obesidade grau III";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.red[900], Colors.redAccent])),
        ),
      ),
      backgroundColor: Color(0xFFE7DDD6),
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.directions_run_outlined,
                size: 120.0,
                color: Colors.red[700],
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red[700]),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: "Peso(kg):",
                    labelStyle: TextStyle(color: Colors.red[700])),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red[700], fontSize: 25.0),
                controller: weightControler,
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red[700]),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: "Altura(cm):",
                    labelStyle: TextStyle(color: Colors.red[700])),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red[700], fontSize: 25.0),
                controller: heightControler,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Container(
                    child: RaisedButton(
                        textColor: Colors.white,
                        padding: EdgeInsets.all(0),
                        shape: StadiumBorder(),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                              colors: [Colors.red[900], Colors.redAccent],
                            ),
                          ),
                          child: Text(
                            'Calcular',
                            style: TextStyle(fontSize: 25.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 15.0),
                        ),
                        onPressed: _calcule),
                  )),
              Text(
                '$_infoText\n\n',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red[700], fontSize: 25.0),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.refresh,
            size: 30,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient:
                  LinearGradient(colors: [Colors.red[900], Colors.redAccent])),
        ),
        onPressed: _resetFields,
      ),
    );
  }
}
