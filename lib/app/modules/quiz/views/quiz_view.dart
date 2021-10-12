import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quizmathapp/app/routes/app_pages.dart';
import '../controllers/quiz_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuizView extends GetView<QuizController> {
  @override
  Widget build(BuildContext context) {
    final heighApp = Get.height -
        context.mediaQueryPadding.top -
        context.mediaQueryPadding.bottom;

    final widthApp = Get.width;

    Color mainColor = Color(0xff252c4a);
    Color secondColor = Color(0xff117eeb);

    return Scaffold(
      backgroundColor: mainColor,
      body: StreamBuilder<QuerySnapshot>(
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

              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pageControll,
                  onPageChanged: controller.selectedPagexNumber,
                  itemCount: dataPertanyaan.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 12),
                          child: Text("QuizMathApp",
                              style: TextStyle(
                                  color: Color(0xff454a63), fontSize: 24)),
                        ),
                        Obx(() => SizedBox(
                              width: widthApp,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Pertanyaan ${index + 1}/${dataPertanyaan.length}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 24,
                                    ),
                                  ),
                                  new CircularPercentIndicator(
                                      radius: 60.0,
                                      lineWidth: 5.0,
                                      percent: controller.score.toDouble() /
                                          dataPertanyaan.length,
                                      center: new Text(
                                          "${((controller.score.value / dataPertanyaan.length) * 100).toStringAsFixed(2)}",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      progressColor: Colors.blue),
                                ],
                              ),
                            )),
                        Divider(
                          color: Colors.white,
                          height: 10,
                          thickness: 1,
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          dataPertanyaan[index]['pertanyaan'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        for (int i = 0;
                            i < dataPertanyaan[index]['jawaban'].length;
                            i++)
                          Obx(
                            () => Container(
                              width: widthApp,
                              margin: EdgeInsets.only(bottom: 18.0),
                              child: MaterialButton(
                                shape: StadiumBorder(),
                                color: controller.isPressed.value
                                    ? dataPertanyaan[index]['jawaban']
                                            .values
                                            .toList()[i]
                                        ? controller.isTrue
                                        : controller.isWrong
                                    : secondColor,
                                padding: EdgeInsets.symmetric(vertical: 18.0),
                                onPressed: controller.isPressed.value
                                    ? () {
                                        print(dataPertanyaan[index]['jawaban']
                                            .values
                                            .toList()[i]);
                                      }
                                    : () {
                                        controller.semuaPertanyaan.value =
                                            dataPertanyaan.length;
                                        controller.isPressed.value = true;
                                        if (dataPertanyaan[index]['jawaban']
                                            .values
                                            .toList()[i]) {
                                          controller.score.value += 1;
                                          print(controller.score);
                                        }
                                        print(dataPertanyaan[index]['jawaban']
                                            .values
                                            .toList()[i]);
                                      },
                                child: Text(
                                  dataPertanyaan[index]['jawaban']
                                      .keys
                                      .toList()[i],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        SizedBox(height: 8),
                        // Obx(() => (controller.isPressed.value == true)
                        //     ? Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           ElevatedButton(
                        //               onPressed: () {}, child: Text("Check")),
                        //         ],
                        //       )
                        //     : SizedBox()),
                        // SizedBox(
                        //   height: 16.0,
                        // ),
                        Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                  onPressed: () => Get.offNamed(Routes.HOME),
                                  child: Text(
                                    "Keluar dari Quiz",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 2, color: Colors.blue[100]!)),
                                  onPressed: controller.isPressed.value
                                      ? () {
                                          controller.isPressed.value = false;
                                          print(controller
                                              .selectedPagexNumber.value);

                                          controller.forwardAct();
                                        }
                                      : () {
                                          print(
                                              dataPertanyaan[index]['jawaban']);
                                        },
                                  child: Text(
                                    (controller.isLastPage)
                                        ? "Hasil"
                                        : "Pertanyaan Selanjutnya",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}
