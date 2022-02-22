import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../../webview/views/webview_view.dart';
import '../controllers/materi_controller.dart';

class MateriView extends GetView<MateriController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MateriView'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('materi')
            .orderBy('pelajaran')
            .snapshots(),
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
            final dataMateri = snapshot.data!.docs;
            return ListView.builder(
              itemCount: dataMateri.length,
              itemBuilder: (context, index) {
                var dataMateriIndex = dataMateri[index];
                return Card(
                  margin: EdgeInsets.only(
                      top: (index == 0) ? 8 : 8,
                      left: 16,
                      right: 16,
                      bottom: (index == dataMateri.length - 1) ? 8 : 0),
                  color: Colors.white,
                  child: ListTile(
                    onTap: () async {
                      String judulMateri = dataMateriIndex['judulMateri'];
                      String fileNamePDF =
                          judulMateri.replaceAll(' ', '_') + ".pdf";
                      String urlMateri = dataMateriIndex['urlMateri'];
                      String urlYoutube = dataMateriIndex['urlYoutube'];
                      Get.put(MateriController());
                      await Get.bottomSheet(
                        Container(
                          color: Colors.white,
                          height: Get.height * 0.3,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Materi'),
                                onTap: () => controller.openFile(
                                  url: urlMateri,
                                  fileName: fileNamePDF,
                                ),
                              ),
                              ListTile(
                                title: Text('YouTube'),
                                onTap: () => Get.to(
                                  () => WebviewView(
                                    title: judulMateri,
                                    initialUrl: urlYoutube,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    leading: Icon(
                      Icons.picture_as_pdf,
                      size: 32,
                      color: Colors.lightBlueAccent,
                    ),
                    title: Text("Materi ${index + 1}"),
                    subtitle: Text(dataMateriIndex['judulMateri']),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
