import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class ButtonsPanel extends StatefulWidget {
  ButtonsPanel({Key key}) : super(key: key);

  @override
  _ButtonsPanelState createState() => _ButtonsPanelState();
}

class _ButtonsPanelState extends State<ButtonsPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        children: <Widget>[
          new Container(
              child: new IconButton(
                  icon: new Image.asset("assets/icons/statistics.png"),
                  iconSize: 48,
                  onPressed: null)),
          new Container(
            child: new IconButton(
                icon: new Image.asset("assets/icons/waterstatistic.png"),
                iconSize: 48,
                onPressed: null),
            padding: EdgeInsets.only(bottom: 15),
          ),
          new Container(
            child: FocusedMenuHolder(
                child: new Image.asset("assets/icons/add.png"),
                blurSize: 5.0,
                onPressed: () {
                  print("I was pressed");
                },
                menuItems: <FocusedMenuItem>[
                  FocusedMenuItem(
                    title: new Text('Tea'),
                    onPressed: () {},
                  ),
                  FocusedMenuItem(
                    title: new Text('Coffee'),
                    onPressed: () {},
                  ),
                  FocusedMenuItem(
                    title: new Text('Water'),
                    onPressed: () {},
                  )
                ]),
            padding: EdgeInsets.only(bottom: 30),
          ),
          new Container(
            child: new IconButton(
                icon: new Image.asset("assets/icons/settings.png"),
                iconSize: 48,
                onPressed: null),
            padding: EdgeInsets.only(bottom: 15),
          ),
          new Container(
              child: new IconButton(
                  icon: new Image.asset("assets/icons/question.png"),
                  iconSize: 48,
                  onPressed: null)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
