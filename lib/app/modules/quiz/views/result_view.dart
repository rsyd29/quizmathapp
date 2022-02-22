import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizmathapp/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';

import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  @override
  Widget build(BuildContext context) {
    bool shouldPop = true;
    return WillPopScope(
      onWillPop: () async {
        Get.offNamedUntil(Routes.HOME, (route) => false);
        return shouldPop;
      },
      child: GetBuilder<ResultController>(initState: (_) {
        controller.playSound(
            'https://firebasestorage.googleapis.com/v0/b/quiz-math-app-test.appspot.com/o/sound%2FADEKVWP-cheering-crowd.mp3?alt=media&token=df017621-4ba4-4fa0-8114-1447c143be79');
        controller.audioPlayer.setReleaseMode(ReleaseMode.LOOP);
        print('audioPlayer jalan');
      }, builder: (logic) {
        return Scaffold(
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
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Container(
                  width: Get.width * 0.2,
                  child: Lottie.asset('assets/icon/clapping-hands.json'),
                ),
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
        );
      }),
    );
  }
}
