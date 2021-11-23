import 'dart:io';
import 'package:flutter/material.dart';
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
    setState(() {
      isLoading = true;
    });
  }

  getpath(path) async {
    var systemTempDir = path;
    print("PathFromDirectory" + systemTempDir.toString());
    await for (var entity
        in systemTempDir.list(recursive: true, followLinks: false)) {
      var pathImage = entity.path;
      RegExp regExp = new RegExp(
        r"\.(gif|jpe?g|tiff?|png|webp|bmp)",
        caseSensitive: false,
        multiLine: false,
      );
      if (regExp.hasMatch(pathImage)) {
        imagesPath.add(pathImage);
      }
    }
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
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                                image: FileImage(File(imagesPath[index]))),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}
