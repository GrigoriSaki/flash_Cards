// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  final box = Hive.box("myBox");
  List<String> folerDsc = [];
  Map<String, List<String>> frontSideTxt = {};
  Map<String, List<String>> backSideTxt = {};
  Map<String, List<Color>> flashColor = {};

  //create data, run this if this is the first time when app is openning

  void createInitialData() {
    folerDsc = ["Podstawowe zwroty", "Podróże", "Jedzenie na wakacjach"];
    frontSideTxt = {for (var key in folerDsc) key: []};
    backSideTxt = {for (var key in folerDsc) key: []};
    flashColor = {for (var key in folerDsc) key: []};
    write();
  }

//write Folderdata
  void write() {
    box.put("Folder List", folerDsc);
    box.put("FrontSide", frontSideTxt);
    box.put("BackSide", backSideTxt);

    var flashColorAsInt = flashColor.map((key, value) =>
        MapEntry(key, value.map((color) => color.value).toList()));
    box.put("Color", flashColorAsInt);
  }

//read Folderdata
  void read() {
    folerDsc = box.get("Folder List");
    frontSideTxt = Map<String, List<String>>.from(box.get("FrontSide"));
    backSideTxt = Map<String, List<String>>.from(box.get("BackSide"));
    var flashColorAsInt = Map<String, List<int>>.from(box.get("Color"));
    flashColor = flashColorAsInt.map((key, value) =>
        MapEntry(key, value.map((colorValue) => Color(colorValue)).toList()));
  }

// this function write only new,added or modified flashcards to the base, without the folders
//simplier func of write()
  void writeOnlyCards() {
    box.put("FrontSide", frontSideTxt);
    box.put("BackSide", backSideTxt);

    var flashColorAsInt = flashColor.map((key, value) =>
        MapEntry(key, value.map((color) => color.value).toList()));
    box.put("Color", flashColorAsInt);
  }

  void checking() {
    print(box.get("FrontSide"));
    print(backSideTxt);
    print(flashColor);
  }
}
