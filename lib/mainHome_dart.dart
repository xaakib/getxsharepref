import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getxsharepref/controller/getDataIntance.dart';
import 'package:getxsharepref/controller/getData_controller.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("mainHome");
    return Scaffold(
      appBar: AppBar(
        title: Text("MainHome"),
        actions: [
       
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
             Obx(() {
            return Text(
              getDataController.dataValue.toString(),
              style: TextStyle(fontSize: 30),
            );
          }),
          
             SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  getDataController.counterIncri();
                  getDataController.getVlaue();
                },
                child: Text("Inciz")),
                  SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  getDataController.counterDicriment();
                   getDataController.getVlaue();
                },
                child: Text("Dis")),
            
            SizedBox(height: 40),
            Obx(() {
              return Text(
                  "Showed Datas: " + getDataController.dataValue.toString());
            }),
            Obx(() {
              return Text(
                  "Showed Datas: " + getDataController.dataValue.toString());
            }),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  
                },
                child: Text("Saved")),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  getDataController.getVlaue();
                },
                child: Text("Check Data")),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  getDataController.deleteValue();
                },
                child: Text("Delete Data")),
                 SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/homepage');
                },
                child: Text("Next Screen"))
                
          ],
        ),
      ),
    );
  }
}
