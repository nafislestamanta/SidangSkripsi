import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';
import 'package:okra_mobile/home.dart';
import 'package:okra_mobile/petunjukPenggunaan/petunjuk_diagnosa.dart';
import 'package:okra_mobile/petunjukPenggunaan/petunjuk_histori.dart';
import 'package:okra_mobile/petunjukPenggunaan/petunjuk_info.dart';

class PetunjukPage extends StatelessWidget {
  const PetunjukPage({Key? key}) : super(key: key);

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return const HomePage();
              }),
            ),
          },
        ),
        title: const Text(
          'Petunjuk Penggunaan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: darkGreen,
      ),
      backgroundColor: Colors.white,
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
                    offset: Offset(2.0, 2.0))
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
                  'Kenali Fitur Sistem Pakar Diagnosa Hama dan Penyakit Pada Tanaman Okra',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: DefaultTabController(
              length: 3,
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
                              'Diagnosa',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Tab(
                              child: Text(
                            'Info',
                            textAlign: TextAlign.center,
                          )),
                          Tab(
                              child:
                                  Text('Histori', textAlign: TextAlign.center)),
                        ]),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      height: 440,
                      width: double.infinity,
                      child: TabBarView(
                        children: [
                          PetunjukDiagnosaPage(),
                          PetunjukInfoPage(),
                          PetunjukHistoriPage()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
