import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_work/Calc_Demo.dart';
import 'package:practice_work/Math_Puzzle.dart';
import 'package:practice_work/Shayri_1.dart';
import 'package:practice_work/Tic_Tac_Toe_2.dart';
import 'package:practice_work/Tic_Tac_Toe_3(Random).dart';

class All_App extends StatefulWidget {
  const All_App({super.key});

  @override
  State<All_App> createState() => _All_AppState();
}

List page = [
  "tic_tac_toe_random",
  "tic_tac_toe",
  "Calculator",
  "Random_puzzle",
  "Shayri_app"
];
List program = [
  tic_tac_toe_3(),
  tic_tac_toe_2(),
  Calc_Demo(),
  math_puzzle(),
  Shayri_1()
];
List sub_title = [
  "With Computer",
  "2 Players",
  "Basic Calculator",
  "Number_puzzle",
  "All Shayri"
];

class _All_AppState extends State<All_App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Application"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return program[index];
                },
              ));
            },
            leading: Icon(Icons.ad_units_outlined),
            subtitle: Text("${sub_title[index]}"),
            title: Text("${page[index]}"),
          );
        },
        itemCount: page.length,
      ),
    );
  }
}
