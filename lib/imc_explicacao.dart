import 'package:flutter/material.dart';
import 'main.dart';
import 'construtor.dart';


class firstPage extends StatelessWidget {
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildCardimc(titulo1, subtitulo1),
                  buildCardimc(titulo2, subtitulo2),
                  buildCardimc(titulo3, subtitulo3),
                  buildCardimc(titulo4, subtitulo4),
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
                    colors: [Colors.redAccent, Colors.red[900]])),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home()));
          },
        ));
  }

  String titulo1 = 'O que é IMC?';
  String subtitulo1 =
      '\nO índice de massa corporal (IMC) é uma medida internacional usada para calcular se uma pessoa está no peso ideal. Desenvolvido pelo polímata Lambert Quételet no fim do século XIX, trata-se de um método fácil e rápido para a avaliação do nível de gordura de cada pessoa, sendo, por isso, um preditor internacional de obesidade adotado pela Organização Mundial da Saúde (OMS)..\n';
  String titulo2 = 'Como é calculado?';
  String subtitulo2 =
      '\nO IMC é determinado pela divisão da massa do indivíduo pelo quadrado de sua altura, em que a massa está em quilogramas e a altura em metros.\n';
  String titulo3 = 'Índice considerado ideal';
  String subtitulo3 =
      '\nPara adultos, um IMC entre 20 e 22 indica a quantidade ideal, saudável de gordura corporal, o que está associado com maior tempo de vida e menor incidência de doenças graves. Coincidentemente, essa relação é o que muitas pessoas consideram ser o mais esteticamente atraente. Entretanto, é importante ressaltar que um índice entre 22 e 25 também é considerado um intervalo bastante aceitável, pois está igualmente associado à boa saúde.';
  String titulo4 = 'Limitações do IMC';
  String subtitulo4 =
      '\nHá alguns problemas em usar o IMC para determinar se uma pessoa está acima do peso. Por exemplo, pessoas musculosas podem ter um Índice de Massa Corporal alto e não serem gordas. O IMC também não é aplicável para crianças, sendo que precisa de gráficos específicos. Além disso, não é aplicável para idosos, para os quais se aplica classificação diferenciada. O IMC é o valor de massa corporal, que as diferenças raciais e étnicas têm sobre o Índice de Massa Corporal. Por exemplo, um grupo de assessoramento à Organização Mundial de Saúde concluiu que pessoas de origem asiática poderiam ser consideradas acima do peso com um IMC de apenas 25.\n\n\n';
}


