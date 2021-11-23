// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageController extends GetxController {
  static ImageController instance = Get.find();
  String path = '/home/xaakibx/Downloads';
  var imagesPath = [].obs;
  var loginProcess = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _listenForPermissionStatus();
    getExitFile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getExitFile() async {
    print("Fun");
    final myDir = Directory("/storage/emulated/0/");
    var isThere = await myDir.exists();
    print(isThere ? 'exists' : 'non-existent');
    isThere ? getpath(myDir) : print("Not Exits");
  }

  getpath(path) async {
    loginProcess(true);
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
        imagesPath.value.add(pathImage);
      }
    }
       print("getxLastFun");
         loginProcess(false);

         print("Working Result "+loginProcess.toString());
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
}
