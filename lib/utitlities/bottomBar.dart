// ignore_for_file: prefer_const_constructors

import 'package:flash_cards/hiveData.dart';
import 'package:flutter/material.dart';

import '../homePage.dart';

class NavBottomBar extends StatefulWidget {
  String myKey;
  NavBottomBar({super.key, required this.myKey});

  final colorOrder = {
    Color(0xFF15142e): 0,
    Colors.red: 1,
    Colors.amber: 2,
    Colors.green: 3
  };

  @override
  State<NavBottomBar> createState() => _NavBottomBarState();
}

class _NavBottomBarState extends State<NavBottomBar> {
  HiveData hd = HiveData();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: Colors.black.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return HomePage();
                  }));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    hd.flashColor[widget.myKey]!.sort((a, b) {
                      final priorityA = widget.colorOrder[a] ?? 999;
                      final priorityB = widget.colorOrder[b] ?? 999;
                      return priorityA.compareTo(priorityB);
                    });
                  });
                },
                icon: Icon(
                  Icons.save_as_outlined,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
