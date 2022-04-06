import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasks/controllers/auth_view_model_Controller.dart';

class CustomDrawerController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  File? pickedImage;
  var profilePhoto = NetworkImage(AuthViewModel().photo ??
      "https://th.bing.com/th/id/OIP.GRNYUcGHniRqD5mchzewvwHaH6?pid=ImgDet&rs=1");

  fetchImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) {
        return;
      } else {
        final imageTemporarly = File(image!.path);
        update([pickedImage = imageTemporarly]);
      }
    } on PlatformException catch (error) {
      print('an error happen while picking image $error');
    }
  }

  bool setTitleModee = true;

  setTitleMode() async {
    setTitleModee = !setTitleModee;
    update();
  }
}
