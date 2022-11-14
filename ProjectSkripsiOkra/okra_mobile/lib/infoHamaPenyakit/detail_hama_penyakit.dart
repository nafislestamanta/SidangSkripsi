import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';
import 'package:okra_mobile/home.dart';
import 'package:okra_mobile/infoHamaPenyakit/hama.dart';
import 'package:okra_mobile/infoHamaPenyakit/hama_penyakit.dart';
import 'package:okra_mobile/models/detail_hamapenyakit.dart';
import 'package:okra_mobile/models/list_hamapenyakit.dart';
import 'package:okra_mobile/service/api_hama_penyakit.dart';
import 'package:okra_mobile/service/api_url.dart';

class DetailHamaPenyakitPage extends StatefulWidget {
  final HamaPenyakit hamapenyakit;
  const DetailHamaPenyakitPage({Key? key, required this.hamapenyakit})
      : super(key: key);

  @override
  State<DetailHamaPenyakitPage> createState() => _DetailHamaPenyakitPageState();
}

class _DetailHamaPenyakitPageState extends State<DetailHamaPenyakitPage> {
  final ApiHamaPenyakit api = ApiHamaPenyakit();
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () => {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const HamaPenyakitPage();
            })),
          },
        ),
        title: Text(
          'Detail ${widget.hamapenyakit.kategori}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: darkGreen,
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return  const HamaPenyakitPage();
          }));
          return false;
        },
        child: FutureBuilder<DetailHamaPenyakit>(
            future: api.getPenyakitById(widget.hamapenyakit.kodeHp),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final detail = snapshot.data!;
      
                final gejala = detail.pengetahuan;
                final solusi = detail.solusi;
      
                return ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CarouselSlider.builder(
                      itemCount: gejala.length,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          // aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                      itemBuilder: (context, index, realIdx) {
                        final imageG = gejala[index];
                        return Container(
                          width: 350,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageG.gambarGejala.isNotEmpty
                                  ? NetworkImage(
                                      '$fotoUrl/assets/images/okra/${imageG.gambarGejala}')
                                  : const NetworkImage(
                                      '$fotoUrl/assets/images/okra/no.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18.0)),
                            border: Border.all(
                              width: 0.5,
                              color: const Color(0xFF423B55),
                            ),
                          ),
                          margin: const EdgeInsets.all(5.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '${index + 1}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Text(
                      widget.hamapenyakit.namaHp,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    widget.hamapenyakit.namaLatin.isNotEmpty
                        ? Text(
                            '(${widget.hamapenyakit.namaLatin})',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          )
                        : const SizedBox(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 0.5,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      padding: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: greenLight),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gejala :',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: gejala.length,
                            itemBuilder: (context, index) {
                              final gejalaHP = gejala[index];
                              return Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        '${index + 1}. ${gejalaHP.namaGejala}',
                                        style: GoogleFonts.poppins(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      padding: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: greenLight),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pengendalian :',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: solusi.length,
                            itemBuilder: (context, index) {
                              final solusiHP = solusi[index];
                              return Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        '- ${solusiHP.solusi}',
                                        style: GoogleFonts.poppins(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
