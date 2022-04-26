import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';

class TentangKeuntungan extends StatelessWidget {
  const TentangKeuntungan({Key? key}) : super(key: key);

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
                  image: AssetImage('assets/images/okra.png'),
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
              'Keuntungan Bertanam Okra',
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
              '1. Okra dapat ditanam dengan mudah dan pemeliharaannya sangat sederhana.',
              // textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: darkBlue,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '2. Masa berproduksinya cukup lama sehingga dapat menjadi sumber penghasilan  yang lumayan',
              // textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: darkBlue,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '3. Buah muda sebagai sayur mengandung gizi yang tinggi',
              // textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: darkBlue,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '4. Buah Okra muda dapat tahan lama disimpan (10-20 hari) di ruangan sejuk sehingga memudahkan untuk pengiriman',
              // textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: darkBlue,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '5. Tanaman Okra dapat ditanam secara tumpangsari dengan tanaman lainnya',
              // textAlign: TextAlign.justify,
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
