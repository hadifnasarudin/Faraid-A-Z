import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Panggil dari ilmu_faraid_screen.dart:
//
//   case "Al-Muwarrith":
//     _openSheet(context, const AlMuwarrithSheet());
//     break;
// ─────────────────────────────────────────────────────────────────────────────
class AlMuwarrithSheet extends StatelessWidget {
  const AlMuwarrithSheet({super.key});

  static const Color baseColor = Color(0xFF0D1247);
  static const Color accentColor = Color(0xFF2E3192);
  static const Color lightColor = Color(0xFFE8EAF6);
  static const Color gold = Color(0xFFC9A84C);

  @override
  Widget build(BuildContext context) {
    return _RukunSheet(
      title: 'Al-Muwarrith',
      arabicText: 'الـمُوَرِّث',
      transliteration: 'Al-Muwarrith',
      rukunLabel: 'Rukun 1 daripada 3',
      tagline: 'Pewaris',
      icon: Icons.person_off_rounded,
      baseColor: baseColor,
      accentColor: accentColor,
      lightColor: lightColor,
      definisi:
          'Al-Muwarrith ialah orang yang telah meninggal dunia dan meninggalkan harta untuk diwarisi oleh waris-warisnya yang layak.',
      properties: const [
        _Property(
          icon: Icons.close_rounded,
          title: 'Telah Meninggal Dunia',
          desc:
              'Harta seseorang hanya boleh diwarisi selepas dia meninggal dunia — sama ada kematian hakiki, hukmi (melalui keputusan hakim) atau taqdiri (hilang dalam tempoh lama).',
        ),
        _Property(
          icon: Icons.account_balance_wallet_rounded,
          title: 'Memiliki Harta',
          desc:
              'Pewaris mestilah meninggalkan harta — sama ada harta alih, harta tidak alih, atau hak-hak yang boleh diwarisi. Jika tiada harta, tiada pewarisan.',
        ),
        _Property(
          icon: Icons.mosque_rounded,
          title: 'Beragama Islam',
          desc:
              'Dalam sistem faraid, harta pewaris Muslim hanya dibahagikan mengikut hukum faraid. Harta bukan Muslim tidak tertakluk kepada faraid.',
        ),
      ],
      contoh:
          'Seorang bapa Muslim meninggal dunia meninggalkan sebuah rumah, wang simpanan dan sebidang tanah. Beliau adalah Al-Muwarrith — dan segala hartanya akan dibahagikan kepada waris mengikut hukum faraid.',
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Al-Warith
// ─────────────────────────────────────────────────────────────────────────────
class AlWarithSheet extends StatelessWidget {
  const AlWarithSheet({super.key});

  static const Color baseColor = Color(0xFF1B5E20);
  static const Color accentColor = Color(0xFF2E7D32);
  static const Color lightColor = Color(0xFFE8F5E9);

  @override
  Widget build(BuildContext context) {
    return _RukunSheet(
      title: 'Al-Warith',
      arabicText: 'الـوَارِث',
      transliteration: 'Al-Wārith',
      rukunLabel: 'Rukun 2 daripada 3',
      tagline: 'Waris',
      icon: Icons.people_alt_rounded,
      baseColor: baseColor,
      accentColor: accentColor,
      lightColor: lightColor,
      definisi:
          'Al-Warith ialah individu yang masih hidup dan mempunyai ikatan atau hubungan yang sah dengan si mati — sama ada melalui perkahwinan, keturunan atau wala\'.',
      properties: const [
        _Property(
          icon: Icons.favorite_rounded,
          title: 'Masih Hidup',
          desc:
              'Waris mestilah masih hidup pada saat pewaris meninggal dunia. Bayi dalam kandungan juga dianggap hidup dan berhak mendapat bahagian jika dilahirkan hidup.',
        ),
        _Property(
          icon: Icons.account_tree_rounded,
          title: 'Ada Hubungan yang Sah',
          desc:
              'Hubungan antara waris dan pewaris mestilah melalui salah satu daripada tiga sebab — perkahwinan (nikah), keturunan (nasab), atau pemerdekaan (wala\').',
        ),
        _Property(
          icon: Icons.block_rounded,
          title: 'Tiada Halangan',
          desc:
              'Waris mestilah bebas dari halangan seperti membunuh pewaris, murtad, atau berbeza agama dengan pewaris.',
        ),
      ],
      contoh:
          'Seorang suami meninggal dunia meninggalkan isteri, tiga orang anak dan seorang ibu yang masih hidup. Kesemua mereka adalah Al-Warith — setiap seorang mempunyai hubungan sah dengan si mati dan layak mendapat bahagian faraid.',
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Al-Mawruth
// ─────────────────────────────────────────────────────────────────────────────
class AlMawruthSheet extends StatelessWidget {
  const AlMawruthSheet({super.key});

  static const Color baseColor = Color(0xFF4A148C);
  static const Color accentColor = Color(0xFF7B1FA2);
  static const Color lightColor = Color(0xFFF3E5F5);

  @override
  Widget build(BuildContext context) {
    return _RukunSheet(
      title: 'Al-Mawruth',
      arabicText: 'الـمَوْرُوث',
      transliteration: 'Al-Mawrūth',
      rukunLabel: 'Rukun 3 daripada 3',
      tagline: 'Harta Pusaka',
      icon: Icons.account_balance_wallet_rounded,
      baseColor: baseColor,
      accentColor: accentColor,
      lightColor: lightColor,
      definisi:
          'Al-Mawruth ialah harta peninggalan si mati yang akan dibahagikan kepada waris — merangkumi harta alih, harta tidak alih dan hak-hak yang boleh diwarisi.',
      properties: const [
        _Property(
          icon: Icons.directions_car_rounded,
          title: 'Harta Alih',
          desc:
              'Harta yang boleh dipindahkan dari satu tempat ke tempat lain — seperti wang tunai, kenderaan, barang kemas, pelaburan dan peralatan perniagaan.',
        ),
        _Property(
          icon: Icons.home_rounded,
          title: 'Harta Tidak Alih',
          desc:
              'Harta yang tidak boleh dipindahkan secara fizikal — seperti rumah, tanah, bangunan dan ladang. Harta ini kekal di tempatnya dan hanya hak miliknya yang berpindah.',
        ),
        _Property(
          icon: Icons.handshake_rounded,
          title: 'Hak-hak yang Boleh Diwarisi',
          desc:
              'Meliputi hak hutang yang perlu dikutip, hak syuf\'ah (hak keutamaan membeli), dan hak-hak kontrak tertentu yang masih berkuat kuasa.',
        ),
      ],
      contoh:
          'Si mati meninggalkan sebuah rumah (harta tidak alih), sebuah kereta dan wang simpanan RM50,000 (harta alih), serta hutang orang lain kepadanya sebanyak RM10,000 (hak yang boleh diwarisi). Semua ini adalah Al-Mawruth yang perlu dibahagikan kepada waris.',
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SHARED REUSABLE SHEET WIDGET
// ─────────────────────────────────────────────────────────────────────────────
class _Property {
  final IconData icon;
  final String title;
  final String desc;
  const _Property(
      {required this.icon, required this.title, required this.desc});
}

class _RukunSheet extends StatelessWidget {
  final String title;
  final String arabicText;
  final String transliteration;
  final String rukunLabel;
  final String tagline;
  final IconData icon;
  final Color baseColor;
  final Color accentColor;
  final Color lightColor;
  final String definisi;
  final List<_Property> properties;
  final String contoh;

  static const Color gold = Color(0xFFC9A84C);
  static const Color navy = Color(0xFF0D1247);

  const _RukunSheet({
    required this.title,
    required this.arabicText,
    required this.transliteration,
    required this.rukunLabel,
    required this.tagline,
    required this.icon,
    required this.baseColor,
    required this.accentColor,
    required this.lightColor,
    required this.definisi,
    required this.properties,
    required this.contoh,
  });

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
          // Drag handle
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

                  // ── Hero card ──
                  _buildHero(),
                  const SizedBox(height: 16),

                  // ── Definisi card ──
                  _buildDefinisi(),
                  const SizedBox(height: 16),

                  // ── Ciri-ciri card ──
                  _buildProperties(),
                  const SizedBox(height: 16),

                  // ── Contoh card ──
                  _buildContoh(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Hero ──────────────────────────────────────────────────────────────────
  Widget _buildHero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [baseColor, accentColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.38),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Ghost icon
          Positioned(
            right: -14,
            bottom: -14,
            child: Icon(icon,
                size: 110, color: Colors.white.withOpacity(0.06)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child:
                        Icon(icon, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.3,
                        ),
                      ),
                      Text(
                        tagline,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Rukun badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.2)),
                    ),
                    child: Text(
                      rukunLabel,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Gold divider
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

              const SizedBox(height: 16),

              // Arabic text centre
              Center(
                child: Column(
                  children: [
                    Text(
                      arabicText,
                      style: const TextStyle(
                        color: Color(0xFFEDD98A),
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                    Text(
                      transliteration,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 13,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Definisi ──────────────────────────────────────────────────────────────
  Widget _buildDefinisi() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title bar
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: const Row(
              children: [
                Icon(Icons.format_quote_rounded,
                    color: Colors.white, size: 18),
                SizedBox(width: 8),
                Text(
                  'Definisi',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 4,
                  height: 72,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [baseColor, accentColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    definisi,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.65,
                      color: Color(0xFF222222),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Properties ─────────────────────────────────────────────────────────────
  Widget _buildProperties() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title bar
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: const Row(
              children: [
                Icon(Icons.list_alt_rounded,
                    color: Colors.white, size: 18),
                SizedBox(width: 8),
                Text(
                  'Ciri-ciri Utama',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: List.generate(properties.length, (i) {
                final p = properties[i];
                final isLast = i == properties.length - 1;
                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Timeline column
                      SizedBox(
                        width: 36,
                        child: Column(
                          children: [
                            Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: lightColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: accentColor.withOpacity(0.2)),
                              ),
                              child: Icon(p.icon,
                                  color: accentColor, size: 17),
                            ),
                            if (!isLast)
                              Expanded(
                                child: Container(
                                  width: 2,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 4),
                                  decoration: BoxDecoration(
                                    color: accentColor.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: isLast ? 0 : 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                p.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13.5,
                                  color: accentColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                p.desc,
                                style: TextStyle(
                                  fontSize: 12.5,
                                  height: 1.5,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // ── Contoh ────────────────────────────────────────────────────────────────
  Widget _buildContoh() {
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
            child: const Icon(Icons.lightbulb_rounded,
                color: gold, size: 20),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Contoh',
                  style: TextStyle(
                    color: gold,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  contoh,
                  style: const TextStyle(
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