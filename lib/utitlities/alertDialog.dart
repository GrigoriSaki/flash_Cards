// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, void_checks, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAlertdialog extends StatelessWidget {
  var textController;
  final onCancelF;
  final onConfirmF;
  String title;
  MyAlertdialog(
      {super.key,
      required this.onCancelF,
      required this.onConfirmF,
      required this.textController,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Container(
          width: 280,
          child: Text(
            title,
            style: GoogleFonts.inter(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      content: Container(
        height: 150,
        decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextSelectionTheme(
            data:
                TextSelectionThemeData(selectionHandleColor: Color(0xFF15142e)),
            child: TextFormField(
              controller: textController,
              cursorColor: Colors.black,
              maxLines: 3,
              maxLength: 70,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              buildCounter: (context,
                  {required currentLength, required isFocused, maxLength}) {
                return null;
              },
              style: GoogleFonts.inter(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Tytuł",
                  hintStyle: GoogleFonts.inter(fontSize: 20)),
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
            style: ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
                backgroundColor: WidgetStatePropertyAll(Colors.blueGrey[200])),
            onPressed: () {
              return onCancelF();
            },
            child: Text(
              "Anuluj",
              style: GoogleFonts.inter(
                  fontSize: 24,
                  color: Color(0xFF15142e),
                  fontWeight: FontWeight.w500),
            )),
        TextButton(
            style: ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
                backgroundColor: WidgetStatePropertyAll(Colors.blueGrey[200])),
            onPressed: () {
              return onConfirmF();
            },
            child: Text(
              "Ok",
              style: GoogleFonts.inter(
                  fontSize: 24,
                  color: Color(0xFF15142e),
                  fontWeight: FontWeight.w500),
            ))
      ],
    );
  }
}
