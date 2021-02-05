import 'package:flutter/material.dart';

buildCardtmb(String titulo, String subtitulo) {
  return Card(
      color: Color(0xFF3700B3),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      shadowColor: Colors.grey,
      elevation: 8,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.white,
              ),
              title: Text(
                titulo,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              subtitle: Text(subtitulo,
                  style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.green[900], Colors.greenAccent])),
      ));
}
buildCardimc(String titulo, String subtitulo) {
  return Card(
      color: Color(0xFF3700B3),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      shadowColor: Colors.grey,
      elevation: 8,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.white,
              ),
              title: Text(
                titulo,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              subtitle: Text(subtitulo,
                  style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.red[900], Colors.redAccent])),
      ));
}