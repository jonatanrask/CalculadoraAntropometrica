import 'package:IMC/tmb.dart';
import 'package:flutter/material.dart';
import 'construtor.dart';

class segondPage extends StatefulWidget {
  @override
  _segondPageState createState() => _segondPageState();
}

class _segondPageState extends State<segondPage> {
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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildCardtmb(titulo1, subtitulo1),
                  buildCardtmb(titulo2, subtitulo2),
                  buildCardtmb(titulo3, subtitulo3),
                  buildCardtmb(titulo4, subtitulo4),
                ])),
        floatingActionButton: FloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.arrow_forward,
              size: 30,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Colors.green[900], Colors.greenAccent])),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => tmbPage()));
          },
        ));
  }

  String titulo1 = 'O que é TMB?';
  String subtitulo1 =
      '\nA taxa metabólica basal é a quantidade de energia por unidade de tempo que uma pessoa precisa para manter o corpo funcionando em repouso. Alguns desses processos são respiração, circulação sanguínea, controle da temperatura corporal, crescimento celular, função cerebral e nervosa e contração dos músculos.\n\n';
  String titulo2 = 'A equação de Harris-Benedict';
  String subtitulo2 =
      '\n\nPara obter o cálculo estimado do valor da taxa de metabolismo basal é preciso utilizar uma fórmula que leva em consideração fatores como idade, peso, altura e sexo. Um homem é preciso seguir a seguinte equação: 66 + (13,7 x Peso) + (5,0 x Altura em cm) – (6,8 x Idade) + (Tempo x Calorias por minuto). Já para saber a quantidade de calorias referentes a uma mulher, a fórmula que deve ser aplicada é um pouco diferente: 665 + (9,6 x Peso) + (1,8 x Altura em cm) – (4,7 x Idade) + (Tempo x Calorias por minuto).\n\n';
  String titulo3 = 'Taxa de atividadel';
  String subtitulo3 =
      '\nSedentário = pouco ou nenhum exercício;\n\n Levemente ativo = exercício leve 1 a 3 dias por semana;\n\nModeradamente ativo = exercício moderado, faz esportes 3 a 5 dias por semana;\n\nAltamente ativo = exercício pesado de 5 a 6 dias por semana;\n\nExtremamente ativo = exercício pesado diariamente e até 2 vezes por dia.\n\n';
  String titulo4 = 'Considerações médicas';
  String subtitulo4 =
      '\n\nO metabolismo de uma pessoa varia com sua condição física e atividade. O treinamento com pesos pode ter um impacto mais longo no metabolismo do que o treinamento aeróbico , mas não existem fórmulas matemáticas conhecidas que possam prever exatamente a extensão e a duração de um metabolismo elevado a partir de mudanças tróficas com o treinamento neuromuscular anabólico.\n\n';
}
