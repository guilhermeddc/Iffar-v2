import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/About/About.dart';
import 'package:flutter_app/pages/Calendar/CalendarPage.dart';
import 'package:flutter_app/pages/Knowing/KnowingPage.dart';
import 'package:flutter_app/pages/Politics/Politics.dart';
import 'package:flutter_app/pages/Program/ProgramPage.dart';
import 'package:flutter_app/pages/ProgramDPE/ProgramDPE.dart';
import 'package:flutter_app/pages/Records/Records.dart';
import 'package:flutter_app/pages/Regulation/Regulation.dart';
import 'package:flutter_app/pages/System/System.dart';
import 'package:flutter_app/widgets/DrawerIffar.dart';
import 'package:flutter_app/widgets/IntroButton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app/widgets/TitleScreen.dart';
import 'package:flutter_app/pages/UsefulLinks/UsefulLinks.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('CAE na rede'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.thumbs_up_down),
            onPressed: () async {
              var url = "https://forms.gle/czvbhu3RZYHty1Zk8";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
      drawer: DrawerIffar(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              right: size.width / 10,
              left: size.width / 10,
              top: size.height / 20,
            ),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IntroButton(
                        Colors.red,
                        Icons.home,
                        'Conhecendo IFFar',
                        100,
                        KnowingPage(),
                      ),
                      IntroButton(
                        Colors.green,
                        Icons.assignment_turned_in,
                        'Programas',
                        10,
                        ProgramPage(),
                      ),
                      IntroButton(
                        Colors.green,
                        Icons.border_color,
                        "Regulamentos",
                        10,
                        Regulation(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IntroButton(
                        Colors.green,
                        Icons.fingerprint,
                        "Políticas",
                        10,
                        Politics(),
                      ),
                      IntroButton(
                        Colors.green,
                        Icons.calendar_today,
                        "Calendário Acadêmico",
                        10,
                        CalendarPage(),
                      ),
                      Container(
                        height: size.height / 7.5,
                        width: size.width / 4.5,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IntroButton(
                        Colors.green,
                        Icons.group_add,
                        "Permanência e Êxito",
                        10,
                        ProgramDPE(),
                      ),
                      IntroButton(
                        Colors.green,
                        Icons.play_arrow,
                        "Sistemas",
                        10,
                        System(),
                      ),
                      IntroButton(
                        Colors.green,
                        Icons.school,
                        "Registro Acadêmico",
                        10,
                        Records(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IntroButton(
                        Colors.green,
                        Icons.link,
                        "Editais",
                        10,
                        UsefulLinks(),
                      ),
                      IntroButton(
                        Colors.green,
                        Icons.language,
                        "Sobre",
                        10,
                        About(),
                      ),
                      Container(
                        height: size.height / 7.5,
                        width: size.width / 4.5,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  TitleScreen(
                    "INSTITUTO FEDERAL Farroupilha",
                    size.width / 11.9,
                    cor: Colors.black,
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Container(
                    width: 500,
                    height: 2,
                    color: Colors.green,
                  ),
                  TitleScreen(
                    "Sao Vicente do Sul",
                    size.width / 11,
                    cor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
