import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  final box = Hive.box("myBox");
  Map<String, List<String>> folerDsc = {};

  List<String> frontSideList = [];

  //create data, run this if this is the first time when app is openning

  void createInitialData() {
    folerDsc = {
      "Podstawowe zwroty": [],
      "Podróże": [],
      "Jedzenie na wakacjach": [],
    };
  }

  //create initial FlashCardData

  void createInitialData2(int index) {
    String key = folerDsc.keys.elementAt(index);
    frontSideList = folerDsc[key] ?? ["nowe", "stare"];
  }

//write Folderdata
  void write() {
    box.put("Folder List", folerDsc);
  }

  void frontSidewrite(int index) {
    box.put("frontSide", frontSideList);
  }

//read Folderdata
  void read() {
    folerDsc = box.get("Folder List");
  }

  void frontSideread() {}
}
