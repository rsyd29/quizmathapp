import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizmathapp/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:quizmathapp/app/routes/app_pages.dart';

class ResultView extends GetView<QuizController> {
  @override
  Widget build(BuildContext context) {
    bool shouldPop = true;
    return WillPopScope(
      onWillPop: () async {
        Get.offNamedUntil(Routes.HOME, (route) => false);
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('QuizMathApp'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.offNamedUntil(Routes.HOME, (route) => false),
            icon: Icon(Icons.home),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Kamu mendapatkan nilai :',
                style: GoogleFonts.poppins().copyWith(fontSize: 24),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                Get.arguments[0].toStringAsFixed(2),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Text(Get.arguments[1].toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Icon(Icons.home),
              SizedBox(
                height: 16,
              ),
              Text('Mau belajar lagi?'),
              ElevatedButton(
                onPressed: () =>
                    Get.offNamedUntil(Routes.MATERI, (route) => true),
                child: Text("Klik Di Sini"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
