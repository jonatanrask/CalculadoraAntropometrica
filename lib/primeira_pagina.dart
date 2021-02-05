import 'package:IMC/imc_explicacao.dart';
import 'package:flutter/material.dart';
import 'tmb_explicacao.dart';

class primeiraPagina extends StatefulWidget {
  @override
  _primeiraPaginaState createState() => _primeiraPaginaState();
}

class _primeiraPaginaState extends State<primeiraPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadoras Antropométricas"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.purple[900], Colors.purpleAccent])),
        ),
      ),
      backgroundColor: Color(0xFFE7DDD6),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
                      'Calculadora de IMC',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => firstPage()));
                  },
                ),
              ),
            ),
            RaisedButton(
              textColor: Colors.white,
              padding: EdgeInsets.all(0),
              shape: StadiumBorder(),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: [Colors.green[900], Colors.greenAccent],
                  ),
                ),
                child: Text(
                  'Calculadora de TMB',
                  style: TextStyle(fontSize: 25.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => segondPage()));
              },
            ),
          ])),
    );
  }
}
