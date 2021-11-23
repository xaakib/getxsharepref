import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getxsharepref/controller/getDataIntance.dart';

class GetImageScreen extends StatefulWidget {
  const GetImageScreen({Key? key}) : super(key: key);

  @override
  _GetImageScreenState createState() => _GetImageScreenState();
}

class _GetImageScreenState extends State<GetImageScreen> {
  @override
  Widget build(BuildContext context) {
    print("BuildContext" + imageController.loginProcess.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("sss"),
      ),
      body: Container(
        child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: imageController.imagesPath.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                    image: FileImage(File(imageController.imagesPath[index]))),
              );
            }),
      ),
    );
  }
}
