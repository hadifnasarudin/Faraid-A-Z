import 'package:faraid_a_z/screens/subtopics_screen/rukun_faraid.dart';
import '../screens/subtopics_screen/definisi_harta_pusaka.dart';
import '../screens/subtopics_screen/cara_pengagihan_harta.dart';
import '../screens/subtopics_screen/definisi_faraid.dart';
import '../screens/subtopics_screen/kepentingan_faraid.dart';
import '../screens/subtopics_screen/syarat_faraid.dart';
import '../screens/subtopics_screen/sebab_berlaku_faraid.dart';
import '../screens/subtopics_screen/halangan_pembahagian_faraid.dart';
import '../screens/subtopics_screen/senarai_waris.dart';
import 'saved_screen.dart';

import 'package:flutter/material.dart';

class IlmuFaraidScreen extends StatelessWidget {
  const IlmuFaraidScreen({super.key});

  static const Color primaryColor = Color(0xFF2E3192);

  void openPage(BuildContext context, String title) {
    switch (title) {
      case "Definisi Harta Pusaka":
        _openSheet(context, const DefinisiHartaPusakaSheet());
        break;
      case "Langkah Pengagihan Harta Si Mati":
        _openSheet(context, const CaraPengagihanHartaSheet());
        break;
      case "Definisi Faraid":
        _openSheet(context, const DefinisiFaraidSheet());
        break;
      case "Kepentingan Faraid":
        _openSheet(context, const KepentinganFaraidSheet());
        break;
      case "Syarat-syarat Faraid":
        _openSheet(context, const SyaratFaraidSheet());
        break;
      case "Al-Muwarrith":
        _openSheet(context, const AlMuwarrithSheet());
        break;
      case "Al-Warith":
        _openSheet(context, const AlWarithSheet());
        break;
      case "Al-Mawruth":
        _openSheet(context, const AlMawruthSheet());
        break;
      case "Sebab berlaku faraid":
        _openSheet(context, const SebabBerlakuFaraidSheet());
        break;
      case "Halangan pembahagian faraid":
        _openSheet(context, const HalanganFaraidSheet());
        break;
      case "Waris lelaki":
        _openSheet(context, const WarisLelakiSheet());
        break;
      case "Waris perempuan":
        _openSheet(context, const WarisPerempuanSheet());
        break;
      default:
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

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> topicsList = [
      {
        "title": "Definisi Harta Pusaka",
        "icon": Icons.account_balance_wallet,
        "subtopics": ["Definisi Harta Pusaka", "Langkah Pengagihan Harta Si Mati"],
      },
      {"title": "Definisi Faraid", "icon": Icons.menu_book, "subtopics": []},
      {"title": "Kepentingan Faraid", "icon": Icons.star_outline, "subtopics": []},
      {
        "title": "Rukun Faraid",
        "icon": Icons.rule,
        "subtopics": ["Al-Muwarrith", "Al-Warith", "Al-Mawruth"],
      },
      {"title": "Syarat-syarat Faraid", "icon": Icons.check_circle_outline, "subtopics": []},
      {
        "title": "Sebab dan halangan",
        "icon": Icons.gavel,
        "subtopics": ["Sebab berlaku faraid", "Halangan pembahagian faraid"],
      },
      {
        "title": "Senarai Waris Pusaka",
        "icon": Icons.people_outline,
        "subtopics": ["Waris lelaki", "Waris perempuan"],
      },
    ];

    // ValueListenableBuilder — rebuild bila SavedNotifier berubah
    return ValueListenableBuilder<Set<String>>(
      valueListenable: SavedNotifier.instance,
      builder: (context, savedSet, _) {
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
              // ── Header ──
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
                          color: Colors.white, fontSize: 20,
                          fontWeight: FontWeight.bold),
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

              // ── Topics List ──
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                  itemCount: topicsList.length,
                  itemBuilder: (context, index) {
                    final topic = topicsList[index];
                    final subtopics = List<String>.from(topic["subtopics"]);
                    final topicTitle = topic["title"] as String;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        elevation: 4,
                        child: subtopics.isEmpty

                            // ── Topics TANPA subtopics ──
                            ? ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 20),
                                leading: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(topic["icon"] as IconData,
                                      color: primaryColor),
                                ),
                                title: Text(topicTitle,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600)),
                                trailing: null,
                                onTap: () => openPage(context, topicTitle),
                              )

                            // ── Topics DENGAN subtopics ──
                            : ExpansionTile(
                                tilePadding: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 20),
                                leading: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(topic["icon"] as IconData,
                                      color: primaryColor),
                                ),
                                title: Text(topicTitle,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600)),
                                children: subtopics.map((sub) {
                                  return ListTile(
                                    contentPadding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 20),
                                    title: Text(sub,
                                        style: const TextStyle(fontSize: 15)),
                                    trailing: null,
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
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PLACEHOLDER SHEET
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
            width: 40, height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 32),
          const Icon(Icons.construction_rounded, size: 48,
              color: Color(0xFF2E3192)),
          const SizedBox(height: 16),
          Text(title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("Kandungan akan ditambah tidak lama lagi.",
              style: TextStyle(color: Colors.grey.shade500)),
        ],
      ),
    );
  }
}