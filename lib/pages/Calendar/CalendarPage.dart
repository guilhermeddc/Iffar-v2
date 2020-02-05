import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/widgets/LinkButton.dart';
import 'package:flutter_app/widgets/TitleScreen.dart';
import 'package:flutter_app/widgets/TitleList.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calendário Acadêmico'),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: ListView(
            children: <Widget>[
              TitleScreen(
                'Calendário Acadêmico',
                30,
              ),
              Icon(
                Icons.calendar_today,
                size: 200,
                color: Colors.green,
              ),
              TitleList(
                'Calendário acadêmico cursos técnicos integrados ao ensino médio 2019'
              ),
            ],
          ),
        ),
        floatingActionButton: LinkButton(
          'https://www.iffarroupilha.edu.br/calend%C3%A1rio-acad%C3%AAmico?layout=item'
        ),
      ),
    );
  }
}