import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okra_mobile/custom.dart';
import 'package:okra_mobile/diagnosaHamaPenyakit/radio_option.dart';
import 'package:okra_mobile/models/list_gejala.dart';
import 'package:okra_mobile/providers/diagnosa_provider.dart';
import 'package:provider/provider.dart';

class CardGejala extends StatefulWidget {
  const CardGejala({Key? key, required this.gejala}) : super(key: key);

  final Gejala gejala;

  @override
  State<CardGejala> createState() => _CardGejalaState();
}

class _CardGejalaState extends State<CardGejala> {
  String? selectedValue;

  // void _selectionHandler(String? value) {
  //   setState(() {
  //     selectedValue = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final tambahDiagnosa =
        Provider.of<DiagnosaProvider>(context, listen: false);
    return Container(
      height: 120,
      padding: const EdgeInsets.only(top: 10.0, left: 15.0),
      margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: greenLight),
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.gejala.namaGejala,
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            MyRadioOption<String>(
              value: '1',
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                  tambahDiagnosa.addDiagnosa(
                      widget.gejala.kodeGejala, selectedValue!);
                });
              },
              label: 'id1',
              text: 'Phone Gap',
            ),
            MyRadioOption<String>(
              value: '2',
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                  tambahDiagnosa.addDiagnosa(
                      widget.gejala.kodeGejala, selectedValue!);
                });
              },
              label: 'id2',
              text: 'Phone Gap',
            ),
            MyRadioOption<String>(
              value: '3',
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                  tambahDiagnosa.addDiagnosa(
                      widget.gejala.kodeGejala, selectedValue!);
                });
              },
              label: 'id3',
              text: 'Phone Gap',
            ),
            MyRadioOption<String>(
              value: '4',
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                  tambahDiagnosa.addDiagnosa(
                      widget.gejala.kodeGejala, selectedValue!);
                });
              },
              label: 'id4',
              text: 'Phone Gap',
            ),
          ])
        ],
      ),
    );
  }
}
