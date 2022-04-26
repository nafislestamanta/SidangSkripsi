import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/Tentang%20Okra/tentang_budidaya.dart';
import 'package:okra_mobile/Tentang%20Okra/tentang_keuntungan.dart';
import 'package:okra_mobile/Tentang%20Okra/tentang_sejarah.dart';
import 'package:okra_mobile/custom.dart';
import 'package:okra_mobile/home.dart';

class TentangOkra extends StatelessWidget {
  const TentangOkra({Key? key}) : super(key: key);

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
          'Tentang Okra',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: darkGreen,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Apa itu tanaman Okra ?',
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
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
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
                            fontWeight: FontWeight.bold, fontSize: 14),
                        unselectedLabelColor: Colors.white,
                        unselectedLabelStyle: const TextStyle(fontSize: 14),
                        tabs: const [
                          Tab(
                            child: Text(
                              'Sejarah',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Tab(
                              child: Text(
                            'Keuntungan',
                            textAlign: TextAlign.center,
                          )),
                          Tab(
                              child: Text('Budidaya',
                                  textAlign: TextAlign.center)),
                        ]),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: TabBarView(
                        children: [
                          TentangSejarah(),
                          TentangKeuntungan(),
                          TentangBudidaya()
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
