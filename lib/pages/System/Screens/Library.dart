import 'package:flutter_app/widgets/ItemList.dart';
import 'package:flutter_app/widgets/LinkButton.dart';
import 'package:flutter_app/widgets/TitleList.dart';
import 'package:flutter_app/widgets/TitleScreen.dart';
import 'package:flutter/material.dart';

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            TitleScreen("Biblioteca – Pergamum", 30),
            TitleList("HORÁRIO DE ATENDIMENTO"),
            ItemList("Câmpus Alegrete 08:10 às 22:40 - biblioteca.al@iffarroupilha.edu.br"),
            ItemList("Campus Jaguari 08:00 às 12:00 - 13:00 às 17:00 - 19:00 às 23:00"),
            ItemList("Câmpus Júlio de Castilhos 07:45 às 22:45"),
            ItemList("Câmpus Panambi 07:30 às 22:30"),
            ItemList("Câmpus Santa Rosa 07:40 às 22:20"),
            ItemList("Câmpus São Borja 08:00 às 22:30"),
            ItemList("Campus Santo Augusto 08:00 às 22:15"),
            ItemList("Câmpus São Vicente do Sul 07:45 às 22:00 - biblioteca.svs@iffarroupilha.edu.br"),
            ItemList("Campus Santo Ângelo 7:45 às 11:45 - 13:00 às 17:00 - 18:00 às 22:00"),
            ItemList("Campus Avançado Uruguaiana 9:30 às 21:30"),
            ItemList("Câmpus Frederico Westphalen 08:30 às 21:00"),
          ],
        ),
        floatingActionButton: LinkButton("http://biblioteca.iffarroupilha.edu.br/pergamum/biblioteca/index.php"),
      ),
    );
  }
}
