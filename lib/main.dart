import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/binding.dart';
import 'package:tasks/databas/network/dio_helper.dart';
import 'package:tasks/services/theme_services.dart';
import 'package:tasks/ui/components_to_use/constants/constants.dart';

import 'package:get_storage/get_storage.dart';
import 'package:tasks/ui/pages/main_pages/splash_page.dart';
import 'databas/local/db/db_helper.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  //to initialize the step between the widget and the rendering engine
  // The glue between the components_to_use layer and the Flutter engine.
  WidgetsFlutterBinding.ensureInitialized();
  //to initialize database class to be create it only you open the app
  await DBHelper.initDb();
  await DioHelper.init();
  //initialize get storage to get it only when open the app
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //initialize get storage to get it only when open the app
  await GetStorage.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const MySplashPage(),
        )
      ],
    );
  }
}

// Widget _getLandingPage()  {
//   return GetBuilder(
//     //init: AuthViewModel(),
//     builder: (_) {
//       if (AuthViewModel().user?.isEmpty==true) {
//         return LoginScreen();
//       } else {
//         return const HomePage();
//       }
//     },
//   );
// }






