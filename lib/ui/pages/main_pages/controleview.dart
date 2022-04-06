import 'package:get/get.dart';
import 'package:tasks/controllers/auth_view_model_Controller.dart';
import 'package:tasks/ui/pages/view_auth/log_in.dart';
import 'package:flutter/material.dart';

import '../drawer/drawer.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : const NavigationDrawer();
    });
  }
}
