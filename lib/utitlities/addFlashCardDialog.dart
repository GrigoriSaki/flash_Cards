// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AddFlashCardDialog extends StatelessWidget {
  String title;
  TextEditingController myController;
  TextEditingController myController2;
  final onSave;

  AddFlashCardDialog({
    super.key,
    required this.title,
    required this.myController,
    required this.myController2,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 450,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 24),
              ),
              SizedBox(
                height: 25,
              ),
              TextSelectionTheme(
                data: TextSelectionThemeData(
                    selectionHandleColor: Color(0xFF15142e)),
                child: TextFormField(
                  style: GoogleFonts.inter(
                      fontSize: 22, fontWeight: FontWeight.w500),
                  cursorColor: Colors.black,
                  controller: myController,
                  maxLength: 60,
                  maxLines: 3,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      counterText: "",
                      hintText: "Tekst",
                      hintStyle: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextSelectionTheme(
                data: TextSelectionThemeData(
                    selectionHandleColor: Color(0xFF15142e)),
                child: TextFormField(
                  style: GoogleFonts.inter(
                      fontSize: 22, fontWeight: FontWeight.w500),
                  maxLength: 60,
                  maxLines: 3,
                  cursorColor: Colors.black,
                  controller: myController2,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      counterText: "",
                      hintText: "Tłumaczenie",
                      hintStyle: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      border: InputBorder.none),
                ),
              ),
              Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      return onSave();
                    },
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xFF15142e))),
                    child: Text(
                      "Zapisz",
                      style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        myController.clear();
                        myController2.clear();
                      },
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xFF15142e))),
                      child: Text(
                        "Anuluj",
                        style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
