import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';
import '../services/firestore_user.dart';
import '../ui/pages/drawer/drawer.dart';
import '../ui/pages/main_pages/splash_page.dart';

class AuthViewModel extends GetxController {
  String? email, pass, name;
  final Rx<User?> _user = _auth.currentUser.obs;

  String? get user => _user.value?.email;

  String? get photo => _user.value?.photoURL;

//we get an instance for use it to google sign in
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  // Type connectionState=ConnectionState;

//we get an instance for use it to google sign in with firebase auth
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookSignIn = FacebookLogin();
  final Stream<User?> _authStateChanges = _auth.authStateChanges();

  @override
  void onInit() {
    super.onInit();

    _user.bindStream(_authStateChanges);
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    debugPrint("$googleUser");
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    UserCredential user = await _auth.signInWithCredential(credential);

    await saveUser(user);
    await Get.off(() => const NavigationDrawer());
    debugPrint("$user");
  }

  void signInWithFacebook() async {
    final FacebookLoginResult result =
        await _facebookSignIn.logIn(permissions: [FacebookPermission.email]);
    debugPrint("$result");

    final String? accessToken = result.accessToken?.token;
    debugPrint("$accessToken");
    if (result.status == FacebookLoginStatus.success) {
      final OAuthCredential facebookCredential =
          FacebookAuthProvider.credential(accessToken!);

      UserCredential user =
          await _auth.signInWithCredential(facebookCredential);

      await saveUser(user);
      await Get.off(() => const NavigationDrawer());
    }

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);
    debugPrint("$facebookAuthCredential");
    FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  void signInWithEmailAndPass() async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email!, password: pass!);

      debugPrint("$user");
      await saveUser(user);
      await Get.off(() => const NavigationDrawer());
    } catch (error) {
      Get.snackbar("Error login Account", error.toString(),
          colorText: Colors.red, snackPosition: SnackPosition.TOP);
    }
  }

  void createAccount() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: pass!)
          .then((user) async {
        debugPrint("$user");
        await saveUser(user);
        await Get.offAll(() => const NavigationDrawer());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (error) {
      Get.snackbar("Error login Account", error.toString(),
          colorText: Colors.red, snackPosition: SnackPosition.TOP);
    }
  }

  Future<void> saveUser(UserCredential user) async {
    await FireStoreUser().addUser(
      UserModel(
        email: user.user?.email,
        name: name ?? user.user?.displayName,
        photo: '',
        userId: user.user?.uid,
      ),
    );
  }

  void signOut() async {
    await _auth.signOut();
    Get.offAll(const MySplashPage());
    update();
  }
}
