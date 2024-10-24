// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable, unused_import

import 'package:flash_cards/homePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FLashCardsPage extends StatefulWidget {
  List<String> folderDesc;
  int indexList;
  FLashCardsPage(
      {super.key, required this.folderDesc, required this.indexList});

  @override
  State<FLashCardsPage> createState() => _FLashCardsPageState();
}

class _FLashCardsPageState extends State<FLashCardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff0ec298)),
        backgroundColor: Color(0xFF15142e),
        title: Text(
          widget.folderDesc[widget.indexList],
          style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Color(0xff0ec298)),
        ),
      ),
      body: Container(
        color: Color(0xFF15142e),
      ),
    );
  }
}
