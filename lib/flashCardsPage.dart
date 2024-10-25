// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable, unused_import, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flash_cards/homePage.dart';
import 'package:flash_cards/utitlities/flashCard.dart';
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
      backgroundColor: Color(0xFF15142e),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: Color(0xff0ec298)),
            floating: true,
            expandedHeight: 100,
            backgroundColor: Color(0xFF15142e),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: Text(
                      "Learn please!",
                      style: GoogleFonts.sixtyfour(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          color: Colors.white,
                          fontSize: 22),
                    ),
                  ),
                ],
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 35.0, right: 20),
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  widget.folderDesc[widget.indexList],
                  style: GoogleFonts.inter(color: Color(0xff0ec298)),
                ),
              ),
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return FlashCard();
          }, childCount: 15))
        ],
      ),
    );
  }
}
