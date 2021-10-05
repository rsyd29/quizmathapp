import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizmathapp/app/routes/app_pages.dart';

class ResultView extends GetView {
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
            'ResultView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
