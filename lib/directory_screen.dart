import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getxsharepref/view_screenImage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DirectoryScreen extends StatefulWidget {
  const DirectoryScreen({Key? key}) : super(key: key);

  @override
  _DirectoryScreenState createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {
  String path = '/home/xaakibx/Downloads';
  List<String> imagesPath = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    print("init");
    _listenForPermissionStatus();
    getExitFile();
  }

  getExitFile() async {
    print("Fun");
    final myDir = Directory("/storage/emulated/0/");
    var isThere = await myDir.exists();
    print(isThere ? 'exists' : 'non-existent');
    isThere ? getpath(myDir) : print("Not Exits");
  }

  getpath(path) async {
    var systemTempDir = path;
    print("PathFromDirectory" + systemTempDir.toString());
    await for (var entity
        in systemTempDir.list(recursive: true, followLinks: false)) {
      var pathImage = entity.path;

      print(":::::::::" + pathImage);
      RegExp regExp = new RegExp(
        r"\.(mov|avi?g|wmv?|mp4|3gp)",
        caseSensitive: false,
        multiLine: false,
      );
      if (regExp.hasMatch(pathImage)) {
        imagesPath.add(pathImage);
      }
    }
    setState(() {
      isLoading = true;
      print("Loading $isLoading");
    });
  
  }

  void _listenForPermissionStatus() async {
    final status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      print('Permission granted');
    } else if (status == PermissionStatus.denied) {
      print(
          'Denied. Show a dialog with a reason and again ask for the permission.');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Take the user to the settings page.');
    }
    print(status.isGranted ? "Granded" : "Deined");
  }

  @override
  Widget build(BuildContext context) {
    // /storage/emulated/0/Download/images.jpeg
    print("Build ImageList :  $imagesPath");

    print(imagesPath.length);
    return isLoading
        ? Scaffold(
            appBar: AppBar(
              centerTitle: false,
              leadingWidth: 0,
              leading: Container(),
              title: Text("Gallery App"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: imagesPath.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(imagesPath[index].toString()),
                          );
                          // InkWell(
                          //   onTap: (){
                          //     Get.to(ViewImageScreen(imageFle: imagesPath[index],));
                          //   },
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Image(
                          //       image: FileImage(File(imagesPath[index])),
                          //       height: 100,
                          //       width: 100,
                          //     ),
                          //   ),
                          // );
                        }),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text("data"),
            ),
            body: Center(child: CircularProgressIndicator()));
  }
}
