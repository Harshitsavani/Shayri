import 'package:flutter/material.dart';
import 'package:practice_work/Model.dart';
import 'package:practice_work/Shayri_3.dart';

class Shayri_2 extends StatefulWidget {
  int pos;

  Shayri_2(this.pos);

  @override
  State<Shayri_2> createState() => _Shayri_2State();
}

class _Shayri_2State extends State<Shayri_2> {
  List arr = [];
  int temp = 0;
  List gesture = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch (widget.pos) {
      case 0:
        arr = Model.congratulations_shayri;
      case 1:
        arr = Model.friendship_shayri;
      case 2:
        arr = Model.majedar_shayri;
      case 3:
        arr = Model.bhagwan_shayri;
      case 4:
        arr = Model.inspiration_Shayri;
      case 5:
        arr = Model.Life_shayri;
      case 6:
        arr = Model.Mohabbat_shayri;
      case 7:
        arr = Model.Yade_shayri;
      case 8:
        arr = Model.Other_shayri;
      case 9:
        arr = Model.Politics_shayri;
      case 10:
        arr = Model.Love_shayri;
      case 11:
        arr = Model.Pain_shayri;
      case 12:
        arr = Model.sharab_shayri;
      case 13:
        arr = Model.bewafa_shayri;
      case 14:
        arr = Model.birthday_shayri;
      case 15:
        arr = Model.holi_shayri;
    }
    gesture = List.filled(arr.length, false);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text(Model.name[widget.pos]),
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
      body: ListView.separated(
        itemCount: arr.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTapDown: (details) {
              gesture[index] = true;
              setState(() {

              });
            },
            onTapUp: (details) {
              gesture[index] = false;
              setState(() {

              });
            },
            onTapCancel: () {
              gesture[index] = false;
              setState(() {

              });
            },
            child: ListTile(
              tileColor: (gesture[index] == true)?Colors.red:null,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Shayri_3(arr, index);
                  },
                ));
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage(Model.img[widget.pos]),
              ),
              title: Text(
                maxLines: 2,
                "${Model().Emoji_list[(temp < Model().Emoji_list.length) ? temp++ : temp = 0]}\n${arr[index]}",
                style: TextStyle(fontSize: 17),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.teal,
            thickness: 2,
            height: 10,
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:practice_work/Model.dart';
// import 'package:practice_work/Shayri_1.dart';
// import 'package:practice_work/Shayri_3.dart';
//
// class Shayri_2 extends StatefulWidget {
//   int pos;
//   List name;
//   List img;
//
//   Shayri_2(this.img, this.name, this.pos);
//
//   @override
//   State<Shayri_2> createState() => _Shayri_2State();
// }
//
// class _Shayri_2State extends State<Shayri_2> {
//   List arr = [];
//   int temp=0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     switch (widget.pos) {
//       case 0:
//         arr = Shayri_1.congratulations_shayri;
//       case 1:
//         arr = Shayri_1.friendship_shayri;
//       case 2:
//         arr = Shayri_1.majedar_shayri;
//       case 3:
//         arr = Shayri_1.bhagwan_shayri;
//       case 4:
//         arr = Shayri_1.inspiration_Shayri;
//       case 5:
//         arr = Shayri_1.Life_shayri;
//       case 6:
//         arr = Shayri_1.Mohabbat_shayri;
//       case 7:
//         arr = Shayri_1.Yade_shayri;
//       case 8:
//         arr = Shayri_1.Other_shayri;
//       case 9:
//         arr = Shayri_1.Politics_shayri;
//       case 10:
//         arr = Shayri_1.Love_shayri;
//       case 11:
//         arr = Shayri_1.Pain_shayri;
//       case 12:
//         arr = Shayri_1.sharab_shayri;
//       case 13:
//         arr = Shayri_1.bewafa_shayri;
//       case 14:
//         arr = Shayri_1.birthday_shayri;
//       case 15:
//         arr = Shayri_1.holi_shayri;
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.name[widget.pos]),
//       ),
//       body: ListView.builder(
//         itemCount: arr.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(
//                   builder: (context) {
//                     return Shayri_3(arr, index);
//                   },
//                 ));
//               },
//               leading: CircleAvatar(
//                   backgroundImage: AssetImage(widget.img[widget.pos])),
//               // title: Text(
//               //   "${arr[index]}",
//               //   maxLines: 1,
//               // ),
//               title: Text(maxLines: 2, "${Model().Emoji_list[(temp<Model().Emoji_list.length)?temp++:temp=0]}\n${arr[index]}",style: TextStyle(fontSize: 17),),
//               // title: Text(maxLines: 2, "${Model().Emoji_list[(index==0)?temp=0:(temp<Model().Emoji_list.length-1)?++temp:temp=0]}\n${arr[index]}",style: TextStyle(fontSize: 17),),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
