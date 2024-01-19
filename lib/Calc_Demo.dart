import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calc_Demo extends StatefulWidget {
  const Calc_Demo({super.key});

  @override
  State<Calc_Demo> createState() => _Calc_DemoState();
}

class _Calc_DemoState extends State<Calc_Demo> {
  TextEditingController t1 = TextEditingController();

  String temp1 = '';
  String temp2 = '';
  String s1 = '';
  String ans = '';
  String ope = '';

  Widget ui(String a) {
    return Expanded(
      child: InkWell(
        onTap: () {
          t1.text = t1.text + a;
        },
        child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              a,
              style: TextStyle(fontSize: (25)),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 3, color: Colors.red),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: CupertinoColors.destructiveRed,
          title: Center(
              child: Text(
                "Calculator",
                style: TextStyle(fontSize: 25),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: t1,
                decoration: InputDecoration(
                    hintText: 'Enter Number...',
                    labelText: 'Number',
                    prefixIcon: Icon(Icons.ad_units_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    fillColor: Colors.yellow),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Ans : $ans",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          t1.text = "";
                          ans = "";
                          setState(() {});
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              "Clear",
                              style: TextStyle(
                                  fontSize: (15), color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2),
                              color: Colors.green,
                            )),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          temp1 = t1.text;
                          t1.text = "";
                          ope = "/";
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              "/",
                              style: TextStyle(fontSize: (25)),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2),
                                color: Colors.white)),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          temp1 = t1.text;
                          t1.text = "";
                          ope = "*";
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              "X",
                              style: TextStyle(fontSize: (25)),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2),
                                color: Colors.white)),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (t1.text != "") {
                            t1.text = t1.text.substring(0, t1.text.length - 1);
                          }
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                  fontSize: (15), color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                                color: CupertinoColors.systemGreen)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    ui("7"),
                    ui("8"),
                    ui("9"),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          temp1 = t1.text;
                          t1.text = "";
                          ope = "-";
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              "-",
                              style: TextStyle(fontSize: (35)),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2),
                                color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    ui("4"),
                    ui("5"),
                    ui("6"),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          temp1 = t1.text;
                          t1.text = "";
                          ope = "+";
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              "+",
                              style: TextStyle(fontSize: (35)),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2),
                                color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    ui("1"),
                    ui("2"),
                    ui("3"),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (!t1.text.contains(".")) {
                                  t1.text = t1.text + '.';
                                }
                              },
                              child: Container(
                                  margin: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  child: Text(
                                    ".",
                                    style: TextStyle(fontSize: (45)),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 2),
                                      color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          ope = "%";
                          temp1 = t1.text;
                          t1.text = "";
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              "%",
                              style: TextStyle(fontSize: (25)),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2),
                                color: Colors.white)),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          t1.text = t1.text + '0';
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              "0",
                              style: TextStyle(fontSize: (25)),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 3, color: Colors.red),
                            )),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          t1.text = t1.text + '00';
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              "00",
                              style: TextStyle(fontSize: (25)),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 3, color: Colors.red),
                            )),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (t1.text.isNotEmpty) {
                            if (ope == "+") {
                              temp2 = t1.text;
                              double sum =
                                  double.parse(temp1) + double.parse(temp2);
                              ans = sum.toString();
                              t1.text = '';
                              setState(() {});
                            }
                            if (ope == "-") {
                              temp2 = t1.text;
                              double minus =
                                  double.parse(temp1) - double.parse(temp2);
                              ans = minus.toString();
                              t1.text = '';
                              setState(() {});
                            }
                            if (ope == "*") {
                              temp2 = t1.text;
                              double mul =
                                  double.parse(temp1) * double.parse(temp2);
                              ans = mul.toString();
                              t1.text = '';
                              setState(() {});
                            }
                            if (ope == "/") {
                              temp2 = t1.text;
                              double div =
                                  double.parse(temp1) / double.parse(temp2);
                              ans = div.toString();
                              t1.text = '';
                              setState(() {});
                            }
                            if (ope == "%") {
                              temp2 = t1.text;
                              double ans1 = double.parse(temp2);
                              print(ans1);
                              ans1 = (double.parse(temp1)*2)/100;
                              ans = ans1.toString();
                              setState(() {});
                            }
                          }
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              "=",
                              style: TextStyle(fontSize: (25)),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(width: 4),
                              borderRadius:
                              BorderRadius.all(Radius.circular(25)),
                              gradient: LinearGradient(
                                  colors: [Colors.blue, Colors.white]),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}