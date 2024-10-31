import 'package:flutter/material.dart';

import '../homePage.dart';

class NavBottomBar extends StatelessWidget {
  const NavBottomBar({super.key});

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
                onPressed: () {},
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

class Notch extends StatelessWidget {
  const Notch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 69,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          color: Colors.white.withOpacity(0.2)),
    );
  }
}
