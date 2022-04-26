// To parse this JSON data, do
//
//     final hasilDiagnosa = hasilDiagnosaFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HasilDiagnosa hasilDiagnosaFromJson(String str) =>
    HasilDiagnosa.fromJson(json.decode(str));

String hasilDiagnosaToJson(HasilDiagnosa data) => json.encode(data.toJson());

class HasilDiagnosa {
  HasilDiagnosa({
    required this.status,
    required this.message,
    required this.data,
    required this.solusi,
  });

  bool status;
  String message;
  Data data;
  List<Solusi> solusi;

  factory HasilDiagnosa.fromJson(Map<String, dynamic> json) => HasilDiagnosa(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        solusi:
            List<Solusi>.from(json["solusi"].map((x) => Solusi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "solusi": List<dynamic>.from(solusi.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    required this.kodeHp,
    required this.hasilHp,
    required this.hasilGejala,
    required this.hasilNilai,
    required this.hamapenyakit,
  });

  String kodeHp;
  List<Hamapenyakit> hasilHp;
  List<HasilGejala> hasilGejala;
  String hasilNilai;
  Hamapenyakit hamapenyakit;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        kodeHp: json["kode_hp"],
        hasilHp: List<Hamapenyakit>.from(
            json["hasil_hp"].map((x) => Hamapenyakit.fromJson(x))),
        hasilGejala: List<HasilGejala>.from(
            json["hasil_gejala"].map((x) => HasilGejala.fromJson(x))),
        hasilNilai: json["hasil_nilai"],
        hamapenyakit: Hamapenyakit.fromJson(json["hamapenyakit"]),
      );

  Map<String, dynamic> toJson() => {
        "kode_hp": kodeHp,
        "hasil_hp": List<dynamic>.from(hasilHp.map((x) => x.toJson())),
        "hasil_gejala": List<dynamic>.from(hasilGejala.map((x) => x.toJson())),
        "hasil_nilai": hasilNilai,
        "hamapenyakit": hamapenyakit.toJson(),
      };
}

class Hamapenyakit {
  Hamapenyakit({
    required this.kodeHp,
    required this.namaHp,
    required this.namaLatin,
    required this.kategori,
    required this.gambar,
    required this.nilaiPerhitungan,
  });

  String kodeHp;
  String namaHp;
  String namaLatin;
  String kategori;
  String gambar;
  String nilaiPerhitungan;

  factory Hamapenyakit.fromJson(Map<String, dynamic> json) => Hamapenyakit(
        kodeHp: json["kode_hp"],
        namaHp: json["nama_hp"],
        namaLatin: json["nama_latin"],
        kategori: json["kategori"],
        gambar: json["gambar"],
        nilaiPerhitungan: json["nilai_perhitungan"],
        // nilaiPerhitungan: json["nilai_perhitungan"] == null
        //     ? null
        //     : json["nilai_perhitungan"],
      );

  Map<String, dynamic> toJson() => {
        "kode_hp": kodeHp,
        "nama_hp": namaHp,
        "nama_latin": namaLatin,
        "kategori": kategori,
        "gambar": gambar,
        "nilai_perhitungan": nilaiPerhitungan,
        // "nilai_perhitungan": nilaiPerhitungan == null ? null : nilaiPerhitungan,
      };
}

class HasilGejala {
  HasilGejala({
    required this.kodeGejala,
    required this.namaGejala,
    required this.namaKondisi,
  });

  String kodeGejala;
  String namaGejala;
  String namaKondisi;

  factory HasilGejala.fromJson(Map<String, dynamic> json) => HasilGejala(
        kodeGejala: json["kode_gejala"],
        namaGejala: json["nama_gejala"],
        namaKondisi: json["nama_kondisi"],
      );

  Map<String, dynamic> toJson() => {
        "kode_gejala": kodeGejala,
        "nama_gejala": namaGejala,
        "nama_kondisi": namaKondisi,
      };
}

class Solusi {
  Solusi({
    required this.kodeSolusi,
    required this.kodeHp,
    required this.solusi,
    required this.slug,
  });

  String kodeSolusi;
  String kodeHp;
  String solusi;
  String slug;

  factory Solusi.fromJson(Map<String, dynamic> json) => Solusi(
        kodeSolusi: json["kode_solusi"],
        kodeHp: json["kode_hp"],
        solusi: json["solusi"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "kode_solusi": kodeSolusi,
        "kode_hp": kodeHp,
        "solusi": solusi,
        "slug": slug,
      };
}
