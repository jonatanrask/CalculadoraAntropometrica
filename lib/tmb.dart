import 'package:flutter/material.dart';

class tmbPage extends StatefulWidget {
  @override
  _tmbPageState createState() => _tmbPageState();
}

String sexdownValue = 'Homem';
String atividadeValue = 'Sedentário';

class _tmbPageState extends State<tmbPage> {
  TextEditingController weightControler = TextEditingController();
  TextEditingController heightControler = TextEditingController();
  TextEditingController ageControler = TextEditingController();
  String _infoText = "Informe seus dados!";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    ageControler.text = "";
    weightControler.text = "";
    heightControler.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
      sexdownValue = 'Homem';
      atividadeValue = 'Sedentário';
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calcule() {
    setState(() {
      double peso = double.parse(weightControler.text);
      double altura = double.parse(heightControler.text);
      double idade = double.parse(ageControler.text);
      double atividade = 0;
      double sexo = 0;

      if (sexdownValue == 'Homem') {
        sexo = 66;
      } else if (sexdownValue == 'Mulher') {
        sexo = 665;
      }

      if (atividadeValue == 'Sedentário') {
        atividade = 1.2;
      } else if (atividadeValue == 'Levemente ativo') {
        atividade = 1.375;
      } else if (atividadeValue == 'Moderadamente ativo ') {
        atividade = 1.55;
      } else if (atividadeValue == 'Altamente ativo') {
        atividade = 1.725;
      } else if (atividadeValue == 'Extremamente ativo') {
        atividade = 1.9;
      }

      double tmb =
          (sexo + (13.7 * peso) + (5 * (altura * 100)) - (6.8 * idade));

      if (sexdownValue == 'Homem') {
        tmb = (sexo + (13.7 * peso) + (5 * altura) - (6.8 * idade));

        double ndc = atividade * tmb;
        double manter = ndc * atividade;
        double diminui = manter - 450;
        double aumentar = manter + 450;
        _infoText =
            "Seu TMB é igual a ${tmb.toStringAsPrecision(4)}Kcal;\n\n Para manter seu peso você deve consumir ${manter.toStringAsPrecision(4)}Kcal por dia;\n\nPara perder peso você deve consumir ${diminui.toStringAsPrecision(4)}Kcal por dia;\n\nPara ganhar seu peso você deve consumir ${aumentar.toStringAsPrecision(4)}Kcal por dia.";
      } else if (sexdownValue == 'Mulher') {
        tmb = sexo + (9.6 * peso) + (1.8 * altura) - (4.7 * idade);
        double ndc = atividade * tmb;
        double manter = ndc * atividade;
        double diminui = manter - 450;
        double aumentar = manter + 450;
        _infoText =
            "Seu TMB é igual a ${tmb.toStringAsPrecision(4)}Kcal;\n\n Para manter seu peso você deve consumir ${manter.toStringAsPrecision(4)}Kcal por dia;\n\nPara perder peso você deve consumir ${diminui.toStringAsPrecision(4)}Kcal por dia;\n\nPara ganhar seu peso você deve consumir ${aumentar.toStringAsPrecision(4)}Kcal por dia.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de TMB"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.green[900], Colors.greenAccent])),
        ),
      ),
      backgroundColor: Color(0xFFE7DDD6),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.fastfood,
                size: 120.0,
                color: Colors.green,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green[700]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: DropdownButton<String>(
                            hint: Align(alignment: Alignment.centerRight),
                            dropdownColor: Colors.greenAccent[76],
                            value: sexdownValue,
                            icon: Icon(
                              Icons.person,
                              color: Colors.green,
                            ),
                            iconSize: 20,
                            elevation: 0,
                            style: TextStyle(
                                color: Colors.green[700], fontSize: 25),
                            underline: Container(
                              height: 2,
                              width: 10,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                sexdownValue = newValue;
                              });
                            },
                            items: <String>['Homem', 'Mulher']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Container(
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green[700]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: DropdownButton<String>(
                            hint: Align(alignment: Alignment.centerRight),
                            dropdownColor: Colors.deepPurpleAccent[76],
                            value: atividadeValue,
                            icon: Icon(
                              Icons.directions_bike,
                              color: Colors.green,
                            ),
                            iconSize: 30,
                            elevation: 0,
                            style: TextStyle(
                                color: Colors.green[700], fontSize: 25),
                            underline: Container(
                              height: 2,
                              width: 10,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                atividadeValue = newValue;
                              });
                            },
                            items: <String>[
                              'Sedentário',
                              'Levemente ativo',
                              'Moderadamente ativo ',
                              'Altamente ativo',
                              'Extremamente ativo'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )),
                  ]),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green[700]),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: "Idade:",
                    labelStyle: TextStyle(color: Colors.green[700])),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green[700], fontSize: 25.0),
                controller: ageControler,
                validator: (Value) {
                  if (Value.isEmpty) {
                    return "Insira sua idade!!!";
                  }
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green[700]),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: "Peso(kg):",
                    labelStyle: TextStyle(color: Colors.green[700])),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green[700], fontSize: 25.0),
                controller: weightControler,
                validator: (Value) {
                  if (Value.isEmpty) {
                    return "Insira seu peso!!!";
                  }
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green[700]),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: "Altura(cm):",
                    labelStyle: TextStyle(color: Colors.green[700])),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green[700], fontSize: 25.0),
                controller: heightControler,
                validator: (Value) {
                  if (Value.isEmpty) {
                    return "Insira sua altura!!!";
                  }
                },
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
                            colors: [Colors.green[900], Colors.greenAccent],
                          ),
                        ),
                        child: Text(
                          'Calcular',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _calcule();
                        }
                      },
                    ),
                  )),
              Text(
                '$_infoText\n\n',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green[700], fontSize: 25.0),
              )
            ],
          ))),
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
              gradient: LinearGradient(
                  colors: [Colors.green[900], Colors.greenAccent])),
        ),
        onPressed: _resetFields,
      ),
    );
  }
}
