// To parse this JSON data, do
//
//     final listGejala = listGejalaFromJson(jsonString);

import 'dart:convert';

ListGejala listGejalaFromJson(String str) =>
    ListGejala.fromJson(json.decode(str));

String listGejalaToJson(ListGejala data) => json.encode(data.toJson());

class ListGejala {
  ListGejala({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Gejala> data;

  factory ListGejala.fromJson(Map<String, dynamic> json) => ListGejala(
        status: json["status"],
        message: json["message"],
        data: List<Gejala>.from(json["data"].map((x) => Gejala.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Gejala {
  Gejala({
    required this.kodeGejala,
    required this.namaGejala,
  });

  String kodeGejala;
  String namaGejala;

  factory Gejala.fromJson(Map<String, dynamic> json) => Gejala(
        kodeGejala: json["kode_gejala"],
        namaGejala: json["nama_gejala"],
      );

  Map<String, dynamic> toJson() => {
        "kode_gejala": kodeGejala,
        "nama_gejala": namaGejala,
      };
}
