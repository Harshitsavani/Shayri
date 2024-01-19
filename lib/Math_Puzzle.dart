import 'dart:math';

import 'package:flutter/material.dart';

class math_puzzle extends StatefulWidget {
  const math_puzzle({super.key});

  @override
  State<math_puzzle> createState() => _math_puzzleState();
}

class _math_puzzleState extends State<math_puzzle> {
  List l = [];
  int r = 0;
  String msg = "";

  @override
  void initState() {
    super.initState();
    random();
  }

  void random() {
    l = List.filled(9, "");
    for (int i = 0; i < l.length;) {
      r = Random().nextInt(9);
      if (!l.contains(r)) {
        l[i] = r;
        i++;
      }
    }
    for (int i = 0; i < l.length; i++) {
      if (l[i] == 0) {
        l[i] = "";
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    is_win() {
      if (l[0] == 1 &&
          l[1] == 2 &&
          l[2] == 3 &&
          l[3] == 4 &&
          l[4] == 5 &&
          l[5] == 6 &&
          l[6] == 7 &&
          l[7] == 8) {
        msg = "Win";
      }
    }

    get(int a) {
      if (a == 0) {
        if (l[1] == "") {
          l[1] = l[a];
          l[a] = "";
        }
        if (l[3] == "") {
          l[3] = l[a];
          l[a] = "";
        }
      }
      if (a == 1) {
        if (l[0] == "") {
          l[0] = l[a];
          l[a] = "";
        }
        if (l[2] == "") {
          l[2] = l[a];
          l[a] = "";
        }
        if (l[4] == "") {
          l[4] = l[a];
          l[a] = "";
        }
      }
      if (a == 2) {
        if (l[1] == "") {
          l[1] = l[a];
          l[a] = "";
        }
        if (l[5] == "") {
          l[5] = l[a];
          l[a] = "";
        }
      }
      if (a == 3) {
        if (l[0] == "") {
          l[0] = l[a];
          l[a] = "";
        }
        if (l[4] == "") {
          l[4] = l[a];
          l[a] = "";
        }
        if (l[6] == "") {
          l[6] = l[a];
          l[a] = "";
        }
      }
      if (a == 4) {
        if (l[1] == "") {
          l[1] = l[a];
          l[a] = "";
        }
        if (l[3] == "") {
          l[3] = l[a];
          l[a] = "";
        }
        if (l[5] == "") {
          l[5] = l[a];
          l[a] = "";
        }
        if (l[7] == "") {
          l[7] = l[a];
          l[a] = "";
        }
      }
      if (a == 5) {
        if (l[2] == "") {
          l[2] = l[a];
          l[a] = "";
        }
        if (l[4] == "") {
          l[4] = l[a];
          l[a] = "";
        }
        if (l[8] == "") {
          l[8] = l[a];
          l[a] = "";
        }
      }
      if (a == 6) {
        if (l[3] == "") {
          l[3] = l[a];
          l[a] = "";
        }
        if (l[7] == "") {
          l[7] = l[a];
          l[a] = "";
        }
      }
      if (a == 7) {
        if (l[4] == "") {
          l[4] = l[a];
          l[a] = "";
        }
        if (l[6] == "") {
          l[6] = l[a];
          l[a] = "";
        }
        if (l[8] == "") {
          l[8] = l[a];
          l[a] = "";
        }
      }
      if (a == 8) {
        if (l[5] == "") {
          l[5] = l[a];
          l[a] = "";
        }
        if (l[7] == "") {
          l[7] = l[a];
          l[a] = "";
        }
      }
      is_win();
      setState(() {});
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Math_Puzzle",
                style: TextStyle(fontSize: 25),
              ),
              TextButton(
                  onPressed: () {
                    random();
                    msg = "";
                  },
                  child: Text(
                    "Reset",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => get(0),
                      splashColor: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "${l[0]}",
                            style: TextStyle(fontSize: 25),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.red,
                      onTap: () => get(1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child:
                              Text("${l[1]}", style: TextStyle(fontSize: 25)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.black,
                      onTap: () => get(2),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child:
                              Text("${l[2]}", style: TextStyle(fontSize: 25)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2),
                          ),
                        ),
                      ),
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
                      splashColor: Colors.green,
                      onTap: () => get(3),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child:
                              Text("${l[3]}", style: TextStyle(fontSize: 25)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.purple,
                      onTap: () => get(4),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child:
                              Text("${l[4]}", style: TextStyle(fontSize: 25)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.yellow,
                      onTap: () => get(5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child:
                              Text("${l[5]}", style: TextStyle(fontSize: 25)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.yellow),
                          ),
                        ),
                      ),
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
                      splashColor: Colors.lightBlueAccent,
                      onTap: () => get(6),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child:
                              Text("${l[6]}", style: TextStyle(fontSize: 25)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2, color: Colors.lightBlueAccent),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.pink,
                      onTap: () => get(7),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child:
                              Text("${l[7]}", style: TextStyle(fontSize: 25)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.pink),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.indigoAccent,
                      onTap: () => get(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child:
                              Text("${l[8]}", style: TextStyle(fontSize: 25)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2, color: Colors.indigoAccent),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Result : $msg",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ));
  }
}
