import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Program/Screens/Nutritional.dart';
import 'package:flutter_app/pages/Program/Screens/Recreation.dart';
import 'package:flutter_app/pages/Program/Screens/Support.dart';

class ProgramPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Programas"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Nutricional",
              ),
              Tab(
                text: "Apoio",
              ),
              Tab(
                text: "Lazer",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Nutritional(),
          Support(),
          Recreation(),
        ]),
      ),
    );
  }
}
