import 'package:get/get.dart';
import 'package:tasks/controllers/customdrawer_controller.dart';
import 'package:tasks/controllers/dashboard_controller.dart';

import 'controllers/auth_view_model_Controller.dart';
import 'controllers/note_controllers/task_controller.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => DashBoardController());
    Get.lazyPut(() => TaskController());
    Get.lazyPut(() => CustomDrawerController());
    // Get.lazyPut(() => AddTaskController());
  }
}
