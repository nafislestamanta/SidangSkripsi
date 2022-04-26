import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';
import 'package:okra_mobile/models/hasil_diagnosa.dart';
import 'package:okra_mobile/providers/diagnosa_provider.dart';
import 'package:okra_mobile/service/api_diagnosa.dart';
import 'package:okra_mobile/service/api_url.dart';
import 'package:provider/provider.dart';

class HasilDiagnosaPage extends StatefulWidget {
  const HasilDiagnosaPage({Key? key}) : super(key: key);

  @override
  State<HasilDiagnosaPage> createState() => _HasilDiagnosaPageState();
}

class _HasilDiagnosaPageState extends State<HasilDiagnosaPage> {
  final ScrollController _controllerOne = ScrollController();
  late DiagnosaProvider diagnosaProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    diagnosaProvider = Provider.of<DiagnosaProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () => {Navigator.pop(context)},
        ),
        title: const Text(
          "Hasil Diagnosa",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: darkGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(20.0),
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    18.0,
                  ),
                  color: greenLight),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Gejala',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 25,
                  ),
                  Text(
                    'Berikut adalah gejala-gejala yang diketahui untuk mengetahui diagnosa hama atau penyakit :',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 160,
                    child: Scrollbar(
                      controller: _controllerOne,
                      isAlwaysShown: true,
                      showTrackOnHover: true,
                      child: ListView.builder(
                        controller: _controllerOne,
                        itemCount:
                            diagnosaProvider.hasil!.data.hasilGejala.length,
                        itemBuilder: (context, index) {
                          final listGejala =
                              diagnosaProvider.hasil!.data.hasilGejala[index];
                          return Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    "- ${listGejala.namaGejala}",
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              margin:
                  const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
              width: double.infinity,
              height: 370,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    18.0,
                  ),
                  color: greenLight),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Diagnosa Hama dan Penyakit',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 25,
                  ),
                  Text(
                    'Berdasarkan gejala-gejala tersebut, maka diketahui hama atau penyakit yang menyerang tanaman Okra dengan nilai persentase sebagai berikut :',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 160,
                    child: Scrollbar(
                      child: ListView.builder(
                        itemCount: diagnosaProvider.hasil!.data.hasilHp.length,
                        itemBuilder: (context, index) {
                          final listPenyakit =
                              diagnosaProvider.hasil!.data.hasilHp[index];
                          return Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    '- ${listPenyakit.namaHp}',
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${listPenyakit.nilaiPerhitungan}',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: darkGreen,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              margin:
                  const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
              width: double.infinity,
              height: 460,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    18.0,
                  ),
                  color: greenLight),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hama/Penyakit Nilai Tertinggi',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 25,
                  ),
                  Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            '$fotoUrl/assets/images/okra/${diagnosaProvider.hasil!.data.hamapenyakit.gambar}'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(18.0)),
                      border: Border.all(
                        width: 0.5,
                        color: const Color(0xFF423B55),
                      ),
                    ),
                    margin: const EdgeInsets.all(5.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        diagnosaProvider.hasil!.data.hamapenyakit.namaHp,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: darkGreen,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '(${diagnosaProvider.hasil!.data.hasilNilai})',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: darkGreen,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Dari hasil tersebut dapat disimpulkan bahwa hama atau penyakit yang menyerang tanaman Okra anda adalah Empoasca dengan nilai perhitungan 0.90',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        primary: green3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => buildSheet(),
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                      ),
                      child: Text(
                        'Solusi',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSheet() => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (_, controller) => ListView(
          controller: controller,
          children: [
            Container(
              decoration: BoxDecoration(
                color: greenLight,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Solusi Pengendalian',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 25,
                  ),
                  Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/lubang.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(18.0)),
                      border: Border.all(
                        width: 0.5,
                        color: const Color(0xFF423B55),
                      ),
                    ),
                    margin: const EdgeInsets.all(5.0),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Empoasca',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: darkGreen,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '(0.90)',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: darkGreen,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 600,
                    child: ListView.builder(
                      controller: controller,
                      // shrinkWrap: true,
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            // SizedBox(
                            //   width: 10,
                            // ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  '- Tidak memegang tanaman yang sehat sehabis memegang tanaman sakit',
                                  style: GoogleFonts.poppins(fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  // void _buttonSolusi() {
  //   showModalBottomSheet(
  //       backgroundColor: greenLight,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  //       context: context,
  //       builder: (context) {
  //         return Padding(
  //           padding: const EdgeInsets.all(20.0),
  //           child: Column(
  //             children: [
  //               Align(
  //                 alignment: Alignment.centerLeft,
  //                 child: Text(
  //                   'Solusi Pengendalian',
  //                   style: GoogleFonts.poppins(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //               ),
  //               Divider(
  //                 thickness: 1,
  //                 height: 25,
  //               ),
  //               Container(
  //                 height: 150,
  //                 width: 250,
  //                 decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                       image: AssetImage('assets/images/lubang.jpg'),
  //                       fit: BoxFit.fill,
  //                     ),
  //                     borderRadius: BorderRadius.all(Radius.circular(18.0)),
  //                     border: Border.all(width: 2.0, color: Color(0xFF423B55))),
  //                 margin: EdgeInsets.all(5.0),
  //               ),
  //             ],
  //           ),
  //         );
  //       });

  // DraggableScrollableSheet(
  //     initialChildSize: 0.7,
  //     builder: (context, scrollController) {
  //       return Container(
  //         color: Colors.blue[100],
  //         child: Column(
  //           children: [
  //             Align(
  //               alignment: Alignment.centerLeft,
  //               child: Text(
  //                 'Solusi Pengendalian',
  //                 style: GoogleFonts.poppins(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //             ),
  //             Divider(
  //               thickness: 1,
  //               height: 25,
  //             ),
  //           ],
  //         ),
  //       );
  //     });

  // showModalBottomSheet(
  //     backgroundColor: greenLight,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  //     context: context,
  //     builder: (context) {
  //       return Padding(
  //         padding: const EdgeInsets.all(20.0),
  //         child: Column(
  //           children: [
  //             Align(
  //               alignment: Alignment.centerLeft,
  //               child: Text(
  //                 'Solusi Pengendalian',
  //                 style: GoogleFonts.poppins(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //             ),
  //             Divider(
  //               thickness: 1,
  //               height: 25,
  //             ),
  //           ],
  //         ),
  //       );
  //     });
  // }
}
