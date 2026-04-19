import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Panggil dari ilmu_faraid_screen.dart:
//
//   case "Sebab berlaku faraid":
//     _openSheet(context, const SebabBerlakuFaraidSheet());
//     break;
// ─────────────────────────────────────────────────────────────────────────────
class SebabBerlakuFaraidSheet extends StatelessWidget {
  const SebabBerlakuFaraidSheet({super.key});

  static const List<_SebabData> sebabs = [
    _SebabData(
      number: '01',
      arabic: 'القَرَابَة',
      transliteration: 'Al-Qarābah',
      title: 'Keturunan',
      icon: Icons.family_restroom_rounded,
      gradient: [Color(0xFF0D1247), Color(0xFF2E3192)],
      lightColor: Color(0xFFE8EAF6),
      accentColor: Color(0xFF2E3192),
      ringkas:
          'Hubungan darah yang sah antara si mati dengan warisnya — sama ada ke atas (ibu bapa, datuk), ke bawah (anak, cucu) atau ke sisi (adik-beradik, bapa saudara).',
      contoh: 'Anak, ibu, bapa, datuk, nenek, adik-beradik.',
    ),
    _SebabData(
      number: '02',
      arabic: 'الزَّوْجِيَّة',
      transliteration: 'Al-Zawjiyyah',
      title: 'Perkahwinan',
      icon: Icons.favorite_rounded,
      gradient: [Color(0xFF880E4F), Color(0xFFC2185B)],
      lightColor: Color(0xFFFCE4EC),
      accentColor: Color(0xFFC2185B),
      ringkas:
          'Akad nikah yang sah menjadikan suami dan isteri saling mewarisi antara satu sama lain — selagi tidak berlaku talak bain sebelum kematian.',
      contoh: 'Suami mewarisi isteri, isteri mewarisi suami.',
    ),
    _SebabData(
      number: '03',
      arabic: 'الوَلَاء',
      transliteration: 'Al-Walā\'',
      title: 'Penguasaan',
      icon: Icons.shield_rounded,
      gradient: [Color(0xFF1B5E20), Color(0xFF388E3C)],
      lightColor: Color(0xFFE8F5E9),
      accentColor: Color(0xFF2E7D32),
      ringkas:
          'Hubungan antara tuan yang memerdekakan hamba dengan bekas hambanya. Jika bekas hamba tiada waris nasab atau perkahwinan, tuannya berhak mewarisi.',
      contoh: 'Jarang berlaku pada zaman moden. Hanya wujud jika tiada waris lain.',
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
                  ...List.generate(sebabs.length, (i) {
                    return Column(
                      children: [
                        _SebabCard(data: sebabs[i]),
                        if (i < sebabs.length - 1) _Connector(),
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
class _SebabData {
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

  const _SebabData({
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
            child: Icon(Icons.gavel_rounded,
                size: 110, color: Colors.white.withOpacity(0.05)),
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
                    child: const Icon(Icons.gavel_rounded,
                        color: Colors.white, size: 26),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sebab Berlaku Faraid',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.3,
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
                  _Chip(label: 'Keturunan'),
                  SizedBox(width: 8),
                  _Chip(label: 'Perkahwinan'),
                  SizedBox(width: 8),
                  _Chip(label: 'Penguasaan'),
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
// SEBAB CARD
// ─────────────────────────────────────────────────────────────────────────────
class _SebabCard extends StatelessWidget {
  final _SebabData data;
  const _SebabCard({required this.data});

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
                // Number badge
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

                // Arabic + title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.arabic,
                        style: const TextStyle(
                          color: Color(0xFFEDD98A),
                          fontSize: 20,
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

                // Description
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 4,
                      height: 64,
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

                // Contoh pill
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: data.lightColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: data.accentColor.withOpacity(0.18)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.lightbulb_rounded,
                          color: data.accentColor, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Contoh: ',
                                style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w700,
                                  color: data.accentColor,
                                ),
                              ),
                              TextSpan(
                                text: data.contoh,
                                style: TextStyle(
                                  fontSize: 12.5,
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
// CONNECTOR between cards
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
              color: const Color(0xFF2E3192).withOpacity(0.18),
            ),
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
              color: const Color(0xFF2E3192).withOpacity(0.18),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// NOTE STRIP — priority order reminder
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
            child:
                const Icon(Icons.info_outline_rounded, color: gold, size: 20),
          ),
          const SizedBox(width: 13),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Keutamaan Sebab',
                  style: TextStyle(
                    color: gold,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Al-Qarabah (keturunan) adalah sebab yang paling kuat dan meluas. Al-Zawjiyyah (perkahwinan) terhad kepada pasangan suami isteri sahaja. Al-Wala\' (penguasaan) hanya diguna pakai apabila tiada waris dari keturunan atau perkahwinan.',
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