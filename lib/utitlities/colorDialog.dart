// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorDialog extends StatelessWidget {
  const ColorDialog({super.key});

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
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.circleDot,
                      size: 40,
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
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.circleDot,
                      size: 40,
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
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.circleDot,
                      size: 40,
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
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.circleDot,
                      size: 40,
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
