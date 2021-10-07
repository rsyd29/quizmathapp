import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizmathapp/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:quizmathapp/app/routes/app_pages.dart';

class ResultView extends GetView<QuizController> {
  bool shouldPop = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offNamedUntil(Routes.HOME, (route) => false);
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('ResultView'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'Score: ${(Get.arguments[0] * 100 / Get.arguments[1]).toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
