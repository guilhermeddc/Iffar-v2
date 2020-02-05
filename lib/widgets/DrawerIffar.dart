import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Calendar/CalendarPage.dart';
import 'package:flutter_app/pages/Knowing/KnowingPage.dart';
import 'package:flutter_app/pages/Politics/Politics.dart';
import 'package:flutter_app/pages/Program/ProgramPage.dart';
import 'package:flutter_app/pages/ProgramDPE/ProgramDPE.dart';
import 'package:flutter_app/pages/Records/Records.dart';
import 'package:flutter_app/pages/Regulation/Regulation.dart';
import 'package:flutter_app/pages/System/System.dart';
import 'package:flutter_app/widgets/NavLink.dart';

class DrawerIffar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset('assets/images/marca_svs_l.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.white54,
              ),
            ),
            NavLink(
              context,
              "Conhecendo o IFFar",
              "Historia, Cursos e Organograma",
              KnowingPage(),
            ),
            ListTile(
              title: Text("Políticas de Assistência estudantil"),
              subtitle: Text("Regulamentos, Programas e Políticas"),
//              trailing: Icon(
//                Icons.arrow_downward,
//                color: Colors.green,
//              ),
            ),
            NavLink(
              context,
              "Regulamentos",
              "Auxílios, moradia, convivência e concessão",
              Regulation(),
            ),
            NavLink(
              context,
              "Programas",
              "Nutricional, Apoio e Lazer",
              ProgramPage(),
            ),
            NavLink(
              context,
              "Políticas",
              "Saúde, inclusão, ações e contra violência",
              Politics(),
            ),
            NavLink(
              context,
              "Calendário Acadêmico",
              "Calendários letivos",
              CalendarPage(),
            ),
            NavLink(
              context,
              "Programa de Permanência e Êxito",
              "Quadro de ações",
              ProgramDPE(),
            ),
            NavLink(
              context,
              "Sistemas",
              "Biblioteca, atividades e cardápio",
              System(),
            ),
            NavLink(
              context,
              "Setor de Registros Acadêmicos",
              "Link de acesso aos documentos",
              Records(),
            ),
          ],
        ),
      ),
    );
  }
}