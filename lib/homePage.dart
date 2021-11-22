import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/getDataIntance.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("HomeScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text("Cinebaz Storage"),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
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
                  child: Text("++")),
              SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {
                    getDataController.counterDicriment();
                    getDataController.getVlaue();
                  },
                  child: Text("--")),
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
              ElevatedButton(onPressed: () {}, child: Text("Saved")),
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
              ElevatedButton(
                  onPressed: () {
                    var total = 21;
                    getDataController.saveValue(total.toInt());
                    getDataController.getVlaue();
                  },
                  child: Text("AddData")),
              SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Back"))
            ],
          )),
    );
  }
}
