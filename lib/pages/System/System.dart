
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/System/Screens/Meals.dart';
import 'package:flutter_app/pages/System/Screens/SIGAA.dart';

import 'Screens/Library.dart';

class System extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sistemas"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Biblioteca",
              ),
              Tab(
                text: "SIGAA",
              ),
              Tab(
                text: "Refeições",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Library(),
          SIGAA(),
          Meals(),
        ]),
      ),
    );
  }
}