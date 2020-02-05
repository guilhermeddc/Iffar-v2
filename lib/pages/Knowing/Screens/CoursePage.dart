import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/ItemList.dart';
import 'package:flutter_app/widgets/LinkButton.dart';
import 'package:flutter_app/widgets/SubTitleList.dart';
import 'package:flutter_app/widgets/TitleList.dart';
import 'package:flutter_app/widgets/TitleScreen.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            TitleScreen(
              'Cursos',
              30,
            ),
            TitleList(
                'No campus de São Vicente do Sul, são ofertados os seguintes cursos:'
            ),
            SubTitleList(
                'Ensino médio intregrado'
            ),
            ItemList(
                'Técnico em administração'
            ),
            ItemList(
                'Técnico em agropecuária'
            ),
            ItemList(
                'Técnico em alimentos'
            ),
            ItemList(
                'Técnico em manutenção e suporte em informática'
            ),
            SubTitleList(
                'Subsequentes:'
            ),
            ItemList(
                'Agricultura'
            ),
            ItemList(
                'Alimentos'
            ),
            ItemList(
                'Informática'
            ),
            ItemList(
                'Zootecnia'
            ),
            SubTitleList(
              'Bacharelados:'
            ),
            ItemList(
                'Agronomia'
            ),
            ItemList(
                'Administração'
            ),
            SubTitleList(
                'Tecnologia'
            ),
            ItemList(
                'Análise e desenvolvimento de sistemas'
            ),
            ItemList(
                'Gestão pública'
            ),
            SubTitleList(
              'Licenciaturas:'
            ),
            ItemList(
                'Química'
            ),
            ItemList(
                'Ciências biológicas'
            ),
          ],
        ),
      ),
      floatingActionButton: LinkButton(
        'https://www.iffarroupilha.edu.br/campus-são-vicente-do-sul'
      ),
    );
  }
}
