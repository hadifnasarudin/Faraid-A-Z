import '../screens/subtopics_screen/definisi_harta_pusaka.dart';
import '../screens/subtopics_screen/cara_pengagihan_harta.dart';
// import '../screens/subtopics_screen/definisi_faraid.dart';
// ... tambah import lain bila dah siap

import 'package:flutter/material.dart';

class IlmuFaraidScreen extends StatelessWidget {
  const IlmuFaraidScreen({super.key});

  static const Color primaryColor = Color(0xFF2E3192);

  // ─────────────────────────────────────────────────────────────────────────
  // openPage — router utama untuk semua subtopics
  //
  // LOGIK:
  //   • Subtopics yang PENDEK / ringkas  → Bottom Sheet (_openSheet)
  //   • Subtopics yang PANJANG / banyak content → Full page (_openFullPage)
  // ─────────────────────────────────────────────────────────────────────────
  void openPage(BuildContext context, String title) {
    switch (title) {
      // ── Bottom Sheet subtopics ──────────────────────────────────────────
      case "Definisi Harta Pusaka":
        _openSheet(context, const DefinisiHartaPusakaSheet());
        break;

      case "Cara Pengagihan Harta Si Mati":
        _openSheet(context, const CaraPengagihanHartaSheet());
        break;

      // Uncomment bila dah siap:
      // case "Al-Muwarrith":
      //   _openSheet(context, const AlMuwarrithSheet());
      //   break;
      // case "Al-Warith":
      //   _openSheet(context, const AlWarithSheet());
      //   break;
      // case "Al-Mawruth":
      //   _openSheet(context, const AlMawruthSheet());
      //   break;

      // ── Full page subtopics ─────────────────────────────────────────────

      default:
        // Placeholder untuk subtopics yang belum siap
        _openSheet(context, _PlaceholderSheet(title: title));
    }
  }

  void _openSheet(BuildContext context, Widget sheet) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => sheet,
    );
  }

  void _openFullPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> topicsList = [
      {
        "title": "Maksud Harta Pusaka",
        "icon": Icons.account_balance_wallet,
        "subtopics": ["Definisi Harta Pusaka", "Cara Pengagihan Harta Si Mati"],
      },
      {"title": "Definisi Faraid", "icon": Icons.menu_book, "subtopics": []},
      {
        "title": "Kepentingan Faraid",
        "icon": Icons.star_outline,
        "subtopics": [],
      },
      {
        "title": "Rukun Faraid",
        "icon": Icons.rule,
        "subtopics": ["Al-Muwarrith", "Al-Warith", "Al-Mawruth"],
      },
      {
        "title": "Syarat-syarat Faraid",
        "icon": Icons.check_circle_outline,
        "subtopics": [],
      },
      {
        "title": "Sebab Faraid",
        "icon": Icons.gavel,
        "subtopics": ["Sebab berlaku faraid", "Halangan pembahagian faraid"],
      },
      {
        "title": "Senarai Waris Pusaka",
        "icon": Icons.people_outline,
        "subtopics": ["Waris lelaki", "Waris perempuan"],
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Ilmu Faraid',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                colors: [Color(0xFF2E3192), Color(0xFF1B1E5A)],
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
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// Topics List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: topicsList.length,
              itemBuilder: (context, index) {
                final topic = topicsList[index];
                final subtopics = topic["subtopics"] as List<String>;
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    elevation: 4,
                    child:
                        subtopics.isEmpty
                            // Topics tanpa subtopics — tap terus buka sheet
                            ? ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 14,
                                horizontal: 20,
                              ),
                              leading: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  topic["icon"] as IconData,
                                  color: primaryColor,
                                ),
                              ),
                              title: Text(
                                topic["title"] as String,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                              onTap:
                                  () => openPage(
                                    context,
                                    topic["title"] as String,
                                  ),
                            )
                            // Topics dengan subtopics — expandable
                            : ExpansionTile(
                              tilePadding: const EdgeInsets.symmetric(
                                vertical: 18,
                                horizontal: 20,
                              ),
                              leading: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  topic["icon"] as IconData,
                                  color: primaryColor,
                                ),
                              ),
                              title: Text(
                                topic["title"] as String,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              children:
                                  subtopics.map((sub) {
                                    return ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                      title: Text(
                                        sub,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                      ),
                                      onTap: () => openPage(context, sub),
                                    );
                                  }).toList(),
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

// ─────────────────────────────────────────────────────────────────────────────
// PLACEHOLDER SHEET — untuk subtopics yang belum ada content
// (Boleh delete bila semua subtopics dah siap)
// ─────────────────────────────────────────────────────────────────────────────
class _PlaceholderSheet extends StatelessWidget {
  final String title;
  const _PlaceholderSheet({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: const BoxDecoration(
        color: Color(0xFFF4F6FA),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 32),
          const Icon(
            Icons.construction_rounded,
            size: 48,
            color: Color(0xFF2E3192),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "Kandungan akan ditambah tidak lama lagi.",
            style: TextStyle(color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
