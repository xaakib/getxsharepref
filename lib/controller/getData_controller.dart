import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetDataController extends GetxController {
  static GetDataController instance = Get.find();
  var dataValue = 0.obs;
  var counter = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getVlaue();
    
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getVlaue();
    super.onReady();
    
  }

  saveValue(int values) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future<bool> value = prefs.setInt('value', values);
    print("AddedValue  : $value");
  }

  getVlaue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? intValue = prefs.getInt('value');
    if (intValue == null) {
      dataValue.value = 0;
    } else {
      dataValue.value = intValue;
     
    }
    print("GetValue  Data from Sharepref : $intValue");
  }

  deleteValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future<bool> value = prefs.remove('value');
    print("deleted  : $value");
  }

  counterIncri() {
    counter++;
    dataValue = counter;
    saveValue(dataValue.toInt());
  }

  counterDicriment() {
    counter--;
    dataValue = counter;
     saveValue(counter.toInt());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
