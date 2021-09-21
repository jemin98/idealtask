import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'globle.dart';

class total extends StatefulWidget {
  int totalspent;
  String spentBy;

  total({this.totalspent, this.spentBy});

  @override
  _totalState createState() => _totalState();
}

class _totalState extends State<total> {
  List member = [];
  int count;
  double spent;
  double jemin;
  double viki;
  double divyan;
  double ravi;
  bool isLoding = false;

  var jeminjson;


  @override
  void initState() {
    super.initState();
    getitem();
  }

  getitem() async {
    setState(() {
      isLoding = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();

      jeminjson = json.encode(jemintotal);
      print(jemintotal);


    await prefs.setString("jeminjson", jeminjson);
    member = await prefs.getStringList('counter');
    jemin = prefs.getDouble("jeminsp");
    ravi = prefs.getDouble("ravisp");
    viki = prefs.getDouble("vikisp");
    divyan = prefs.getDouble("divyansp");

    print("...................member......................");
    print(member);
    count = member.length;
    spent = (widget.totalspent / count).toDouble();
    print("..............spent.................");
    print(spent);
    setrate();

    if (member.any((item) => item == "jemin")) {
      print("jemin");
      await prefs.setDouble("jeminsp", prefs.getDouble("jeminsp") + spent);

      jemin = prefs.getDouble("jeminsp");
      print(prefs.getDouble("jeminsp"));
    }
    if (member.any((item) => item == "divyan")) {
      print("divyan");
      await prefs.setDouble("divyansp", prefs.getDouble("divyansp") + spent);
      divyan = prefs.getDouble("divyansp");

      print(prefs.getDouble("divyansp"));
    }
    if (member.any((item) => item == "ravi")) {
      print("ravi");
      await prefs.setDouble("ravisp", prefs.getDouble("ravisp") + spent);
      ravi = prefs.getDouble("ravisp");

      print(prefs.getDouble("ravisp"));
    }
    if (member.any((item) => item == "viki")) {
      print("viki");
      await prefs.setDouble("vikisp", prefs.getDouble("vikisp") + spent);
      viki = prefs.getDouble("vikisp");
      print(prefs.getDouble("vikisp"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total"),
      ),
      body: isLoding == true
          ? CircularProgressIndicator()
          : Container(
              child: ListView(
                children: [
                  (jemintotal["divyan"] > divyantotal["jemin"])
                      ? Text(
                          "jemin spent ${jemintotal["divyan"] - divyantotal["jemin"]} for divyan",
                          style: TextStyle(fontSize: 20),
                        )
                      : (jemintotal["divyan"] == divyantotal["jemin"])? Container() :Text(
                          "divyan spent ${divyantotal["jemin"] - jemintotal["divyan"]} for jemin",
                          style: TextStyle(fontSize: 20),
                        ),
                  (jemintotal["ravi"] > ravitotal["jemin"])
                      ? Text(
                    "jemin spent ${jemintotal["ravi"] - ravitotal["jemin"]} for ravi",
                    style: TextStyle(fontSize: 20),
                  )
                      : (jemintotal["ravi"] == ravitotal["jemin"])? Container() :Text(
                    "ravi spent ${ravitotal["jemin"] - jemintotal["ravi"]} for jemin",
                    style: TextStyle(fontSize: 20),
                  ),
                  (jemintotal["viki"] > vikitotal["jemin"])
                      ? Text(
                    "jemin spent ${jemintotal["viki"] - vikitotal["jemin"]} for viki",
                    style: TextStyle(fontSize: 20),
                  )
                      : (jemintotal["viki"] == vikitotal["jemin"])? Container() :Text(
                    "viki spent ${vikitotal["jemin"] - jemintotal["viki"]} for jemin",
                    style: TextStyle(fontSize: 20),
                  ),
                  (divyantotal["ravi"] > ravitotal["divyan"])
                      ? Text(
                    "divyan spent ${divyantotal["ravi"] - ravitotal["divyan"]} for ravi",
                    style: TextStyle(fontSize: 20),
                  )
                      : (divyantotal["ravi"] == ravitotal["divyan"])? Container() :Text(
                    "ravi spent ${ravitotal["divyan"]- divyantotal["ravi"]} for divyan",
                    style: TextStyle(fontSize: 20),
                  ),
                  (divyantotal["viki"] > vikitotal["divyan"])
                      ? Text(
                    "divyan spent ${divyantotal["viki"] - vikitotal["divyan"]} for viki",
                    style: TextStyle(fontSize: 20),
                  )
                      : (divyantotal["viki"] == vikitotal["divyan"])? Container() :Text(
                    "viki spent ${vikitotal["divyan"]- divyantotal["viki"]} for divyan",
                    style: TextStyle(fontSize: 20),
                  ),
                  (ravitotal["viki"] > vikitotal["ravi"])
                      ? Text(
                    "ravi spent ${ravitotal["viki"] - vikitotal["ravi"]} for viki",
                    style: TextStyle(fontSize: 20),
                  )
                      : (ravitotal["viki"] == vikitotal["ravi"])? Container() :Text(
                    "viki spent ${vikitotal["ravi"]- ravitotal["viki"]} for ravi",
                    style: TextStyle(fontSize: 20),
                  ),
                  /*Row(
                    children: [
                      Text(
                        "ravi:",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        ravi.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "divyan:",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        divyan.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "viki:",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        viki.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),*/
                  /*Row(
            children: [
              Text("jemin:", style: TextStyle(fontSize: 20),),
              SizedBox(width: 20,),
              Text(jemin.toString(), style: TextStyle(fontSize: 20),),

            ],
          )*/
                ],
              ),
            ),
    );
  }

  setrate() async {
    setState(() {
      isLoding = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (widget.spentBy == "jemin") {
      print("jemintotal...............");
      // jeminjson = prefs.getString("jeminjson");
      // print(jeminjson);
      // jemintotal = json.decode(jeminjson);
      if (member.any((item) => item == "jemin")) {
        jemintotal["jemin"] = jemintotal["jemin"] + spent;
      }
      if (member.any((item) => item == "divyan")) {
        jemintotal["divyan"] = jemintotal["divyan"] + spent;
      }
      if (member.any((item) => item == "ravi")) {
        jemintotal["ravi"] = jemintotal["ravi"] + spent;
      }
      if (member.any((item) => item == "viki")) {
        jemintotal["viki"] = jemintotal["viki"] + spent;
      }
      print(jemintotal["divyan"]);
      // jeminjson = json.encode(jemintotal);
      // await prefs.setString("jeminjson", jeminjson);
      // print(jemintotal);
      // print(prefs.getString("jeminjson"));
    }
    if (widget.spentBy == "divyan") {
      print("divyan...............");
      if (member.any((item) => item == "jemin")) {
        divyantotal["jemin"] = divyantotal["jemin"] + spent;
      }
      if (member.any((item) => item == "divyan")) {
        divyantotal["divyan"] = divyantotal["divyan"] + spent;
      }
      if (member.any((item) => item == "ravi")) {
        divyantotal["ravi"] = divyantotal["ravi"] + spent;
      }
      if (member.any((item) => item == "viki")) {
        divyantotal["viki"] = divyantotal["viki"] + spent;
      }
      print(divyantotal["jemin"]);
    }
    if (widget.spentBy == "ravi") {
      print("ravi...............");
      if (member.any((item) => item == "jemin")) {
        ravitotal["jemin"] = ravitotal["jemin"] + spent;
      }
      if (member.any((item) => item == "divyan")) {
        ravitotal["divyan"] = ravitotal["divyan"] + spent;
      }
      if (member.any((item) => item == "ravi")) {
        ravitotal["ravi"] = ravitotal["ravi"] + spent;
      }
      if (member.any((item) => item == "viki")) {
        ravitotal["viki"] = ravitotal["viki"] + spent;
      }
    }
    if (widget.spentBy == "viki") {
      print("viki...............");
      if (member.any((item) => item == "jemin")) {
        vikitotal["jemin"] = vikitotal["jemin"] + spent;
      }
      if (member.any((item) => item == "divyan")) {
        vikitotal["divyan"] = vikitotal["divyan"] + spent;
      }
      if (member.any((item) => item == "ravi")) {
        vikitotal["ravi"] = vikitotal["ravi"] + spent;
      }
      if (member.any((item) => item == "viki")) {
        vikitotal["viki"] = vikitotal["viki"] + spent;
      }
    }
    setState(() {
      isLoding = false;
    });
  }
}
