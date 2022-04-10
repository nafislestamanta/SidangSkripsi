import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';

class TentangBudidaya extends StatelessWidget {
  const TentangBudidaya({Key? key}) : super(key: key);

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
                image: const DecorationImage(
                  image: AssetImage('assets/images/budidaya.jpeg'),
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
              'Budidaya Okra',
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
              '1. Lahan Okra dapat tumbuh di dataran rendah sampai dataran tinggi pada hampir semua jenis tanah dengan pH tanah minimal 4.5. Okra dapat tumbuh dengan baik pada tanah berpasir dengan pengairan yang baik, dan pH antara 6.5-7.5',
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
              '2. Tanah yang akan ditanami diolah dan diberi pupuk dasar berupa pupuk kandang / kompos sebanyak 4 – 6 ton/ha dan diusahakan tanah mengandung K tinggi.',
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
              '3. Selanjutnya tanah itu dibuat bedengan dengan lebar sekitar 100 cm dan panjang tergantung lahan. Jarak antar bedengan adalah 25 cm. Sedangkan lubang tanamnya berdiameter sekitar 20 cm dengan kedalaman sekitar 5 cm. Jarak tanam yang dianjurkan  90-125 cm x 28-62 cm.',
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
              '4. Benih disebar merata dan ditutup tanah tipis-tipis. Setelah berumur 21 hari siap dipindah ke lahan tanam. Benih yang akan ditanam adalah biji okra yang sudah tua dan sudah diseleksi terlebih dahulu dengan cara perendaman. Perendaman dilakukan dengan air hangat 24 jam sebelum tanam.',
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
              '5. Dalam satu lubang tanam, dapat ditanam 5-6 benih',
              // textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: darkBlue,
              ),
            ),
            Text(
              '6. Selanjutnya dilakukan pemeliharaan okra,  misalnya dengan pengairan, pembersihan lahan dan lain-lain. Dimana okra memerlukan kondisi tanah yang agak lembab, apabila tidak hujan sebaiknya diberi pengairan dengan interval dua hari sekali. Penyiangan atau Pengendalian gulma dapat dilakukan dengan penanaman menggunakan mulsa plastik hitam perak',
              // textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: darkBlue,
              ),
            ),
            Text(
              '7. Tanaman ini dapat dipanen pada usia 1,5 bulan. Okra dipanen pada saat buahnya masih muda, yaitu 5-6 hari setelah bunga mekar. Okra berbunga pada 50 hari setelah tanam. Panjang buah okra yang disukai konsumen adalah 6,5 - 9 cm. Panen okra dapat dilakukan 3 kali dalam seminggu. Masa berbuah adalah 82 hari setelah tanam. Panen buah okra dilakukan dua hari sekali. Okra yang baru dipanen dan disimpan di tempat sejuk dan kering biasanya dapat bertahan selama seminggu. Okra yang akan dijadikan benih dibiarkan tua dan kering di pohon, setelah itu dipetik dan dikeluarkan bijinya yang langsung bisa ditanam atau dikeringkan dulu.',
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
