import 'dart:io';
import 'dart:typed_data';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetsToImage(
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                  child: Text(
                    "Testing",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                controller: controller),
            ElevatedButton(
              onPressed: () async {
                bytes = await controller.capture();
                var path = await ExternalPath.getExternalStoragePublicDirectory(
                        ExternalPath.DIRECTORY_DOWNLOADS) +
                    "/Harshit_Demo";
                Directory dir = Directory(path);
                if (!await dir.exists()) {
                  dir.create();
                }
                String name =
                    "${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}.jpg";
                File file = File("${dir.path}/$name");
                file.writeAsBytes(bytes!);
                Share.shareXFiles([XFile('${file.path}')], text: 'Great picture');
              },
              child: Text("Share"),
            ),
          ],
        ),
      ),
    );
  }
}
