import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tic_tac_toe_2 extends StatefulWidget {
  const tic_tac_toe_2({super.key});

  @override
  State<tic_tac_toe_2> createState() => _tic_tac_toe_2State();
}

class _tic_tac_toe_2State extends State<tic_tac_toe_2> {
  int cnt = 0;
  String o = "O";
  String x = "X";
  String msg = "";
  bool is_win = true;
  List l = [];

  get(int a) {
    if (l[a] == "") {
      if (cnt % 2 == 0) {
        l[a] = o;
        win();
      } else {
        l[a] = x;
        win();
      }
      cnt++;
      setState(() {

      });
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
        l[1] == x && l[4] == x && l[7] == x ||
        l[3] == x && l[4] == x && l[5] == x ||
        l[6] == x && l[7] == x && l[8] == x ||
        l[0] == x && l[4] == x && l[8] == x ||
        l[2] == x && l[4] == x && l[6] == x ||
        l[0] == x && l[3] == x && l[6] == x ||
        l[2] == x && l[5] == x && l[8] == x) {
      msg = "x is win";
      is_win = false;
    } else if (cnt == 8) {
      msg = "Draw";
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    l = List.filled(9, "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Tic_Tac_Toe"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => (is_win == true) ? get(0) : null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: (l[0] == o)
                                ? Colors.red
                                : (l[0] == x)
                                    ? Colors.yellow
                                    : null,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text("${l[0]}",style: TextStyle(fontSize: 25),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => (is_win == true) ? get(1) : null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: (l[1] == o)
                                ? Colors.red
                                : (l[1] == x)
                                    ? Colors.yellow
                                    : null,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text("${l[1]}",style: TextStyle(fontSize: 25),),
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
                                : (l[2] == x)
                                    ? Colors.yellow
                                    : null,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text("${l[2]}",style: TextStyle(fontSize: 25),),
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
                                : (l[3] == x)
                                    ? Colors.yellow
                                    : null,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text("${l[3]}",style: TextStyle(fontSize: 25),),
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
                                : (l[4] == x)
                                    ? Colors.yellow
                                    : null,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text("${l[4]}",style: TextStyle(fontSize: 25),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => (is_win == true) ? get(5) : null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: (l[5] == o)?Colors.red:(l[5] == x)?Colors.yellow:null,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text("${l[5]}",style: TextStyle(fontSize: 25),),
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
                            color: (l[6] == o)?Colors.red:(l[6] == x)?Colors.yellow:null,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text("${l[6]}",style: TextStyle(fontSize: 25),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => (is_win == true) ? get(7) : null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: (l[7] == o)?Colors.red:(l[7] == x)?Colors.yellow:null,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text("${l[7]}",style: TextStyle(fontSize: 25),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => (is_win == true) ? get(8) : null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: (l[8] == o)?Colors.red:(l[8] == x)?Colors.yellow:null,
                            border: Border.all(width: 2)),
                        alignment: Alignment.center,
                        child: Text("${l[8]}",style: TextStyle(fontSize: 25),),
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
                    is_win = true;
                    setState(() {});
                  }
                },
                child: Text("Reset"))
          ],
        ));
  }
}
// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// class tic extends StatefulWidget {
//   const tic({super.key});
//
//   @override
//   State<tic> createState() => _ticState();
// }
//
// class _ticState extends State<tic> {
//   int cnt = 0;
//   int r = 0;
//   List temp = [];
//   String o = "O";
//   String x = "X";
//   bool is_win = true;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     temp = List.filled(9, "");
//   }
//
//   get(int a) {
//     if (temp[a] == "") {
//       if (cnt % 2 == 0) {
//         temp[a] = o;
//         cnt++;
//         win();
//       }
//       if (cnt < 9) {
//         while (temp[r] != "") {
//           r = Random().nextInt(9);
//         }
//         cnt++;
//         win();
//       }
//       temp[r] = x;
//
//       setState(() {});
//     }
//   }
//
//   win() {
//     if (temp[0] == o && temp[1] == o && temp[2] == o ||
//         temp[1] == o && temp[4] == o && temp[7] == o ||
//         temp[3] == o && temp[4] == o && temp[5] == o ||
//         temp[6] == o && temp[7] == o && temp[8] == o ||
//         temp[0] == o && temp[4] == o && temp[8] == o ||
//         temp[2] == o && temp[4] == o && temp[6] == o ||
//         temp[0] == o && temp[3] == o && temp[6] == o ||
//         temp[2] == o && temp[5] == o && temp[8] == o) {
//       is_win = false;
//     }
//     if (temp[0] == x && temp[1] == x && temp[2] == x ||
//         temp[3] == x && temp[4] == x && temp[5] == x ||
//         temp[6] == x && temp[7] == x && temp[8] == x ||
//         temp[0] == x && temp[4] == x && temp[8] == x ||
//         temp[2] == x && temp[4] == x && temp[6] == x ||
//         temp[0] == x && temp[3] == x && temp[6] == x ||
//         temp[2] == x && temp[5] == x && temp[8] == x) {
//       is_win = false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Tic tac toe"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       (is_win == true) ? get(0) : null;
//                       setState(() {});
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(temp[0]),
//                       decoration: BoxDecoration(
//                         color: (temp[0] == o)
//                             ? Colors.red
//                             : (temp[0] == x)
//                                 ? Colors.yellow
//                                 : null,
//                         border: Border.all(width: 2),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       (is_win == true) ? get(1) : null;
//                       setState(() {});
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(temp[1]),
//                       decoration: BoxDecoration(
//                         color: (temp[1] == o)
//                             ? Colors.red
//                             : (temp[1] == x)
//                                 ? Colors.yellow
//                                 : null,
//                         border: Border.all(width: 2),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       (is_win == true) ? get(2) : null;
//                       setState(() {});
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(temp[2]),
//                       decoration: BoxDecoration(
//                         color: (temp[2] == o)
//                             ? Colors.red
//                             : (temp[2] == x)
//                                 ? Colors.yellow
//                                 : null,
//                         border: Border.all(width: 2),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       (is_win == true) ? get(3) : null;
//                       setState(() {});
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(temp[3]),
//                       decoration: BoxDecoration(
//                         color: (temp[3] == o)
//                             ? Colors.red
//                             : (temp[3] == x)
//                                 ? Colors.yellow
//                                 : null,
//                         border: Border.all(width: 2),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       (is_win == true) ? get(4) : null;
//                       setState(() {});
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(temp[4]),
//                       decoration: BoxDecoration(
//                         color: (temp[4] == o)
//                             ? Colors.red
//                             : (temp[4] == x)
//                                 ? Colors.yellow
//                                 : null,
//                         border: Border.all(width: 2),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       (is_win == true) ? get(5) : null;
//                       setState(() {});
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(temp[5]),
//                       decoration: BoxDecoration(
//                         color: (temp[5] == o)
//                             ? Colors.red
//                             : (temp[5] == x)
//                                 ? Colors.yellow
//                                 : null,
//                         border: Border.all(width: 2),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       (is_win == true) ? get(6) : null;
//                       setState(() {});
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(temp[6]),
//                       decoration: BoxDecoration(
//                         color: (temp[6] == o)
//                             ? Colors.red
//                             : (temp[6] == x)
//                                 ? Colors.yellow
//                                 : null,
//                         border: Border.all(width: 2),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       (is_win == true) ? get(7) : null;
//                       setState(() {});
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(temp[7]),
//                       decoration: BoxDecoration(
//                         color: (temp[7] == o)
//                             ? Colors.red
//                             : (temp[7] == x)
//                                 ? Colors.yellow
//                                 : null,
//                         border: Border.all(width: 2),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       (is_win == true) ? get(8) : null;
//                       setState(() {});
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(temp[8]),
//                       decoration: BoxDecoration(
//                         color: (temp[8] == o)
//                             ? Colors.red
//                             : (temp[8] == x)
//                                 ? Colors.yellow
//                                 : null,
//                         border: Border.all(width: 2),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
