import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class total extends StatefulWidget {
  int totalspent;

  total({this.totalspent});

  @override
  _totalState createState() => _totalState();
}

class _totalState extends State<total> {
  List member = [];
  int count;
  double spent;
  List<int> total = [0, 0, 0, 0];
  List name = ["jemin", "divyan", "ravi", "viki"];
  double jemin;
  double viki;
  double divyan;
  double ravi;
  bool isLoding = false;

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
    setState(() {
      isLoding = false;
    });
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
                  Row(
                    children: [
                      Text(
                        "jemin:",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        jemin.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
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
                  ),
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
}
