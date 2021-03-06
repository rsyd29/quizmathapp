import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizmathapp/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import 'package:flutter/services.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // Membuat device orientation always up (portrait)
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    final heightApp = Get.height -
        context.mediaQueryPadding.top -
        context.mediaQueryPadding.bottom;

    final widthApp = Get.width;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
        title: Text('QuizMathApp'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: "Keluar Aplikasi",
                middleText: "Apakah kamu yakin ingin keluar dari aplikasi?",
                textCancel: "Batal",
                textConfirm: "Ya",
                confirmTextColor: Colors.white,
                onCancel: () {
                  Get.back();
                },
                onConfirm: () {
                  SystemNavigator.pop();
                },
              );
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuCardApp(
                  widthApp: widthApp,
                  heightApp: heightApp,
                  text: "Materi",
                  color: Colors.blue[50]!,
                  onTap: () => Get.toNamed(Routes.MATERI),
                ),
                MenuCardApp(
                  widthApp: widthApp,
                  heightApp: heightApp,
                  text: "Quiz",
                  color: Colors.blue[100]!,
                  onTap: () => Get.toNamed(Routes.QUIZINFO),
                ),
                MenuCardApp(
                  widthApp: widthApp,
                  heightApp: heightApp,
                  text: "Informasi",
                  color: Colors.blue[200]!,
                  onTap: () => Get.toNamed(Routes.INFORMASI),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuCardApp extends StatelessWidget {
  const MenuCardApp({
    Key? key,
    required this.widthApp,
    required this.heightApp,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final double widthApp;
  final double heightApp;
  final String text;
  final Color color;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: widthApp,
          height: heightApp * 0.333 - (16 * 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
