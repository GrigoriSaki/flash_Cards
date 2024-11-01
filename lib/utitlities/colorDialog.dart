// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last, unused_import, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flash_cards/flashCardsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorDialog extends StatelessWidget {
  ColorDialog(
      {super.key,
      required this.good,
      required this.notWell,
      required this.veryBad,
      required this.notSelect});
  final VoidCallback good;
  final VoidCallback notWell;
  final VoidCallback veryBad;
  final VoidCallback notSelect;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[100],
      child: Container(
        margin: EdgeInsets.all(25),
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Wybierz poziom zapamiętania:",
              style:
                  GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      notSelect();
                    },
                    icon: Icon(
                      FontAwesomeIcons.circleDot,
                      size: 40,
                      color: Color(0xFF15142e),
                    )),
                Container(
                  child: Text("Nie wybrano",
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                  width: 150,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      good();
                    },
                    icon: Icon(
                      FontAwesomeIcons.circleDot,
                      size: 40,
                      color: Colors.green,
                    )),
                Container(
                  child: Text("Dobrze",
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                  width: 150,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    hoverColor: Colors.black,
                    onPressed: () {
                      notWell();
                    },
                    icon: Icon(
                      FontAwesomeIcons.circleDot,
                      size: 40,
                      color: Colors.amber,
                    )),
                Container(
                  child: Text("Słabo",
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                  width: 150,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      veryBad();
                    },
                    icon: Icon(
                      FontAwesomeIcons.circleDot,
                      size: 40,
                      color: Colors.red,
                    )),
                Container(
                  child: Text("Bardzo słabo",
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                  width: 150,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
