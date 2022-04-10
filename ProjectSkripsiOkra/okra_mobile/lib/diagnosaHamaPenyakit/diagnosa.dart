import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';
import 'package:okra_mobile/diagnosaHamaPenyakit/card_gejala.dart';
import 'package:okra_mobile/diagnosaHamaPenyakit/hasil_diagnosa.dart';
import 'package:okra_mobile/home.dart';
import 'package:okra_mobile/models/list_gejala.dart';
import 'package:okra_mobile/providers/counter_provider.dart';
import 'package:okra_mobile/service/api_hama_penyakit.dart';
import 'package:provider/provider.dart';

class DiagnosaPage extends StatefulWidget {
  const DiagnosaPage({Key? key}) : super(key: key);

  @override
  State<DiagnosaPage> createState() => _DiagnosaPageState();
}

class _DiagnosaPageState extends State<DiagnosaPage> {
  final ApiHamaPenyakit api = ApiHamaPenyakit();

  List<Gejala> listGejala = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context, child) => CounterProvider(),
      child: Scaffold(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Row(
                      children: [
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
                                  'Tidak Yakin',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
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
                                  'Mungkin',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
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
                                  'Kemungkinan Besar',
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
                                  'Hampir Pasti',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
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
                                      '5',
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
                                  'Pasti',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
                      onPressed: () => {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HasilDiagnosaPage();
                        }))
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
      ),
    );
  }
}

// class CardGejala extends StatefulWidget {
//   const CardGejala({
//     Key? key,
//     required this.gejala,
//   }) : super(key: key);

//   final Gejala gejala;

//   @override
//   State<CardGejala> createState() => _CardGejalaState();
// }

// class _CardGejalaState extends State<CardGejala> {
//   String? selectedValue;

//   void _selectionHandler(String? value) {
//     setState(() {
//       selectedValue = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 120,
//       padding: const EdgeInsets.only(top: 10.0, left: 15.0),
//       margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15.0), color: greenLight),
//       child: Column(
//         children: [
//           Expanded(
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 widget.gejala.namaGejala,
//                 style: GoogleFonts.poppins(fontSize: 14),
//               ),
//             ),
//           ),
//           const Divider(
//             thickness: 1,
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             MyRadioOption<String>(
//               value: '1',
//               groupValue: selectedValue,
//               onChanged: _selectionHandler,
//               label: 'id1',
//               text: 'Phone Gap',
//             ),
//             MyRadioOption<String>(
//               value: '2',
//               groupValue: selectedValue,
//               onChanged: _selectionHandler,
//               label: 'id2',
//               text: 'Phone Gap',
//             ),
//             MyRadioOption<String>(
//               value: '3',
//               groupValue: selectedValue,
//               onChanged: _selectionHandler,
//               label: 'id3',
//               text: 'Phone Gap',
//             ),
//             MyRadioOption<String>(
//               value: '4',
//               groupValue: selectedValue,
//               onChanged: _selectionHandler,
//               label: 'id4',
//               text: 'Phone Gap',
//             ),
//           ])
//         ],
//       ),
//     );
//     ;
//   }
// }
