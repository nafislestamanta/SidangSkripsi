import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';

class PetunjukInfoPage extends StatelessWidget {
  const PetunjukInfoPage({Key? key}) : super(key: key);

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
                  'assets/images/hamapenyakit.png',
                  width: 100,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Info',
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
            child: Text(
              'Kenali Fitur Sistem Pakar Diagnosa Hama dan Penyakit Pada Tanaman Okra Kenali Fitur Sistem Pakar Diagnosa Hama dan Penyakit Pada Tanaman Okra Kenali Fitur Sistem Pakar Diagnosa Hama dan Penyakit Pada Tanaman Okra Kenali Fitur Sistem Pakar Diagnosa Hama dan Penyakit Pada Tanaman Okra Kenali Fitur Sistem Pakar Diagnosa Hama dan Penyakit Pada Tanaman Okra',
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: darkBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
