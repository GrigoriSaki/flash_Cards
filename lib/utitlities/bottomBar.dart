// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'dart:ffi';

import 'package:flash_cards/hiveData.dart';
import 'package:flutter/material.dart';

import '../homePage.dart';

class NavBottomBar extends StatelessWidget {
  final sortFunc;
  NavBottomBar({super.key, required this.sortFunc});

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
                  return sortFunc();
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
