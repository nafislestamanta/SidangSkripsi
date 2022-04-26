import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';
import 'package:okra_mobile/home.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 70),
              Text(
                'Okra-in',
                style: GoogleFonts.poppins(
                    fontSize: 32, fontWeight: FontWeight.bold, color: green),
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/orientasi.png',
                // width: 200,
                // height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Text(
                  'Aplikasi Okra-in merupakan aplikasi yang digunakan untuk mengatasi permasalahan para petani dalam mendiagnosa hama dan penyakit serta solusi pengendalian pada tanaman Okra berdasarkan pengetahuan dari ahli pakar.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(height: 1.5),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25, right: 20, left: 20),
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
                        return const HomePage();
                      }))
                    },
                    child: Text(
                      'Mulai',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
