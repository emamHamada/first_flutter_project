import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/controllers/auth_view_model_Controller.dart';
import 'package:tasks/controllers/customdrawer_controller.dart';
import 'package:tasks/ui/pages/note_pages/note_home_page.dart';

import '../../../services/theme_services.dart';
import '../../components_to_use/common_components/comon_components.dart';
import '../main_pages/splash_page.dart';

class CustomDrawer extends GetWidget<CustomDrawerController> {
  CustomDrawer({Key? key}) : super(key: key);
  double x = 45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CustomDrawerController>(
            init: CustomDrawerController(),
            builder: (logic) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GetBuilder<CustomDrawerController>(builder: (logic) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 40, left: 100),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            buildCircleAvatar(
                                radius: x, photo: logic.profilePhoto),
                            buildCircleAvatar(
                                radius: 9.0, photo: logic.profilePhoto),
                          ],
                        ),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 50),
                      child: buildText(text: 'Profile', fontSize: 30.0),
                    ),
                    buildMyDivider(logic),
                    buildListTile(
                      icon: logic.setTitleModee
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                      logic: logic,
                      onTap: () {
                        ThemeServices().switchTheme();
                        logic.setTitleMode();
                      },
                      title: logic.setTitleModee ? 'DarkMode' : 'LiteMode',
                    ),
                    buildMyDivider(logic),
                    buildListTile(
                      title: 'My Notes',
                      onTap: () {
                        Get.to(() => const NoteHomePage());
                      },
                      logic: logic,
                      icon: Icons.sticky_note_2_outlined,
                    ),
                    buildMyDivider(logic),
                    buildListTile(
                      logic: logic,
                      onTap: () async {
                        AuthViewModel().signOut();
                         Get.put(AuthViewModel());
                        Get.to(AuthViewModel());

                      },
                      title: 'Log Out',
                      icon: Icons.logout_sharp,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
