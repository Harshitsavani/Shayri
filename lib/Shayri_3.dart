
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_work/Model.dart';
import 'package:practice_work/Shayri_4.dart';
import 'package:share_plus/share_plus.dart';

class Shayri_3 extends StatefulWidget {
  List arr;
  int pos;

  Shayri_3(this.arr, this.pos);

  @override
  State<Shayri_3> createState() => _Shayri_3State();
}

class _Shayri_3State extends State<Shayri_3> {
  PageController? controller;
  bool back_status = true;
  Color back_color = Colors.cyanAccent;
  int col_ind = 0;
  int temp = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: widget.pos);
  }

  @override
  Widget build(BuildContext context) {
    double full_size = MediaQuery.of(context).size.height;
    double status_height = MediaQuery.of(context).padding.top;
    double app_bar = kToolbarHeight;
    double total_height = full_size - app_bar - status_height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text("Shayri..."),
            Expanded(
              child: Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.share),),
                    IconButton(onPressed: () {}, icon: Icon(Icons.menu),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: total_height,
                            child: GridView.builder(
                              itemCount: Model.color.length - 1,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      col_ind = index;
                                      back_status = false;
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Container(
                                      child: Center(
                                          child: Text(
                                        "Shayri...",
                                        style: TextStyle(
                                            fontSize: 50, fontFamily: "nine"),
                                      )),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 8,
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          gradient: LinearGradient(colors: [
                                            Model.color[index],
                                            Model.color[index + 1]
                                          ])),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                        height: 35, "Assets/Images/Shayri/expand.png")),
                Text(
                  "${widget.pos + 1}/${widget.arr.length}",
                  style: TextStyle(fontSize: 40, fontFamily: "five"),
                ),
                InkWell(
                    onTap: () {
                      Model.color.shuffle();
                      back_status = false;
                      setState(() {});
                    },
                    child: Image.asset(
                        height: 35, "Assets/Images/Shayri/reload.png")),
              ],
            ),
          ),
          Flexible(
            child: Container(
              child: PageView.builder(
                onPageChanged: (value) {
                  widget.pos = value;
                  setState(() {});
                },
                controller: controller,
                itemCount: widget.arr.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                        decoration: BoxDecoration(
                          color: (back_status == true) ? back_color : null,
                          gradient: (back_status == false)
                              ? LinearGradient(colors: [
                                  Model.color[col_ind],
                                  Model.color[col_ind + 1]
                                ])
                              : null,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: Colors.black),
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 7)
                          ],
                        ),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                          "${Model().Emoji_list[(temp<Model().Emoji_list.length)?temp++:temp=0]}\n${widget.arr[index]}\n${Model().Emoji_list[(temp<Model().Emoji_list.length)?temp++:temp=0]}",
                          style: TextStyle(fontSize: 18),
                        ),
                            ))),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: widget.arr[widget.pos]));
                    },
                    icon: Icon(Icons.copy),
                  ),
                  IconButton(
                    onPressed: () {
                      if (widget.pos != 0) {
                        widget.pos--;
                        controller!.jumpToPage(widget.pos);
                        setState(() {});
                      }
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Shayri_4(widget.arr,widget.pos);
                          },
                        ));
                      },
                      child: Image.asset(
                          height: 40, "Assets/Images/Shayri/pencil2.png")),
                  IconButton(
                    onPressed: () {
                      if (widget.pos < widget.arr.length - 1) {
                        widget.pos++;
                        controller!.jumpToPage(widget.pos);
                        setState(() {});
                      }
                    },
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      Share.share(widget.arr[widget.pos]);
                    },
                    icon: Icon(Icons.share),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:practice_work/Model.dart';
// import 'package:practice_work/Shayri_4.dart';
// import 'package:share_plus/share_plus.dart';
//
// class Shayri_3 extends StatefulWidget {
//   List arr;
//   int pos;
//
//   Shayri_3(this.arr, this.pos);
//
//   @override
//   State<Shayri_3> createState() => _Shayri_3State();
// }
//
// class _Shayri_3State extends State<Shayri_3> {
//   int temp = 0;
//   PageController? controller;
//   int pos = 0;
//   int col_index = 0;
//   bool background = true;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller = PageController(initialPage: widget.pos);
//   }
//
//   List color = [
//     Colors.blue,
//     Colors.green,
//     Colors.deepPurpleAccent,
//     Colors.pink,
//     Colors.yellow,
//     Colors.orangeAccent,
//     Colors.red,
//     Colors.redAccent,
//     Colors.lightBlueAccent,
//     Colors.amber,
//     Colors.indigoAccent,
//     Colors.purple,
//     Colors.tealAccent,
//     Colors.yellowAccent,
//     Colors.lightGreenAccent,
//     Colors.purpleAccent,
//     Colors.greenAccent,
//     Colors.deepOrange,
//     Colors.cyan,
//     Colors.cyanAccent,
//     Colors.blueAccent,
//     Colors.pinkAccent,
//     Colors.amberAccent,
//     Colors.deepOrangeAccent,
//     Colors.lime,
//     Colors.limeAccent,
//     Colors.deepPurple,
//     Colors.redAccent
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     double full_size = MediaQuery.of(context).size.height;
//     double status_height = MediaQuery.of(context).padding.top;
//     double app_bar = kToolbarHeight;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shayri"),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                     onTap: () {
//                       showModalBottomSheet(
//                         isScrollControlled: true,
//                         showDragHandle: true,
//                         barrierColor: Colors.transparent,
//                         context: context,
//                         builder: (context) {
//                           return Container(
//                             height: full_size - app_bar - status_height - 50,
//                             child: GridView.builder(
//                               itemCount: color.length - 1,
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 2),
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: InkWell(
//                                     onTap: () {
//                                       background = false;
//                                       col_index = index;
//                                       Navigator.pop(context);
//                                       setState(() {});
//                                     },
//                                     child: Container(
//                                       child: Center(
//                                           child: Text(
//                                         "Shayri...",
//                                         style: TextStyle(
//                                             fontSize: 40, fontFamily: "nine"),
//                                       )),
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(15)),
//                                           color: color[index],
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color: Colors.black,
//                                               blurRadius: 7,
//                                             )
//                                           ],
//                                           gradient: LinearGradient(colors: [
//                                             color[index],
//                                             color[index + 1]
//                                           ])),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                       );
//                     },
//                     child: Image.asset(
//                         height: 40, "Assets/Images/Shayri/expand.png")),
//                 Text(
//                   "${widget.pos + 1}/${widget.arr.length}",
//                   style: TextStyle(fontSize: 30),
//                 ),
//                 InkWell(
//                     onTap: () {
//                       color.shuffle();
//                       background = false;
//                       setState(() {});
//                     },
//                     child: Image.asset(
//                         height: 40, "Assets/Images/Shayri/reload.png"))
//               ],
//             ),
//           ),
//           Flexible(
//             child: PageView.builder(
//               onPageChanged: (value) {
//                 widget.pos = value;
//                 setState(() {});
//               },
//               itemCount: widget.arr.length,
//               controller: controller,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.only(left: 7, right: 7),
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(15)),
//                           boxShadow: [
//                             BoxShadow(color: Colors.black, blurRadius: 5)
//                           ],
//                           color: (background == true)
//                               ? Colors.lightGreenAccent
//                               : null,
//                           gradient: (background == false)
//                               ? LinearGradient(colors: [
//                                   color[col_index],
//                                   color[col_index + 1]
//                                 ])
//                               : null),
//                       child: Center(
//                           child: Text(
//                         "${Model().Emoji_list[(index==0)?temp=0:(temp<Model().Emoji_list.length-1)?++temp:temp=0]}\n${widget.arr[widget.pos]}\n${Model().Emoji_list[(index==0)?temp=0:(temp<Model().Emoji_list.length-1)?++temp:temp=0]}",
//                         style: TextStyle(fontSize: 17),
//                       )),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         Clipboard.setData(
//                             ClipboardData(text: widget.arr[widget.pos]));
//                       },
//                       icon: Icon(Icons.copy)),
//                   IconButton(
//                       onPressed: () {
//                         if (widget.pos != 0) {
//                           widget.pos--;
//                           controller!.jumpToPage(widget.pos);
//                         }
//                         setState(() {});
//                       },
//                       icon: Icon(Icons.arrow_back_ios_new_outlined)),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) {
//                             return Shayri_4(color, widget.arr, widget.pos);
//                           },
//                         ));
//                       },
//                       child: Image.asset(
//                           height: 35, "Assets/Images/Shayri/pencil2.png"),
//                     ),
//                   ),
//                   IconButton(
//                       onPressed: () {
//                         if (widget.pos < widget.arr.length - 1) {
//                           widget.pos++;
//                           controller!.jumpToPage(widget.pos);
//                         }
//                       },
//                       icon: Icon(Icons.arrow_forward_ios_outlined)),
//                   IconButton(
//                       onPressed: () {
//                         Share.share(widget.arr[widget.pos]);
//                       },
//                       icon: Icon(Icons.share)),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
