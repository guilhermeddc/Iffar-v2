import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Politics/Screens/ActionsPage.dart';
import 'package:flutter_app/pages/Politics/Screens/Cheers.dart';
import 'package:flutter_app/pages/Politics/Screens/Inclusion.dart';
import 'package:flutter_app/pages/Politics/Screens/Violence.dart';

class Politics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Políticas"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Saúde",
              ),
              Tab(
                text: "Inclusão",
              ),
              Tab(
                text: "Ações",
              ),
              Tab(
                text: "Anti Violência",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Cheers(),
          Inclusion(),
          ActionsPage(),
          Violence(),
        ]),
      ),
    );
  }
}