import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/components_to_use/constants/constants.dart';
import '../ui/pages/drawer/drawer.dart';

class DashBoardController extends GetxController {
  IconData icon = Icons.arrow_forward_ios;

  openDrawer(context) {
    NavigationDrawer.of(context)?.toggle();
    update();
  }

  setIcon() async {
    if (icon == Icons.arrow_forward_ios) {
      icon = Icons.arrow_back_ios;

      update();
    } else {
      icon = Icons.arrow_forward_ios;
      update();
    }
  }
  buildCard({items}) {
    GestureDetector(
      onTap: () {
        items['onTap'];
      },
      child: Card(
        color: Colors.indigo.shade500.withOpacity(.5),
        clipBehavior: Clip.hardEdge,
        elevation: 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(items['img'], width: 60),
            const SizedBox(height: 14),
            Text(
              items['title'],
              style: body1Style,
            ),
            const SizedBox(height: 8),
            Text(
              items['subtitle'],
              style: body2Style,
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
    update();
  }

}
