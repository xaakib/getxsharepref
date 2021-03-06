import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxsharepref/controller/getDataIntance.dart';
import 'package:getxsharepref/controller/getData_controller.dart';
import 'package:getxsharepref/mainHome_dart.dart';
import 'package:getxsharepref/tumblain_Screen.dart';

import 'controller/imageController.dart';
import 'directory_screen.dart';
import 'getImage_screen.dart';
import 'homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<GetDataController>(GetDataController(), permanent: true);
  Get.put<ImageController>(ImageController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    imageController.loginProcess == false;
    // print("ROOt" + getDataController.dataValue.toString());
    return GetMaterialApp(
      title: 'Cinebaz Storage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeGalery(),
      // initialRoute: '/DirectoryScreen',
      // routes: {
      //   '/': (context) => MainHome(),
      //   '/homepage': (context) => HomePage(),
      //   '/DirectoryScreen': (context) => DirectoryScreen(),
      //   '/GetImageScreen': (context) => GetImageScreen(),
       
      // },
    );
  }
}
