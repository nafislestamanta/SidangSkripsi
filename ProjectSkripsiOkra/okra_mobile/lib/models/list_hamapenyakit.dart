// To parse this JSON data, do
//
//     final listHamaPenyakit = listHamaPenyakitFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListHamaPenyakit listHamaPenyakitFromJson(String str) =>
    ListHamaPenyakit.fromJson(json.decode(str));

String listHamaPenyakitToJson(ListHamaPenyakit data) =>
    json.encode(data.toJson());

class ListHamaPenyakit {
  ListHamaPenyakit({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<HamaPenyakit> data;

  factory ListHamaPenyakit.fromJson(Map<String, dynamic> json) =>
      ListHamaPenyakit(
        status: json["status"],
        message: json["message"],
        data: List<HamaPenyakit>.from(
            json["data"].map((x) => HamaPenyakit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class HamaPenyakit {
  HamaPenyakit({
    required this.kodeHp,
    required this.namaHp,
    required this.namaLatin,
    required this.kategori,
    required this.gambar,
  });

  String kodeHp;
  String namaHp;
  String namaLatin;
  String kategori;
  String gambar;

  factory HamaPenyakit.fromJson(Map<String, dynamic> json) => HamaPenyakit(
        kodeHp: json["kode_hp"],
        namaHp: json["nama_hp"],
        namaLatin: json["nama_latin"],
        kategori: json["kategori"],
        gambar: json["gambar"],
      );

  Map<String, dynamic> toJson() => {
        "kode_hp": kodeHp,
        "nama_hp": namaHp,
        "nama_latin": namaLatin,
        "kategori": kategori,
        "gambar": gambar,
      };
}
