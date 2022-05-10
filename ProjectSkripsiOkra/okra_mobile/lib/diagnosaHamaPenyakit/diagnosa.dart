import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:okra_mobile/custom.dart';
import 'package:okra_mobile/diagnosaHamaPenyakit/card_gejala.dart';
import 'package:okra_mobile/diagnosaHamaPenyakit/hasil_diagnosa.dart';
import 'package:okra_mobile/home.dart';
import 'package:okra_mobile/models/hasil_diagnosa.dart';
import 'package:okra_mobile/models/list_gejala.dart';
import 'package:okra_mobile/providers/diagnosa_provider.dart';
import 'package:okra_mobile/service/api_diagnosa.dart';
import 'package:okra_mobile/service/api_hama_penyakit.dart';
import 'package:okra_mobile/service/api_url.dart';
import 'package:provider/provider.dart';

class DiagnosaPage extends StatefulWidget {
  const DiagnosaPage({Key? key}) : super(key: key);

  @override
  State<DiagnosaPage> createState() => _DiagnosaPageState();
}

class _DiagnosaPageState extends State<DiagnosaPage> {
  final ApiHamaPenyakit api = ApiHamaPenyakit();
  final ApiDiagnosa apiDiagnosa = ApiDiagnosa();

  List<Gejala> listGejala = [];

  late DiagnosaProvider hasil;

  @override
  void dispose() {
    hasil.clearlist();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    hasil = Provider.of<DiagnosaProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return const HomePage();
              }),
            ),
          },
        ),
        title: const Text(
          'Diagnosa Hama Penyakit',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: darkGreen,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 190,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50.0),
                bottomLeft: Radius.circular(50.0),
              ),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    offset: Offset(2.0, 2.0))
              ],
              color: green,
              gradient: LinearGradient(
                  colors: [lightGreen, darkGreen1],
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft),
            ),
            child: Column(
              children: [
                Text(
                  'Pilih gejala yang terjadi dan tentukan nilai keyakinan berdasarkan skala berikut ini:',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const ShapeDecoration(
                                shape: CircleBorder(
                                  side: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                color: Colors.transparent,
                              ),
                              child: const Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Sedikit Yakin',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const ShapeDecoration(
                                shape: CircleBorder(
                                  side: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                color: Colors.transparent,
                              ),
                              child: const Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Cukup Yakin',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const ShapeDecoration(
                                shape: CircleBorder(
                                  side: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                color: Colors.transparent,
                              ),
                              child: const Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Yakin',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const ShapeDecoration(
                                shape: CircleBorder(
                                  side: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                color: Colors.transparent,
                              ),
                              child: const Center(
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Sangat Yakin',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<List<Gejala>?>(
              future: api.getGejala(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final gejala = snapshot.data![index];

                        return CardGejala(gejala: gejala);
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      primary: green3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    onPressed: () async {
                      final jsonJawaban = jsonEncode(hasil.listJawaban);
                      final api = ApiDiagnosa();

                      // bool cekHasil =
                      final result = await api.createDiagnosa(jsonJawaban);

                      if (result == null) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.red.shade700,
                                title: const Text(
                                  'Harap Memasukkan Gejala !',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            });
                        print("response cek hasil empty");
                      } else {
                        hasil.saveHasil(result);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HasilDiagnosaPage();
                            },
                          ),
                        );
                      }

                      // if (cekHasil) {
                      //   Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) {
                      //         return const HasilDiagnosaPage();
                      //       },
                      //     ),
                      //   );
                      // }
                    },
                    child: Text(
                      'Mulai Diagnosa',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void createsDiagnosa(String jsonjawaban) async {
    final String apiUrl = "$apiurl/Diagnosa";
    // List<String> listJawaban = [
    //   "${diagnosa.kodeGejala}_${diagnosa.kodeValue}",
    // ];

    // print("jsonJawaban = $jsonjawaban");

    try {
      final response = await post(
        Uri.parse(apiUrl),
        body: {'list_jawaban': jsonjawaban},
      );

      // print(response.statusCode);

      if (response.statusCode == 200) {
        final hasil = json.decode(response.body);
        final dataNya2 = hasil!;
        print("hasilAkhirData = $dataNya2");

        final hasilAkhir = HasilDiagnosa.fromJson(hasil!);
        final dataNya = hasilAkhir.data;
        print("hasilAkhir = $dataNya");

        // return dataHasil.data;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HasilDiagnosaPage();
            },
          ),
        );
      } else {
        print("error ya");
      }

      // log(response.body);
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString());
      log(e.toString());
    }
  }
}
