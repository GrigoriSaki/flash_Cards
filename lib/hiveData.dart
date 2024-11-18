import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  final box = Hive.box("myBox");
  List<String> folerDsc = [];

  //create data, run this if this is the first time when app is openning

  void createInitialData() {
    folerDsc = ["Podstawowe zwroty", "Podróże", "Jedzenie na wakacjach"];
    write();
  }

//write Folderdata
  void write() {
    box.put("Folder List", folerDsc);
  }

//read Folderdata
  void read() {
    folerDsc = box.get("Folder List");
  }
}
