// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:ffi';
import 'dart:math';

import 'package:flash_cards/homePage.dart';
import 'package:flash_cards/utitlities/addFlashCardDialog.dart';
import 'package:flash_cards/utitlities/bottomBar.dart';
import 'package:flash_cards/utitlities/flashCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FLashCardsPage extends StatefulWidget {
  String description = "";
  String description2 = "";
  final textController = TextEditingController();
  final textController2 = TextEditingController();
  late TextEditingController controllerFront;
  late TextEditingController controllerBack;

  List<String> frontSideList;
  List<String> backSideList;

  List<Color> chooseColor;
  String folderDesc;

  FLashCardsPage({
    super.key,
    required this.chooseColor,
    required this.folderDesc,
    required this.frontSideList,
    required this.backSideList,
  });

  @override
  State<FLashCardsPage> createState() => _FLashCardsPageState();
}

class _FLashCardsPageState extends State<FLashCardsPage> {
  @override
  void initState() {
    widget.controllerFront = TextEditingController(text: widget.description);
    widget.controllerBack = TextEditingController(text: widget.description2);

    super.initState();
  }

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
                          widget.folderDesc,
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
                    deleteCard: (conext) {
                      setState(() {
                        widget.frontSideList.removeAt(index);
                        widget.backSideList.removeAt(index);
                        widget.chooseColor.removeAt(index);
                      });
                    },
                    editFunc: () {
                      showDesc(index);
                      editFlashCard(context, index);
                    },
                    frontSideText: widget.frontSideList[index],
                    backSideText: widget.backSideList[index],
                    dotColor: widget.chooseColor[index],
                    good_: () {
                      setState(() {
                        widget.chooseColor[index] = Colors.green;
                        Navigator.pop(context);
                      });
                    },
                    notWell_: () {
                      setState(() {
                        widget.chooseColor[index] = Colors.amber;
                        Navigator.pop(context);
                      });
                    },
                    veryBad_: () {
                      setState(() {
                        widget.chooseColor[index] = Colors.red;
                        Navigator.pop(context);
                      });
                    },
                    notSelect_: () {
                      setState(() {
                        widget.chooseColor[index] = Color(0xFF15142e);
                        Navigator.pop(context);
                      });
                    },
                  );
                }, childCount: widget.frontSideList.length)),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 240,
                  ),
                )
              ],
            ),
          ),
          Positioned(bottom: 0, right: 0, left: 0, child: NavBottomBar()),
        ],
      ),
    );
  }

  Widget addFAB(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xff0ec298),
      onPressed: () {
        showAddDialog(context);
      },
      child: Icon(
        Icons.add,
        color: Color(0xFF15142e),
        size: 42,
      ),
    );
  }

  void showAddDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddFlashCardDialog(
            title: "Dodaj nową fiszkę",
            onSave: () {
              setState(() {
                widget.frontSideList.add(widget.textController.text);
                widget.backSideList.add(widget.textController2.text);
                widget.chooseColor.add(Color(0xFF15142e));
                widget.textController.clear();
                widget.textController2.clear();
                Navigator.pop(context);
              });
            },
            myController: widget.textController,
            myController2: widget.textController2,
          );
        });
  }

  editFlashCard(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (
          BuildContext context,
        ) {
          return AddFlashCardDialog(
              title: "Edytuj swoją fiszkę",
              myController: widget.controllerFront,
              myController2: widget.controllerBack,
              onSave: () {
                setState(() {
                  widget.frontSideList[index] = widget.controllerFront.text;
                  widget.backSideList[index] = widget.controllerBack.text;
                  widget.chooseColor[index] = Color(0xFF15142e);

                  Navigator.pop(context);
                });
              });
        });
  }

  void showDesc(index) {
    setState(() {
      widget.description = widget.frontSideList[index];
      widget.controllerFront.text = widget.description;

      widget.description2 = widget.backSideList[index];
      widget.controllerBack.text = widget.description2;
    });
  }
}
