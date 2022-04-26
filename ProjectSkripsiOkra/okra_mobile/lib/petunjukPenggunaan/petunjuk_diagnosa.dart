import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';

class PetunjukDiagnosaPage extends StatelessWidget {
  const PetunjukDiagnosaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: greenLight,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/diagnosa.png',
                  width: 100,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Diagnosa',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: darkBlue,
                        ),
                      ),
                      Text('Hama dan Penyakit',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: darkBlue)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Text(
                  'Pada fitur Diagnosa Hama dan Penyakit, petani (user) memilih beberapa gejala yang terjadi pada tanaman Okra serta menentukan nilai keyakinan berdasarkan gejala tersebut. Lalu user dapat memulai diagnosa dan akan menampilkan hasil diagnosa yang beberapa diantaranya yaitu gejala yang telah dipilih user, hama atau penyakit dengan persentase tertinggi serta solusi pengendalian, dan list beberapa penyakit lainnya dengan persentase rendah.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: darkBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
