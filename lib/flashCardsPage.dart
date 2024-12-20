// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print

import 'dart:ffi';
import 'dart:math';

import 'package:flash_cards/hiveData.dart';
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
  String myKey;
  final colorOrder = {
    Color(0xFF15142e): 0,
    Color(0xfff44336): 1,
    Color(0xffffc107): 2,
    Color(0xff4caf50): 3
  };

  List<String> frontSideList;
  List<String> backSideList;

  String folderDesc;

  FLashCardsPage({
    super.key,
    required this.myKey,
    required this.folderDesc,
    required this.frontSideList,
    required this.backSideList,
  });

  @override
  State<FLashCardsPage> createState() => _FLashCardsPageState();
}

class _FLashCardsPageState extends State<FLashCardsPage> {
  HiveData hd = HiveData();

  @override
  void initState() {
    widget.controllerFront = TextEditingController(text: widget.description);
    widget.controllerBack = TextEditingController(text: widget.description2);

    hd.read();

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
                        hd.flashColor[widget.myKey]?.removeAt(index);
                      });
                      hd.writeOnlyCards();
                    },
                    editFunc: () {
                      showDesc(index);
                      editFlashCard(context, index);
                    },
                    frontSideText: widget.frontSideList[index],
                    backSideText: widget.backSideList[index],
                    dotColor: hd.flashColor[widget.myKey]?[index],
                    good_: () {
                      hd.flashColor[widget.myKey]?[index] = Colors.green;
                      hd.writeOnlyCards();
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    notWell_: () {
                      hd.flashColor[widget.myKey]?[index] = Colors.amber;
                      hd.writeOnlyCards();
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    veryBad_: () {
                      hd.flashColor[widget.myKey]?[index] = Colors.red;
                      hd.writeOnlyCards();
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    notSelect_: () {
                      hd.flashColor[widget.myKey]?[index] = Color(0xFF15142e);
                      hd.writeOnlyCards();
                      setState(() {
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
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: NavBottomBar(
                sortFunc: () {
                  print(
                      "Before read: ${hd.frontSideTxt} ------ colors: ${hd.flashColor}");
                  hd.read();
                  print(
                      "AFTER read: ${hd.frontSideTxt} ------ colors: ${hd.flashColor}");
                  setState(() {
                    final colors = hd.flashColor[widget.myKey]!;

                    final indices = List<int>.generate(colors.length, (i) => i);

                    indices.sort((a, b) {
                      final priorityA = widget.colorOrder[colors[a]] ?? 999;
                      final priorityB = widget.colorOrder[colors[b]] ?? 999;
                      return priorityA.compareTo(priorityB);
                    });

                    hd.frontSideTxt[widget.myKey] = [
                      for (var i in indices) hd.frontSideTxt[widget.myKey]![i]
                    ];
                    hd.backSideTxt[widget.myKey] = [
                      for (var i in indices) hd.backSideTxt[widget.myKey]![i]
                    ];

                    hd.flashColor[widget.myKey] = [
                      for (var i in indices) colors[i]
                    ];

                    widget.frontSideList = hd.frontSideTxt[widget.myKey]!;
                    widget.backSideList = hd.backSideTxt[widget.myKey]!;
                    hd.write();
                  });
                  print(
                      "AFTER WRITE: ${hd.frontSideTxt} ------ colors: ${hd.flashColor}");
                },
              )),
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

  void showAddDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddFlashCardDialog(
            title: "Dodaj nową fiszkę",
            onSave: () {
              hd.frontSideTxt[widget.myKey]?.add(widget.textController.text);
              hd.backSideTxt[widget.myKey]?.add(widget.textController2.text);
              hd.flashColor[widget.myKey]?.add(Color(0xFF15142e));
              hd.write();
              widget.textController.clear();
              widget.textController2.clear();
              setState(() {
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
                hd.frontSideTxt[widget.myKey]?[index] =
                    widget.controllerFront.text;
                hd.backSideTxt[widget.myKey]?[index] =
                    widget.controllerBack.text;
                hd.flashColor[widget.myKey]?[index] = Color(0xFF15142e);
                hd.write();
                setState(() {
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
