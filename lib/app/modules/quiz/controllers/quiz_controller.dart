import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:get/get.dart';
import 'package:quizmathapp/app/model/model_pertanyaan.dart';
import 'package:quizmathapp/app/routes/app_pages.dart';

class QuizController extends GetxController {
  late TeXViewRenderingEngine renderingEngine;

  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Color(0xff117eeb);

  final isPressed = false.obs;
  final score = 0.obs;
  final hasilScoreAkhir = 0.0.obs;
  final selectedPagexNumber = 0.obs;
  final semuaPertanyaan = 0.obs;
  final pernyataanScore = "".obs;

  bool get isLastPage => selectedPagexNumber.value == semuaPertanyaan.value - 1;

  var pageControll = PageController();

  forwardAct() {
    if (isLastPage) {
      hasilScoreAkhir.value = (score.value * 100) / semuaPertanyaan.value;
      if (hasilScoreAkhir.value >= 60 && hasilScoreAkhir.value <= 100) {
        pernyataanScore.value = "Wahh.. Kamu Hebat";
      } else {
        pernyataanScore.value = "Kamu belajar lagi ya..";
      }
      Get.offNamed(Routes.RESULT, arguments: [
        hasilScoreAkhir.value,
        pernyataanScore.value,
      ]);
    } else
      pageControll.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  @override
  void onInit() {
    super.onInit();
    renderingEngine = const TeXViewRenderingEngine.katex();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
