import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';

class TentangSejarah extends StatelessWidget {
  const TentangSejarah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: greenLight,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/okrabunga.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(18.0)),
                border: Border.all(
                  width: 0.5,
                  color: const Color(0xFF423B55),
                ),
              ),
              margin: const EdgeInsets.all(5.0),
            ),
            Text(
              'Okra SI Lady"s Finger',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: darkBlue,
              ),
            ),
            Text(
              'Hortikultura',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: darkBlue,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Okra merupakan sayuran berbentuk buah yang dapat diolah menjadi beragam makanan lezat dan berkhasiat bagi kesehatan penderita diabetes karena sangat ampuh turunkan kadar gula darah. Okra termasuk tanaman genus Hibiscus dari famili Malvaceae (kapas-kapasan). Tanaman ini memiliki julukan Lady"s Finger karena bentuk buahnya yang panjang dan meruncing di bagian ujungnya seperti jari-jari lentik gemulai seorang wanita cantik.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: darkBlue,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Sumber: Direktorat Perlindungan Hortikultura Kementerian Pertanian',
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: darkBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
