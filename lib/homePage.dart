// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flash_cards/utitlities/folderCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      floatingActionButton: addFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return FolderCard();
          }),
    );
  }

  Widget addFAB() {
    return FloatingActionButton.extended(
        backgroundColor: Color(0xff0ec298),
        onPressed: () {},
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
}
