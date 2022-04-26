import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';

class PetunjukHistoriPage extends StatelessWidget {
  const PetunjukHistoriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/images/okras.png',
                  width: 100,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Column(
                    children: [
                      Text(
                        'Tentang Okra',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: darkBlue,
                        ),
                      ),
                      // Text('Okra',
                      //     style: GoogleFonts.poppins(
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.bold,
                      //         color: darkBlue)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Text(
              'Fitur Tentang Okra pada aplikasi Okra-in ini memberikan  informasi mengenai tanaman Okra seperti sejarah, keuntungan serta bagaimana cara budidaya tanaman tersebut.',
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
