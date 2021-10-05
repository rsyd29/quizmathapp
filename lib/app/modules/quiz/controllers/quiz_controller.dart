import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizmathapp/app/model/model_pertanyaan.dart';
import 'package:quizmathapp/app/routes/app_pages.dart';

class QuizController extends GetxController {
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Color(0xff117eeb);

  final isPressed = false.obs;
  final score = 0.obs;
  final selectedPagexNumber = 0.obs;

  bool get isLastPage =>
      selectedPagexNumber.value == semuaPertanyaan.length - 1;

  var pageControll = PageController();

  forwardAct() {
    if (isLastPage)
      Get.offNamedUntil(Routes.RESULT, (route) => false);
    else
      pageControll.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<ModelPertanyaan> semuaPertanyaan = [
    ModelPertanyaan(
      "1 + 1 Hasilnya berapa?", // pertanyaan String
      {
        // Map<String, bool>
        "Jendela": false, // A
        "2": true, // B
        "4": false, // C
        "11": false, // D
      },
    ),
    ModelPertanyaan(
      "Setelah angka 0 apa ya?",
      {
        "-1": false,
        "2": false,
        "1": true,
        "0": false,
      },
    ),
    ModelPertanyaan(
      "Semua bilang yang dapat dibagi dengan dirinya sendiri disebut apa ya?",
      {
        "Bilangan prima": true,
        "Bilangan bulat": false,
        "Bilangan cacah": false,
        "Bilangan rasional": false,
      },
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
