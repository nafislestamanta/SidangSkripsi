import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';

class TentangSejarah extends StatelessWidget {
  const TentangSejarah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
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
                image: DecorationImage(
                  image: AssetImage('assets/images/okrabunga.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                border: Border.all(
                  width: 0.5,
                  color: Color(0xFF423B55),
                ),
              ),
              margin: EdgeInsets.all(5.0),
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
            SizedBox(
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
            SizedBox(
              height: 10,
            ),
            Text(
              'Tanaman okra berasal dari Afrika dan dibawa ke Amerika sekitar 3 abad lalu oleh para budak Afrika. Saat ini tanaman okra sudah dikenal luas di berbagai negara di Asia, Eropa, dan Australia. Bahkan masakan berbahan dasar okra sangat populer di Sri Lanka, Jepang, Philipina, Arab Saudi dan Eropa. Tanaman ini tersebar ke berbagai daerah tropik dan subtropik  seperti India, Afrika Barat dan Brasil, yang pada akhirnya lebih populer di negara-negara Eropa dan Australia.',
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
