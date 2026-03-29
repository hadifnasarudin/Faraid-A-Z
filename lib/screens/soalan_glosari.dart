import 'package:flutter/material.dart';
import 'soalan_lazim.dart';
import 'glossari.dart';

class SoalanGlosariMenu extends StatelessWidget {
  const SoalanGlosariMenu({super.key});

  static const Color primaryColor = Color(0xFF2E3192);

  void _openPage(BuildContext context, String title) {
    Widget page;
    switch (title) {
      case 'Soalan Lazim':
        page = const SoalanLazimPage();
        break;
      case 'Glosari':
        page = const GlosariPage();
        break;
      default:
        return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuList = [
      {
        "title": "Soalan Lazim",
        "icon": Icons.quiz_rounded,
        "subtitle": "5 soalan lazim berkaitan faraid",
      },
      {
        "title": "Glosari",
        "icon": Icons.menu_book_rounded,
        "subtitle": "Istilah-istilah penting dalam ilmu faraid",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Soalan & Glosari',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [

          // ── Header — sama exact dengan IlmuFaraidScreen ──
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
                  "Soalan & Glosari",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Soalan lazim dan istilah penting berkaitan ilmu faraid.",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ── Menu List ──
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: menuList.length,
              itemBuilder: (context, index) {
                final item = menuList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    elevation: 4,
                    child: ListTile(
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
                          item["icon"] as IconData,
                          color: primaryColor,
                        ),
                      ),
                      title: Text(
                        item["title"] as String,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          item["subtitle"] as String,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                      onTap: () => _openPage(context, item["title"] as String),
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