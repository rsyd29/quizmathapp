import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: "Quiz Math App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      onInit: () => Timer(
        const Duration(
          seconds: 5,
        ),
        () => Get.offNamed(Routes.HOME),
      ),
    ),
  );
}
