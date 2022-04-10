import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';
import 'package:okra_mobile/infoHamaPenyakit/hama.dart';
import 'package:okra_mobile/infoHamaPenyakit/penyakit.dart';

class HamaPenyakitPage extends StatefulWidget {
  const HamaPenyakitPage({Key? key}) : super(key: key);

  @override
  State<HamaPenyakitPage> createState() => _HamaPenyakitPageState();
}

class _HamaPenyakitPageState extends State<HamaPenyakitPage> {
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
            Navigator.pop(context),
          },
        ),
        title: const Text(
          'Info Hama dan Penyakit',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: darkGreen,
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50.0),
                bottomLeft: Radius.circular(50.0),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  offset: Offset(2.0, 2.0),
                )
              ],
              color: green,
              gradient: LinearGradient(
                  colors: [lightGreen, darkGreen1],
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Daftar hama dan penyakit pada tanaman okra',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(7.0),
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: green1,
                  ),
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: green,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: green2),
                      labelColor: Colors.white,
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      unselectedLabelColor: Colors.white,
                      unselectedLabelStyle: const TextStyle(fontSize: 16),
                      tabs: const [
                        Tab(
                          child: Text(
                            'Hama',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Tab(
                            child: Text(
                          'Penyakit',
                          textAlign: TextAlign.center,
                        )),
                      ]),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 600,
                  child: TabBarView(children: [
                    HamaPage(),
                    PenyakitPage(),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
