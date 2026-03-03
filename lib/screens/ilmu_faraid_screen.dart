import 'package:flutter/material.dart';
import 'maksud_harta_pusaka.dart';
import 'definisi_faraid.dart';
import 'kepentingan_faraid.dart';
import 'rukun_faraid.dart';
import 'syarat_faraid.dart';
import 'sebab_faraid.dart';
import 'senarai_waris.dart';

class IlmuFaraidScreen extends StatelessWidget {
  const IlmuFaraidScreen({super.key});

  static const Color primaryColor = Color(0xFF2E3192);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> topicsList = [
       {
    "title": "Maksud Harta Pusaka",
    "icon": Icons.account_balance_wallet,
    "contents": [
      "Harta pusaka ialah segala harta yang ditinggalkan oleh seseorang selepas kematiannya untuk diwarisi oleh waris yang layak.",
      "Contoh: rumah, tanah, simpanan bank, saham, kenderaan."
    ],
  },
  {
    "title": "Definisi Faraid",
    "icon": Icons.menu_book,
    "contents": [
      "Faraid ialah hukum pembahagian harta pusaka menurut Islam.",
      "Tujuan: memastikan hak waris dijaga dengan adil."
    ],
  },
  {
    "title": "Kepentingan Faraid",
    "icon": Icons.star_outline,
    "contents": [
      "Menjamin hak waris.",
      "Mencegah pertikaian keluarga.",
      "Menegakkan hukum Islam."
    ],
  },
  {
    "title": "Rukun Faraid",
    "icon": Icons.rule,
    "contents": [
      "Si mati meninggalkan harta.",
      "Terdapat waris yang berhak."
    ],
  },
  {
    "title": "Syarat-syarat Faraid",
    "icon": Icons.check_circle_outline,
    "contents": [
      "Waris hidup pada masa pembahagian.",
      "Harta adalah milik si mati."
    ],
  },
  {
    "title": "Sebab Faraid",
    "icon": Icons.gavel,
    "contents": [
      "Mati seseorang yang meninggalkan harta.",
      "Waris yang berhak perlu tahu hak masing-masing."
    ],
  },
  {
    "title": "Senarai Waris Pusaka",
    "icon": Icons.people_outline,
    "contents": [
      "Ibu bapa, anak-anak, suami/isteri, adik-beradik.",
      "Mengikut urutan faraid yang ditetapkan."
    ],
  },
    ];

    final List<IconData> icons = [
      Icons.account_balance_wallet,
      Icons.menu_book,
      Icons.star_outline,
      Icons.rule,
      Icons.check_circle_outline,
      Icons.gavel,
      Icons.people_outline,
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Ilmu Faraid',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [

          /// Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2E3192),
                  Color(0xFF1B1E5A),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pelajari Ilmu Faraid",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Fahami konsep pembahagian harta pusaka dengan mudah dan tersusun.",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// List Section
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: topicsList.length,
              itemBuilder: (context, index) {
                final topic = topicsList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    elevation: 4,
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(vertical:18, horizontal: 20),
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          topic["icon"],
                          color: primaryColor,
                        ),
                      ),
                      title: Text(
                        topic["title"],
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      children: List<Widget>.generate(
                        topic["contents"].length,
                        (i) => Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                          child: Text(
                            topic["contents"][i],
                            style: const TextStyle(fontSize:15 , height: 1.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}