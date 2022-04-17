import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/Tentang%20Okra/tentang_okra.dart';
import 'package:okra_mobile/custom.dart';
import 'package:okra_mobile/diagnosaHamaPenyakit/diagnosa.dart';
import 'package:okra_mobile/infoHamaPenyakit/hama_penyakit.dart';
import 'package:okra_mobile/petunjukPenggunaan/petunjuk.dart';
import 'package:okra_mobile/providers/diagnosa_provider.dart';
import 'package:provider/provider.dart';

final List<String> imgList = [
  'assets/images/okra.png',
  'assets/images/tanamanokra.jpeg',
  'assets/images/penyakit.jpg',
  'assets/images/penyakit1.jpg',
  'assets/images/fusarium.jpg',
  'assets/images/bintikbawah.jpg',
  'assets/images/penyakit2.jpg',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(item),
              fit: BoxFit.fill,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(18.0)),
            border: Border.all(
              width: 0.5,
              color: const Color(0xFF423B55),
            ),
          ),
          margin: const EdgeInsets.all(5.0),
        ))
    .toList();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(200.0),
                          bottomLeft: Radius.circular(200.0)),
                      color: darkGreen,
                      gradient: LinearGradient(
                          colors: [lightGreen, darkGreen1],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                width: 50,
                                height: 50,
                              ),
                              Text(
                                'Okra-in',
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: darkBlue),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Column(children: [
                      CarouselSlider(
                        items: imageSliders,
                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ]),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
                height: 30,
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    const Icon(Icons.info),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Fitur Utama',
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const DiagnosaPage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 130,
                        width: 170,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: greenLight,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/diagnosa.png',
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              'Diagnosa',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: darkBlue,
                              ),
                            ),
                            Text(
                              'Hama dan Penyakit',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: darkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HamaPenyakitPage();
                        }));
                      },
                      child: Container(
                        height: 130,
                        width: 170,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: greenLight,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/hamapenyakit.png',
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              'Info',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: darkBlue,
                              ),
                            ),
                            Text(
                              'Hama dan Penyakit',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: darkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const TentangOkra();
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 130,
                        width: 170,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: greenLight,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/okras.png',
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              'Tentang',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: darkBlue,
                              ),
                            ),
                            Text(
                              'Okra',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: darkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PetunjukPage();
                        }));
                      },
                      child: Container(
                        height: 130,
                        width: 170,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: greenLight,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/info.png',
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              'Petunjuk',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: darkBlue,
                              ),
                            ),
                            Text(
                              'Penggunaan',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: darkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
