import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Panggil dari ilmu_faraid_screen.dart:
//
//   case "Halangan pembahagian faraid":
//     _openSheet(context, const HalanganFaraidSheet());
//     break;
// ─────────────────────────────────────────────────────────────────────────────
class HalanganFaraidSheet extends StatelessWidget {
  const HalanganFaraidSheet({super.key});

  static const List<_HalanganData> halangs = [
    _HalanganData(
      number: '01',
      arabic: 'اخْتِلَافُ الدِّيْن',
      transliteration: 'Ikhtilāf al-Dīn',
      title: 'Perbezaan Agama',
      icon: Icons.compare_arrows_rounded,
      gradient: [Color(0xFF7B2D00), Color(0xFFBF360C)],
      lightColor: Color(0xFFFBE9E7),
      accentColor: Color(0xFFBF360C),
      ringkas:
          'Muslim tidak boleh mewarisi harta bukan Muslim, dan bukan Muslim tidak boleh mewarisi harta Muslim — walaupun mereka adalah ibu bapa atau anak kandung.',
      contoh: 'Seorang anak yang murtad tidak berhak mewarisi harta bapa Muslimnya.',
      hukum: 'Hak waris gugur sepenuhnya. Bahagiannya tidak berpindah kepadanya.',
    ),
    _HalanganData(
      number: '02',
      arabic: 'الرِّقّ',
      transliteration: 'Al-Riqq',
      title: 'Hamba (Abdi)',
      icon: Icons.lock_rounded,
      gradient: [Color(0xFF4A148C), Color(0xFF7B1FA2)],
      lightColor: Color(0xFFF3E5F5),
      accentColor: Color(0xFF6A1B9A),
      ringkas:
          'Seorang hamba tidak layak mewarisi dan tidak boleh diwarisi kerana segala miliknya terletak di bawah kuasa tuannya. Statusnya menyekat hak pewarisan.',
      contoh: 'Seorang hamba tidak mewarisi ibu bapanya yang merdeka, dan harta si mati tidak boleh dibahagikan kepadanya.',
      hukum: 'Halangan ini terhenti jika hamba dimerdekakan — statusnya kembali kepada waris biasa.',
    ),
    _HalanganData(
      number: '03',
      arabic: 'القَتْل',
      transliteration: 'Al-Qatl',
      title: 'Pembunuhan',
      icon: Icons.not_interested_rounded,
      gradient: [Color(0xFF1A237E), Color(0xFF283593)],
      lightColor: Color(0xFFE8EAF6),
      accentColor: Color(0xFF283593),
      ringkas:
          'Waris yang membunuh pewaris — sama ada sengaja atau tidak sengaja — hilang hak untuk mewarisi hartanya. Ini mengelakkan waris membunuh untuk mendapat harta lebih cepat.',
      contoh: 'Seorang anak yang membunuh bapanya tidak berhak menerima satu sen pun daripada harta pusaka bapanya.',
      hukum: 'Majoriti ulama: termasuk pembunuhan tidak sengaja. Halangan ini meliputi semua jenis pembunuhan.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.88,
      decoration: const BoxDecoration(
        color: Color(0xFFF7F8FC),
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
          const SizedBox(height: 4),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
              child: Column(
                children: [
                  _HeroHeader(),
                  const SizedBox(height: 20),
                  ...List.generate(halangs.length, (i) {
                    return Column(
                      children: [
                        _HalanganCard(data: halangs[i]),
                        if (i < halangs.length - 1) _Connector(),
                      ],
                    );
                  }),
                  const SizedBox(height: 16),
                  _NoteStrip(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DATA MODEL
// ─────────────────────────────────────────────────────────────────────────────
class _HalanganData {
  final String number;
  final String arabic;
  final String transliteration;
  final String title;
  final IconData icon;
  final List<Color> gradient;
  final Color lightColor;
  final Color accentColor;
  final String ringkas;
  final String contoh;
  final String hukum;

  const _HalanganData({
    required this.number,
    required this.arabic,
    required this.transliteration,
    required this.title,
    required this.icon,
    required this.gradient,
    required this.lightColor,
    required this.accentColor,
    required this.ringkas,
    required this.contoh,
    required this.hukum,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// HERO HEADER
// ─────────────────────────────────────────────────────────────────────────────
class _HeroHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0D1247), Color(0xFF2E3192)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E3192).withOpacity(0.35),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -12,
            bottom: -12,
            child: Icon(
              Icons.block_rounded,
              size: 110,
              color: Colors.white.withOpacity(0.05),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.block_rounded,
                        color: Colors.white, size: 26),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Halangan Pembahagian Faraid',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.2,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Sebab Faraid • Topik 6',
                          style: TextStyle(
                              color: Colors.white54, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: 36,
                height: 2,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFC9A84C), Color(0xFFEDD98A)],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: const [
                  _Chip(label: 'Perbezaan Agama'),
                  SizedBox(width: 8),
                  _Chip(label: 'Hamba'),
                  SizedBox(width: 8),
                  _Chip(label: 'Pembunuhan'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  const _Chip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// HALANGAN CARD
// ─────────────────────────────────────────────────────────────────────────────
class _HalanganCard extends StatelessWidget {
  final _HalanganData data;
  const _HalanganCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: data.gradient.first.withOpacity(0.10),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [

          // ── Title bar ──
          Container(
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: data.gradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      data.number,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.arabic,
                        style: const TextStyle(
                          color: Color(0xFFEDD98A),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            data.transliteration,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 11,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            width: 3,
                            height: 3,
                            decoration: const BoxDecoration(
                              color: Colors.white38,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            data.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(data.icon,
                    color: Colors.white.withOpacity(0.55), size: 24),
              ],
            ),
          ),

          // ── Content ──
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Description with left border
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 4,
                      height: 68,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: data.gradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        data.ringkas,
                        style: const TextStyle(
                          fontSize: 13.5,
                          height: 1.6,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Contoh + Hukum row
                Row(
                  children: [
                    // Contoh
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: data.lightColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: data.accentColor.withOpacity(0.18)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.lightbulb_rounded,
                                    color: data.accentColor, size: 13),
                                const SizedBox(width: 5),
                                Text(
                                  'Contoh',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: data.accentColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data.contoh,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.4,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Hukum
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF8E1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: const Color(0xFFC9A84C)
                                  .withOpacity(0.25)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.gavel_rounded,
                                    color: Color(0xFFC9A84C), size: 13),
                                SizedBox(width: 5),
                                Text(
                                  'Hukum',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFC9A84C),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data.hukum,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.4,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CONNECTOR
// ─────────────────────────────────────────────────────────────────────────────
class _Connector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Center(
        child: Column(
          children: [
            Container(
                width: 2,
                height: 16,
                color: const Color(0xFF2E3192).withOpacity(0.18)),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFF2E3192).withOpacity(0.25),
                shape: BoxShape.circle,
              ),
            ),
            Container(
                width: 2,
                height: 16,
                color: const Color(0xFF2E3192).withOpacity(0.18)),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// NOTE STRIP
// ─────────────────────────────────────────────────────────────────────────────
class _NoteStrip extends StatelessWidget {
  static const Color navy = Color(0xFF0D1247);
  static const Color gold = Color(0xFFC9A84C);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: navy,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(0.25),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: gold.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.info_outline_rounded,
                color: gold, size: 20),
          ),
          const SizedBox(width: 13),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Penting Diketahui',
                  style: TextStyle(
                    color: gold,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Halangan pewarisan hanya menjejaskan individu yang berkenaan sahaja — ia tidak menggugurkan hak waris-waris lain. Bahagian waris yang terhalang akan dibahagikan semula kepada waris-waris yang layak.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12.5,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}