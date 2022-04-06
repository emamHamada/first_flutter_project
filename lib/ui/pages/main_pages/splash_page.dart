import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components_to_use/constants/constants.dart';
import '../../components_to_use/reused/button.dart';

import 'controleview.dart';

class MySplashPage extends StatelessWidget {
  const MySplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 450,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      opacity: .4,
                      image: AssetImage("assets/images/login.png"),
                      fit: BoxFit.fill)),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myCustomText(
                    text: 'Step TO Catch Basic  Flutter Topics',
                    color: color5,
                    size: 30,
                  ),
                  myCustomText(
                    text: 'ConteNts',
                    bolden: FontWeight.w200,
                    color: Colors.blueGrey.shade700,
                    size: 30,
                  ),
                  const SizedBox(height: 40),
                  myCustomText(
                    text: 'We make great work here '
                        'happen with our efforts , just one step to be , there are another one ....',
                    size: 16,
                    color: color5,
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: 150,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: color9),
                    child: myButton(
                      label: ListTile(
                        title: myCustomText(
                          text: 'Lets Go',
                          bolden: FontWeight.w200,
                          color: color10,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.indigo,
                        ),
                      ),
                      onTap: () => Get.to(() => const ControlView()),
                    ),
                  ),
                  const SizedBox(height: 70),
                ],
              ))
        ],
      ),
    );
  }
}
