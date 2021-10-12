import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:quizmathapp/app/routes/app_pages.dart';

import '../controllers/quizinfo_controller.dart';

class QuizinfoView extends GetView<QuizinfoController> {
  @override
  Widget build(BuildContext context) {
    bool shouldPop = true;
    return WillPopScope(
      onWillPop: () async {
        Get.offNamedUntil(Routes.HOME, (route) => false);
        return shouldPop;
      },
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('quiz').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something Error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                    color: Colors.transparent,
                    child: SpinKitCircle(color: Color(0xff00AFF0), size: 50)),
              );
            } else {
              final dataPertanyaan = snapshot.data!.docs;
              return Scaffold(
                backgroundColor: Colors.lightBlueAccent,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(Icons.arrow_back_ios_new),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Quiz App",
                                  style: TextStyle(
                                      fontSize: 32, color: Colors.white)),
                              Text("Cara mengerjakan quiz",
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white24)),
                              SizedBox(height: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.adb),
                                      Text(
                                          "Terdiri dari ${dataPertanyaan.length} soal"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.adb),
                                      Text("Jawaban berupa pilihan ganda"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.adb),
                                      Flexible(
                                        child: Text(
                                            "Tidak dapat berpindah soal sebelum menjawab soal sebelumnya"),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(Routes.QUIZ);
                                },
                                child: Text("Mulai Quiz"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
