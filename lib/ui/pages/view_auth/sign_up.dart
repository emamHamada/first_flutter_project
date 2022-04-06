import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_view_model_Controller.dart';

import '../../components_to_use/constants/constants.dart';
import '../../components_to_use/reused/button.dart';

class SignUp extends GetWidget<AuthViewModel> {
  SignUp({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: color5,
                    )),
                const SizedBox(height: 30),
                myCustomText(
                  text: 'SIGN UP,',
                  color: color5,
                  size: 30,
                  bolden: FontWeight.bold,
                ),
                const SizedBox(height: 50),
                myCustomTextFormField(
                  hint: 'Hamada',
                  label: 'Name',
                  onSaved: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'name  must not be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                myCustomTextFormField(
                  hint: 'email@email.com',
                  label: 'Email',
                  onSaved: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'email  must not be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                myCustomTextFormField(
                  hint: '**************',
                  label: 'Password',
                  onSaved: (value) {
                    controller.pass = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'pass  must not be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                myButton(
                  label: myCustomText(
                    text: 'SIGN UP',
                  ),
                  onTap: () {
                    _formKey.currentState?.save();
                    if (_formKey.currentState!.validate()) {
                      controller.createAccount();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
