import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class HiveData {
  final box = Hive.box("myBox");
  Map<String, List<String>> folerDsc = {};

  List<List<String>> frontSideList = [];
  Map<String, List<String>> folerDsc2 = {};
  Map<String, List<Color>> folerDsc3 = {};

  //create data, run this if this is the first time when app is openning

  void createInitialData() {
    folerDsc = {
      "Podstawowe zwroty": [],
      "Podróże": [],
      "Jedzenie na wakacjach": [],
    };
  }

//write Folderdata
  void write() {
    box.put("Folder List", folerDsc);
    box.put("Back Side", folerDsc2);
    box.put("Color", folerDsc3);
  }

  void frontSidewrite(int index, String value, String value2, Color value3) {
    String key = folerDsc.keys.elementAt(index);
    //dodanie przedniej strony fiszki
    box.get("Folder List");
    folerDsc[key]!.add(value);
    box.put("Folder List", folerDsc);
    //dodanie tylnej strony fiszki
    box.get("Back side");
    folerDsc2[key]!.add(value2);
    box.put("Back side", folerDsc2);
    //dodanie poziomu zapamiętania fiszki
    box.get("Color");
    folerDsc3[key]!.add(value3);
    box.put("Color", folerDsc3);
  }

//read Folderdata
  void read() {
    folerDsc = box.get("Folder List", defaultValue: {});
    folerDsc2 = box.get("Back side", defaultValue: {});
    folerDsc3 = box.get("Color", defaultValue: {});
  }
}
