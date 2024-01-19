import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tic_tac_toe_3 extends StatefulWidget {
  const tic_tac_toe_3({super.key});

  @override
  State<tic_tac_toe_3> createState() => _tic_tac_toe_3State();
}

class _tic_tac_toe_3State extends State<tic_tac_toe_3> {
  int cnt = 0;
  int r = 0;
  List l = [];
  String o = "O";
  String x = "X";
  String msg = "";
  int t = 0;
  bool is_win = true;

  get(int a) {
    if (l[a] == "") {
      if (cnt % 2 == 0) {
        l[a] = o;
        cnt++;
        win();
      }
      if(msg==""){
        if (cnt < 9) {
          while (l[r] != "") {
            r = Random().nextInt(9);
          }
        }
      }

      l[r] = x;
      cnt++;
      win();
      setState(() {});
    }
  }

  win() {
    if (l[0] == o && l[1] == o && l[2] == o ||
        l[1] == o && l[4] == o && l[7] == o ||
        l[3] == o && l[4] == o && l[5] == o ||
        l[6] == o && l[7] == o && l[8] == o ||
        l[0] == o && l[4] == o && l[8] == o ||
        l[2] == o && l[4] == o && l[6] == o ||
        l[0] == o && l[3] == o && l[6] == o ||
        l[2] == o && l[5] == o && l[8] == o) {
      msg = "O is win";
      is_win = false;
    } else if (l[0] == x && l[1] == x && l[2] == x ||
        l[3] == x && l[4] == x && l[5] == x ||
        l[6] == x && l[7] == x && l[8] == x ||
        l[0] == x && l[4] == x && l[8] == x ||
        l[2] == x && l[4] == x && l[6] == x ||
        l[0] == x && l[3] == x && l[6] == x ||
        l[2] == x && l[5] == x && l[8] == x) {
      msg = "x is win";
      is_win = false;
    } else if (cnt == 9) {
      msg = "Draw";
    }
  }

  @override
  void initState() {
    super.initState();
    l = List.filled(9, "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Tic_Tac_Toe_Random"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => get(0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: (l[0] == o)
                                ? Colors.red
                                : l[0] == x
                                    ? Colors.yellow
                                    : Colors.white,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text(
                          "${l[0]}",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => (is_win == true) ? get(1) : null,
                      child: Container(
                        child: Text(
                          "${l[1]}",
                          style: TextStyle(fontSize: 25),
                        ),
                        decoration: BoxDecoration(
                            color: (l[1] == o)
                                ? Colors.red
                                : l[1] == x
                                    ? Colors.yellow
                                    : Colors.white,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => (is_win == true) ? get(2) : null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: (l[2] == o)
                                ? Colors.red
                                : l[2] == x
                                    ? Colors.yellow
                                    : Colors.white,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text(
                          "${l[2]}",
                          style: TextStyle(fontSize: 25),
                        ),
                        //color: (),
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
                      onTap: () => (is_win == true) ? get(3) : null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: (l[3] == o)
                                ? Colors.red
                                : l[3] == x
                                    ? Colors.yellow
                                    : Colors.white,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text(
                          "${l[3]}",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => (is_win == true) ? get(4) : null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: (l[4] == o)
                                ? Colors.red
                                : l[4] == x
                                    ? Colors.yellow
                                    : Colors.white,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text(
                          "${l[4]}",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => (is_win == true) ? get(5) : null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: (l[5] == o)
                                ? Colors.red
                                : l[5] == x
                                    ? Colors.yellow
                                    : Colors.white,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text(
                          "${l[5]}",
                          style: TextStyle(fontSize: 25),
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
                      onTap: () => (is_win == true) ? get(6) : null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: (l[6] == o)
                                ? Colors.red
                                : l[6] == x
                                    ? Colors.yellow
                                    : Colors.white,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text(
                          "${l[6]}",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => (is_win == true) ? get(7) : null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: (l[7] == o)
                                ? Colors.red
                                : l[7] == x
                                    ? Colors.yellow
                                    : Colors.white,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text(
                          "${l[7]}",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => (is_win == true) ? get(8) : null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: (l[8] == o)
                                ? Colors.red
                                : l[8] == x
                                    ? Colors.yellow
                                    : Colors.white,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text(
                          "${l[8]}",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Result : $msg",
              style: TextStyle(fontSize: 25),
            ),
            TextButton(
                onPressed: () {
                  for (int i = 0; i < l.length; i++) {
                    l[i] = '';
                    msg = '';
                    cnt = 0;
                    t = 0;
                    is_win = true;
                  }
                  setState(() {});
                },
                child: Text("Reset"))
          ],
        ));
  }
}
