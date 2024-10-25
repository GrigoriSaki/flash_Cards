// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashCard extends StatefulWidget {
  FlashCard({super.key});

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
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: isSelected ? 150 : 300,
          width: double.infinity,
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12)),
          child: Stack(
            children: [
              Positioned(
                child: Icon(Icons.circle),
                top: 10,
                right: 10,
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                child: Column(
                  key: ValueKey(isCentered),
                  mainAxisAlignment: isCentered
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 10,
                        ),
                        Icon(Icons.edit),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          maxLines: 2,
                          "moja pierwsza fiszka",
                          style: GoogleFonts.inter(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 400),
                      opacity: (!isSelected) ? 1.0 : 0.0,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.edit),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "my first flashcard",
                            style: GoogleFonts.inter(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
