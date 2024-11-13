// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables, sized_box_for_whitespace, body_might_complete_normally_nullable

import 'package:flash_cards/flashCardsPage.dart';
import 'package:flash_cards/hiveData.dart';
import 'package:flash_cards/utitlities/alertDialog.dart';
import 'package:flash_cards/utitlities/folderCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var box = Hive.box("myBox");
  HiveData hv = HiveData();

  String description = "";
  final folderController = TextEditingController();
  late TextEditingController folderController2;

  late Map<String, List<String>> folerDsc2;
  late Map<String, List<Color>> folerDsc3;

  @override
  void initState() {
    super.initState();
    if (box.get("Folder List") == null) {
      hv.createInitialData();
    } else {
      hv.read();
    }
    folderController2 = TextEditingController(text: description);
    folerDsc2 = {for (var key in hv.folerDsc.keys) key: []};
    folerDsc3 = {for (var key in hv.folerDsc.keys) key: []};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF15142e),
      appBar: AppBar(
        backgroundColor: Color(0xFF15142e),
        title: Center(
          child: Text(
            "FLASH CARDS",
            style: GoogleFonts.sixtyfour(
                textStyle: TextStyle(
                    color: Color(0xff0ec298),
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
      floatingActionButton: addFAB(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        height: 620,
        child: ListView.builder(
            itemCount: hv.folerDsc.length,
            itemBuilder: (BuildContext context, int index) {
              String key = hv.folerDsc.keys.elementAt(index);
              return FolderCard(
                flashCardPageNav: () {
                  navigateToFolder(index);
                },
                deleteFolder: (context) {
                  deleteFunction(index);
                },
                insertChange: () {
                  showDesc(index);
                  showMyChangeDialog(context, index);
                },
                fDescrip: key,
              );
            }),
      ),
    );
  }

  Widget addFAB(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: Color(0xff0ec298),
        onPressed: () => showMyAlertDialog(context),
        label: Row(
          children: [
            Icon(
              Icons.add,
              size: 36,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Add Folder",
              style: GoogleFonts.sixtyfour(fontWeight: FontWeight.w600),
            )
          ],
        ));
  }

  void showMyAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyAlertdialog(
            title: "Dodaj nowy folder",
            textController: folderController,
            onCancelF: () {
              Navigator.pop(context);
              folderController.clear();
              hv.write();
            },
            onConfirmF: () {
              setState(() {
                hv.folerDsc[folderController.text] = [];
                hv.write();

                folderController.clear();
              });
              Navigator.pop(context);
            },
          );
        });
  }

  void deleteFunction(index) {
    String key = hv.folerDsc.keys.elementAt(index);
    setState(() {
      hv.folerDsc.remove(key);
      hv.write();
    });
  }

  void showDesc(index) {
    String key = hv.folerDsc.keys.elementAt(index);
    setState(() {
      description = key;
      folderController2.text = description;
    });
  }

  void showMyChangeDialog(BuildContext context, int index) {
    String oldKey = hv.folerDsc.keys.elementAt(index);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyAlertdialog(
              title: "Edytuj swój folder",
              onCancelF: () {
                Navigator.pop(context);
                hv.write();
              },
              onConfirmF: () {
                setState(() {
                  String newKey = folderController2.text;
                  if (newKey != oldKey) {
                    var value = hv.folerDsc[oldKey];

                    hv.folerDsc.remove(oldKey);
                    hv.folerDsc[newKey] = value!;
                  }
                });

                Navigator.pop(context);
              },
              textController: folderController2);
        });
  }

  void navigateToFolder(index) {
    String key = hv.folerDsc.keys.elementAt(index);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FLashCardsPage(
                  chooseColor: folerDsc3[key] ?? [],
                  frontSideList: hv.folerDsc[key] ?? [],
                  backSideList: folerDsc2[key] ?? [],
                  folderDesc: key,
                )));
  }
}
