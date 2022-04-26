// To parse this JSON data, do
//
//     final detailHamaPenyakit = detailHamaPenyakitFromJson(jsonString);

import 'dart:convert';

DetailHamaPenyakit detailHamaPenyakitFromJson(String str) => DetailHamaPenyakit.fromJson(json.decode(str));

String detailHamaPenyakitToJson(DetailHamaPenyakit data) => json.encode(data.toJson());

class DetailHamaPenyakit {
    DetailHamaPenyakit({
        required this.status,
        required this.message,
        required this.pengetahuan,
        required this.solusi,
    });

    bool status;
    String message;
    List<Pengetahuan> pengetahuan;
    List<Solusi> solusi;

    factory DetailHamaPenyakit.fromJson(Map<String, dynamic> json) => DetailHamaPenyakit(
        status: json["status"],
        message: json["message"],
        pengetahuan: List<Pengetahuan>.from(json["pengetahuan"].map((x) => Pengetahuan.fromJson(x))),
        solusi: List<Solusi>.from(json["solusi"].map((x) => Solusi.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "pengetahuan": List<dynamic>.from(pengetahuan.map((x) => x.toJson())),
        "solusi": List<dynamic>.from(solusi.map((x) => x.toJson())),
    };
}

class Pengetahuan {
    Pengetahuan({
        required this.kodePengetahuan,
        required this.kodeHp,
        required this.kodeGejala,
        required this.mb,
        required this.md,
        required this.cfPakar,
        required this.namaGejala,
    });

    String kodePengetahuan;
    String kodeHp;
    String kodeGejala;
    String mb;
    String md;
    String cfPakar;
    String namaGejala;

    factory Pengetahuan.fromJson(Map<String, dynamic> json) => Pengetahuan(
        kodePengetahuan: json["kode_pengetahuan"],
        kodeHp: json["kode_hp"],
        kodeGejala: json["kode_gejala"],
        mb: json["mb"],
        md: json["md"],
        cfPakar: json["cf_pakar"],
        namaGejala: json["nama_gejala"],
    );

    Map<String, dynamic> toJson() => {
        "kode_pengetahuan": kodePengetahuan,
        "kode_hp": kodeHp,
        "kode_gejala": kodeGejala,
        "mb": mb,
        "md": md,
        "cf_pakar": cfPakar,
        "nama_gejala": namaGejala,
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
