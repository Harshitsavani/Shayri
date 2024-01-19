import 'package:flutter/material.dart';
import 'package:practice_work/Model.dart';
import 'package:practice_work/Shayri_2.dart';

class Shayri_1 extends StatefulWidget {
  const Shayri_1({super.key});

  @override
  State<Shayri_1> createState() => _Shayri_1State();
}

class _Shayri_1State extends State<Shayri_1> {
  List getsture = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsture = List.filled(Model.name.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text("Shayri..."),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: Model.name.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTapDown: (details) {
              getsture[index] = true;
              setState(() {

              });
            },
            onTapUp: (details) {
              getsture[index] = false;
                setState(() {

                });
              },
            onTapCancel: () {
              getsture[index] = false;
              setState(() {

              });
              },
            child: Card(
              child: ListTile(
                tileColor: (getsture[index] == true)?Colors.red:null,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Shayri_2(index);
                  },));
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage("${Model.img[index]}"),
                ),
                title: Text(
                  "${Model.name[index]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
