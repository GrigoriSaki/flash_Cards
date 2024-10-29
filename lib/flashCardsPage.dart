// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable, unused_import, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flash_cards/homePage.dart';
import 'package:flash_cards/utitlities/flashCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FLashCardsPage extends StatefulWidget {
  List<String> frontSideList = [
    "Pierwsza Fiszka",
    "Druga Fiszka",
    "Pierwsza Fiszka",
    "Druga Fiszka",
    "Pierwsza Fiszka",
    "Druga Fiszka",
    "Pierwsza Fiszka",
    "Druga Fiszka",
  ];
  List<String> backSideList = [
    "First Flashcard",
    "Second FlashCard",
    "First Flashcard",
    "Second FlashCard",
    "First Flashcard",
    "Second FlashCard",
    "First Flashcard",
    "Second FlashCard"
  ];
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
      floatingActionButton: addFAB(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Color(0xFF15142e),
      body: Stack(
        children: [
          Container(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
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
                          padding: const EdgeInsets.only(left: 25.0, right: 25),
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
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          widget.folderDesc[widget.indexList],
                          style: GoogleFonts.inter(color: Color(0xff0ec298)),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  return FlashCard(
                    frontSideText: widget.frontSideList[index],
                    backSideText: widget.backSideList[index],
                  );
                }, childCount: widget.frontSideList.length))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(
                notchMargin: BorderSide.strokeAlignCenter,
                height: 65,
                color: Colors.black.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.save_as_outlined,
                            color: Colors.white,
                          )),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget addFAB(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xff0ec298),
      onPressed: () {},
      child: Icon(
        Icons.add,
        size: 42,
      ),
    );
  }
}
