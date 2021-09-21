import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';

class YourLitViewBuilder extends StatefulWidget {
  int index;
  bool isSwitched;
  List name;


  YourLitViewBuilder({this.index,this.isSwitched, this.name});

  @override
  _YourLitViewBuilderState createState() => _YourLitViewBuilderState();
}

List<String> isadd = [];

class _YourLitViewBuilderState extends State<YourLitViewBuilder> {



  /*bool isSwitched = false;*/
  bool switch1 = false;
  List<String> name = ["jemin", "divyan", "ravi", "viki"];

  setitem() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('counter', isadd);
  print(prefs.getStringList("counter"));
}
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.name[widget.index]),
        Switch(
          value: widget.isSwitched,
          onChanged: (value) {
            setState(() {
              widget.isSwitched = value;
              if(value == true) {
                isadd.add(widget.name[widget.index]);
                List vae = LinkedHashSet<String>.from(isadd).toList();
                print(vae);
              } else {
                isadd.remove(widget.name[widget.index]);
                print(isadd);
                List vae = LinkedHashSet<String>.from(isadd).toList();
                print(vae);
              }
              setitem();
            });
          },
        ),
      ],
    );
  }
}
