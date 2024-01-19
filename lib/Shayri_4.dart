import 'dart:io';
import 'dart:typed_data';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import 'Model.dart';

class Shayri_4 extends StatefulWidget {
  int pos;
  List array;

  Shayri_4(this.array, this.pos);

  @override
  State<Shayri_4> createState() => _Shayri_4State();
}

class _Shayri_4State extends State<Shayri_4> {
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;
  List Emoji_list = [
    '😀 😃 😄 😁 😆 😅 😀 😃 😄 😁 😆 😅',
    '😉 😌 😍 🥰 😘 😗 😉 😌 😍 🥰 😘 😗',
    '😣 😖 😫 😩 🥺 😢 😣 😖 😫 😩 🥺 😢',
    '😳 🥵 🥶 😱 😨 😰 😳 🥵 🥶 😱 😨 😰',
    '🤒 🤕 🤑 🤠 😈 👿 🤒 🤕 🤑 🤠 😈 👿',
    '👋 🤚 🖐 ✋ 🖖 👌 👋 🤚 🖐 ✋ 🖖 👌',
    '🙌 👐 🤲 🤝 🙏 ✍️  🙌 👐 🤲 🤝 🙏 ✍️ ',
    '🙅🏻 🙅🏻‍♂️ 🙆🏻‍♀️ 🙆🏻 🙆🏻‍♂️ 🙋🏻‍♀️ 🙅🏻 🙅🏻‍♂️ 🙆🏻‍♀️ 🙆🏻 🙆🏻‍♂️ 🙋🏻‍♀️',
    '👋🏼 🤚🏼 🖐🏼 ✋🏼 🖖🏼 👌🏼 👋🏼 🤚🏼 🖐🏼 ✋🏼 🖖🏼 👌🏼 ',
    'Without Emoji...'
  ];
  bool color_random = true;
  bool Emoji = true;
  Color background = Colors.deepOrangeAccent;
  Color font = Colors.black;
  int col_ind = 0;
  int Emoji_Pos = 0;
  double a = 15;
  String font_style = "";

  @override
  Widget build(BuildContext context) {
    double full_size = MediaQuery.of(context).size.height;
    double status_height = MediaQuery.of(context).padding.top;
    double app_bar = kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        title: Text("फोटो पर शायरी लिखें"),
      ),
      body: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: WidgetsToImage(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                        )
                      ],
                      color: (color_random == true) ? background : null,
                      gradient: (color_random == false)
                          ? LinearGradient(colors: [
                              Model.color[col_ind],
                              Model.color[col_ind + 1]
                            ])
                          : null),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      (Emoji == true)
                          ? widget.array[widget.pos]
                          : (Emoji == false)
                              ? "${Emoji_list[Emoji_Pos]}\n${widget.array[widget.pos]}\n${Emoji_list[Emoji_Pos]}"
                              : null,
                      style: TextStyle(
                        fontSize: a,
                        color: font,
                        fontFamily: font_style,
                      ),
                    ),
                  ),
                ),
                controller: controller,
              ),
            ),
          ),
          Container(
            height: 180,
            color: Colors.black,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 150,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  onTap: () {
                                    Model.color.shuffle();
                                    color_random = false;
                                    setState(() {});
                                  },
                                  child: Image.asset(
                                      height: 40,
                                      "Assets/Images/Shayri/reload.png"),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    showDragHandle: true,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: full_size -
                                            app_bar -
                                            status_height -
                                            50,
                                        child: GridView.builder(
                                          itemCount: Model.color.length - 1,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2),
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  col_ind = index;
                                                  color_random = false;
                                                  setState(() {});
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  child: Center(
                                                      child: Text(
                                                    "Love Shayri....",
                                                    style: TextStyle(
                                                        fontSize: 34,
                                                        fontFamily: "nine"),
                                                  )),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.black,
                                                            blurRadius: 5),
                                                      ],
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            Model.color[index],
                                                            Model.color[
                                                                index + 1]
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
                                    height: 40,
                                    "Assets/Images/Shayri/expand.png"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            showDragHandle: true,
                            isScrollControlled: true,
                            isDismissible: false,
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    full_size - app_bar - status_height - 595,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: GridView.builder(
                                          itemCount: Model.color.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 8),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                color_random = true;
                                                background = Model.color[index];
                                                setState(() {});
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Container(
                                                  color: Model.color[index],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Image.asset(
                                                height: 30,
                                                "Assets/Images/Shayri/close.png")),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          child: Center(child: Text("Background")),
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            showDragHandle: true,
                            isScrollControlled: true,
                            isDismissible: false,
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    full_size - app_bar - status_height - 595,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: GridView.builder(
                                          itemCount: Model.color.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 8),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                font = Model.color[index];
                                                setState(() {});
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Container(
                                                  color: Model.color[index],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                                height: 30,
                                                "Assets/Images/Shayri/close.png"),
                                          )),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          child: Center(child: Text("Text Color")),
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          bytes = await controller.capture();
                          var path = await ExternalPath
                                  .getExternalStoragePublicDirectory(
                                      ExternalPath.DIRECTORY_DOWNLOADS) +
                              "/Shayri";
                          Directory dir = Directory(path);
                          if (!await dir.exists()) {
                            dir.create();
                          }
                          String Img_name =
                              "${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}${DateTime.now().millisecond}Image.jpg";
                          File file = File("${dir.path}/${Img_name}");
                          file.writeAsBytes(bytes!);
                          Share.shareFiles(['${file.path}'],
                              text: 'Great picture');
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          child: Center(child: Text("Share")),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            barrierColor: Colors.transparent,
                            isDismissible: false,
                            showDragHandle: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    full_size - app_bar - status_height - 595,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Image.asset(
                                                      height: 30,
                                                      "Assets/Images/Shayri/close.png"))),
                                        )
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                font_style = "one";
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 75,
                                                color: Colors.grey,
                                                child: Center(
                                                    child: Text(
                                                  "Hello",
                                                  style: TextStyle(
                                                      fontFamily: "one"),
                                                )),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                font_style = "two";
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 75,
                                                color: Colors.grey,
                                                child: Center(
                                                    child: Text(
                                                  "Hello",
                                                  style: TextStyle(
                                                      fontFamily: "two"),
                                                )),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                font_style = "three";
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 75,
                                                color: Colors.grey,
                                                child: Center(
                                                    child: Text(
                                                  "Hello",
                                                  style: TextStyle(
                                                      fontFamily: "three"),
                                                )),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                font_style = "four";
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 75,
                                                color: Colors.grey,
                                                child: Center(
                                                    child: Text(
                                                  "Hello",
                                                  style: TextStyle(
                                                      fontFamily: "four"),
                                                )),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                font_style = "five";
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 75,
                                                color: Colors.grey,
                                                child: Center(
                                                    child: Text(
                                                  "Hello",
                                                  style: TextStyle(
                                                      fontFamily: "five"),
                                                )),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                font_style = "six";
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 75,
                                                color: Colors.grey,
                                                child: Center(
                                                    child: Text(
                                                  "Hello",
                                                  style: TextStyle(
                                                      fontFamily: "six"),
                                                )),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                font_style = "seven";
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 75,
                                                color: Colors.grey,
                                                child: Center(
                                                    child: Text(
                                                  "Hello",
                                                  style: TextStyle(
                                                      fontFamily: "seven"),
                                                )),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                font_style = "eight";
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 75,
                                                color: Colors.grey,
                                                child: Center(
                                                    child: Text(
                                                  "Hello",
                                                  style: TextStyle(
                                                      fontFamily: "eight"),
                                                )),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                font_style = "nine";
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 75,
                                                color: Colors.grey,
                                                child: Center(
                                                    child: Text(
                                                  "Hello",
                                                  style: TextStyle(
                                                      fontFamily: "nine"),
                                                )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          child: Center(child: Text("Font")),
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isDismissible: false,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    full_size - app_bar - status_height - 547,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: () {
                                              if (index ==
                                                  Emoji_list.length - 1) {
                                                Emoji = true;
                                              } else {
                                                Emoji = false;
                                                Emoji_Pos = index;
                                              }
                                              setState(() {});
                                            },
                                            title: Center(
                                              child: Text(
                                                selectionColor: Colors.red,
                                                "${Emoji_list[index]}",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return Divider(
                                            thickness: 5,
                                            height: 10,
                                          );
                                        },
                                        itemCount: Emoji_list.length,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Image.asset(
                                                height: 30,
                                                "Assets/Images/Shayri/close.png")),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          child: Center(child: Text("Emoji")),
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            isScrollControlled: true,
                            isDismissible: false,
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    full_size - app_bar - status_height - 550,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Image.asset(
                                                  height: 30,
                                                  "Assets/Images/Shayri/close.png")),
                                        ),
                                      ],
                                    ),
                                    StatefulBuilder(
                                      builder: (context, setState1) {
                                        return Slider(
                                          min: 0,
                                          max: 30,
                                          value: a,
                                          onChanged: (value) {
                                            a = value;
                                            setState(() {});
                                            setState1(() {});
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          child: Center(child: Text("Text Size")),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}