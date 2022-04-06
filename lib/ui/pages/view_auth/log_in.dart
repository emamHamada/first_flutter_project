import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/ui/pages/view_auth/sign_up.dart';

import '../../../controllers/auth_view_model_Controller.dart';
import '../../components_to_use/constants/constants.dart';
import '../../components_to_use/reused/button.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  LoginScreen({Key? key}) : super(key: key);
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
              children: [
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myCustomText(
                      text: 'Welcome,',
                      color: color5,
                      size: 30,
                      bolden: FontWeight.bold,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignUp());
                      },
                      child: myCustomText(
                        text: 'SIGNUP',
                        color: color5,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 60),
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
                const SizedBox(height: 25),
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
                const SizedBox(height: 15),
                myCustomText(
                  align: Alignment.topRight,
                  text: 'Forget Password?',
                  color: Colors.black.withOpacity(.5),
                  size: 12,
                  bolden: FontWeight.normal,
                  padding: const EdgeInsets.only(right: 20),
                ),
                const SizedBox(height: 20),
                myButton(
                  label: myCustomText(
                    text: 'SIGN IN',
                  ),
                  onTap: () {
                    _formKey.currentState?.save();
                    if (_formKey.currentState!.validate()) {
                      controller.signInWithEmailAndPass();
                    }
                  },
                ),
                myDivider,
                myButton(
                  onTap: () {
                    controller.signInWithFacebook();
                  },
                  label: myCustomText(
                    text: 'SIGN IN With Facebook',
                  ),
                ),
                myDivider,
                myButton(
                  onTap: () {
                    controller.googleSignInMethod();
                  },
                  label: myCustomText(
                    text: 'SIGN IN With Google',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
