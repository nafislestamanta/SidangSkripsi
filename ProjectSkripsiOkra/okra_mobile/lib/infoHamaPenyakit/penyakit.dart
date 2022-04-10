import 'package:flutter/material.dart';
import 'package:okra_mobile/custom.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/infoHamaPenyakit/detail_hama_penyakit.dart';
import 'package:okra_mobile/models/list_hamapenyakit.dart';
import 'package:okra_mobile/service/api_hama_penyakit.dart';

class PenyakitPage extends StatefulWidget {
  const PenyakitPage({Key? key}) : super(key: key);

  @override
  State<PenyakitPage> createState() => _PenyakitPageState();
}

class _PenyakitPageState extends State<PenyakitPage> {
  final ApiHamaPenyakit api = ApiHamaPenyakit();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HamaPenyakit>?>(
        future: api.getPenyakit(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final dataHP = snapshot.data![index];
                  return GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailHamaPenyakitPage(
                          hamapenyakit: dataHP,
                        );
                      }))
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: greenLight),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              dataHP.namaHp,
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          ),
                          const Icon(Icons.info),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
