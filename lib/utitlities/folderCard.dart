// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class FolderCard extends StatelessWidget {
  String fDescrip;
  VoidCallback insertChange;
  Function(BuildContext) deleteFolder;

  FolderCard(
      {super.key,
      required this.fDescrip,
      required this.deleteFolder,
      required this.insertChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        startActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            autoClose: true,
            foregroundColor: Colors.white,
            backgroundColor: Colors.white.withOpacity(0.1),
            onPressed: (BuildContext context) => insertChange(),
            icon: Icons.edit_document,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red.withOpacity(0.2),
            onPressed: deleteFolder,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: GestureDetector(
          onDoubleTap: insertChange,
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
        ),
      ),
    );
  }
}
