// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, sized_box_for_whitespace

import 'package:flash_cards/utitlities/colorDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashCard extends StatefulWidget {
  String frontSideText;
  String backSideText;
  Color? dotColor;
  final VoidCallback good_;
  final VoidCallback notWell_;
  final VoidCallback veryBad_;
  final VoidCallback notSelect_;
  final editFunc;
  Function(BuildContext) deleteCard;

  FlashCard(
      {super.key,
      required this.deleteCard,
      required this.editFunc,
      required this.good_,
      required this.frontSideText,
      required this.backSideText,
      required this.dotColor,
      required this.notWell_,
      required this.veryBad_,
      required this.notSelect_});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  bool isSelected = true;
  bool isCentered = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          isCentered = !isCentered;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Slidable(
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.2),
              onPressed: widget.deleteCard,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            )
          ]),
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            height: isSelected ? 150 : 300,
            width: double.infinity,
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.3),
                      isSelected
                          ? Colors.white.withOpacity(0.3)
                          : Colors.white.withOpacity(0.7),
                    ]),
                borderRadius: BorderRadius.circular(12)),
            child: Stack(
              children: [
                Positioned(
                  child: IconButton(
                      onPressed: () {
                        return showAlertDialog(context);
                      },
                      icon: Icon(
                        FontAwesomeIcons.circleDot,
                        size: 30,
                        color: widget.dotColor,
                      )),
                  top: 5,
                  right: 10,
                ),
                Positioned(
                  child: IconButton(
                      onPressed: () {
                        widget.editFunc();
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 30,
                      )),
                  top: 5,
                  right: 55,
                ),
                Positioned(
                  top: 45,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 10,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 325,
                          child: Text(
                            widget.frontSideText,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 25,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 400),
                    opacity: (!isSelected) ? 1.0 : 0.0,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 325,
                          child: Text(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            widget.backSideText,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAlertDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ColorDialog(
            good: () {
              widget.good_();
            },
            notWell: () {
              widget.notWell_();
            },
            veryBad: () {
              widget.veryBad_();
            },
            notSelect: () {
              widget.notSelect_();
            },
          );
        });
  }
}
