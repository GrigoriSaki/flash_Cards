// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flash_cards/utitlities/alertDialog.dart';
import 'package:flash_cards/utitlities/folderCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<String> folerDsc = [
    "Podstawowe zwroty",
    "Rodzina",
    "Wakacje z najlepszym jedzeniami na wakacjach gdzie nie było nic dobrego co"
  ];

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
      body: ListView.builder(
          itemCount: folerDsc.length,
          itemBuilder: (BuildContext context, int index) {
            return FolderCard(
              fDescrip: folerDsc[index],
            );
          }),
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
            onCancelF: () {
              Navigator.pop(context);
            },
            onConfirmF: () {
              Navigator.pop(context);
            },
          );
        });
  }
}