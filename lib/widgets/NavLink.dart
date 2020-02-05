import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as prefix0;

class NavLink extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String subTitle;
  final Widget route;

  NavLink(
      this.context,
      this.title,
      this.subTitle,
      this.route,
      );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Icon(
        Icons.arrow_forward,
        color: Colors.green,
      ),
      dense: true,
      onTap: () {
        prefix0.Navigator.pop(context);
        prefix0.Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return route;
            },
          ),
        );
      },
    );
  }
}