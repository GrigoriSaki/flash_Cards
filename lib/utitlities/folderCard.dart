// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FolderCard extends StatelessWidget {
  String fDescrip;
  FolderCard({super.key, required this.fDescrip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1.8),
            color: Color(0xff91b8af),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            fDescrip,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(fontSize: 24),
          ),
        )),
      ),
    );
  }
}
