import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:idealtask/total.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ListViewbuilder.dart';

class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  List name = ["jemin", "divyan", "ravi", "viki"];
  bool all = false;
  bool exclude = false;
  bool isswitch = false;
int beforelength;
int aftrerlength;
  TextEditingController _totalController = TextEditingController();
  TextEditingController _spentbycontroller = TextEditingController();
  TextEditingController _disController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendzero();
  }

  sendzero() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble("jeminsp", 0.0);
    await prefs.setDouble("divyansp", 0.0);
    await prefs.setDouble("ravisp", 0.0);
    await prefs.setDouble("vikisp", 0.0);
  }

  setitem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('counter', isadd);
    print(prefs.getStringList("counter"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: ListView(
            children: [
              Text("Spent by"),
              TextFormField(
                controller: _spentbycontroller,
              ),
              Text("Amount Spent"),
              TextFormField(
                controller: _totalController,
              ),
              Text("Discription"),
              TextFormField(
                controller: _disController,
              ),
              Text("Shared Between"),
              Row(
                children: [
                  Text("All"),
                  Switch(
                    value: all,
                    onChanged: (value) {
                      setState(() {
                        all = value;
                        if (value == true) {

                          for (var i = 0; i < name.length; i++) {
                            isadd.add(name[i]);
                            List vae =
                                LinkedHashSet<String>.from(isadd).toList();
                            print(vae);
                            setState(() {
                              isswitch = true;
                            });

                          }
                        } else {
                          for (var i = 0; i < name.length; i++) {
                            isadd.remove(name[i]);
                            print(isadd);
                            List vae =
                                LinkedHashSet<String>.from(isadd).toList();
                            print(vae);
                            setState(() {
                              isswitch = false;
                            });
                          }
                        }
                        setitem();
                      });
                    },
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text("Exclude me"),
                  Switch(
                    value: exclude,
                    onChanged: (value) {
                      setState(() {
                        exclude = value;
                        if (value == true) {
                       print("yes");

                            if(_spentbycontroller.text != null && _spentbycontroller.text != "") {
                              setState(() {
                                beforelength = name.length;
                              });
                              for (var i = 0; i < name.length; i++) {
                              if (name[i] == _spentbycontroller.text) {
                                print("name........=-==>$name + $i");
                                if(isadd.contains(name[i])) {isadd.remove(name[i]);}
                                name.remove(name[i]);
                                print("name........=-==>$name");
                                setState(() {
                                  aftrerlength = name.length;
                                });


                                print(isadd);
                                List vae =
                                LinkedHashSet<String>.from(isadd).toList();
                                print(vae);
                              }
                            }
                          }
                        } else {
                        if(aftrerlength < beforelength) {
                            isadd.add(_spentbycontroller.text);
                            name.add(_spentbycontroller.text);
                            List vae =
                            LinkedHashSet<String>.from(isadd).toList();

                          }
                        }
                        setitem();
                      });
                    },
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (BuildContext context, index) {
                    return YourLitViewBuilder(
                      index: index,
                      isSwitched: isswitch,
                      name: name,
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => total(
                              totalspent: int.parse(_totalController.text),
                          spentBy: _spentbycontroller.text,
                            )),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.3,
                  color: Colors.blue,
                  child: Center(
                      child: Text(
                    "Done",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Flutter 1.22.4 • channel stable • https://github.com/flutter/flutter.git
// Framework • revision 1aafb3a8b9 (10 months ago) • 2020-11-13 09:59:28 -0800
// Engine • revision 2c956a31c0
// Tools • Dart 2.10.4
