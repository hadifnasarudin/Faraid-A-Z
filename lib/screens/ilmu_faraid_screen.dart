import 'package:flutter/material.dart';

class IlmuFaraidScreen extends StatelessWidget {
  const IlmuFaraidScreen({super.key});

  static const Color primaryColor = Color(0xFF2E3192);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> topicsList = [
       {
    "title": "Maksud Harta Pusaka",
    "icon": Icons.account_balance_wallet,
    "subtopics": [
      "Definisi Harta Pusaka",
      "Cara Pengagihan Harta Si Mati"
    ],
  },
  {
    "title": "Definisi Faraid",
    "icon": Icons.menu_book,
    "subtopics": [],
  },
  {
    "title": "Kepentingan Faraid",
    "icon": Icons.star_outline,
    "subtopics": [],
  },
  {
    "title": "Rukun Faraid",
    "icon": Icons.rule,
    "subtopics": [
      "Al-Muwarrith",
      "Al-Warith",
      "Al-Mawruth"
    ],
  },
  {
    "title": "Syarat-syarat Faraid",
    "icon": Icons.check_circle_outline,
    "subtopics": [],
  },
  {
    "title": "Sebab Faraid",
    "icon": Icons.gavel,
    "subtopics": [
      "Sebab berlaku faraid",
      "Halangan pembahagian faraid"
    ],
  },
  {
    "title": "Senarai Waris Pusaka",
    "icon": Icons.people_outline,
    "subtopics": [
      "Waris lelaki",
      "Waris perempuan"
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
                final subtopics = topic["subtopics"];
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
                      children: List.generate(
                        subtopics.length,
                        (i) {
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            title: Text(
                              subtopics[i],
                              style: const TextStyle(
                                fontSize: 15
                              ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                            onTap:() {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return Container(
                                    height: 400,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text(
                                            subtopics[i],
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 20),

                                          const Text(
                                            "Contoh penerangan untuk topik ini.",
                                            style: TextStyle(
                                              fontSize: 16,),
                                          ),
                                        ],
                                      )
                                    ),
                                  );
                                }
                              );
                            }
                          );
                        }
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