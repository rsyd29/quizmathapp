import 'package:quizmathapp/app/model/model_pertanyaan.dart';

List<ModelPertanyaan> semuaPertanyaan = [
  ModelPertanyaan(
    "1 + 1 Hasilnya berapa?",
    {
      "Jendela": false,
      "2": true,
      "4": false,
      "11": false,
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
