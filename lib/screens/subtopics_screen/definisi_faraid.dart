import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Panggil dari ilmu_faraid_screen.dart:
//
//   case "Definisi Faraid":
//     _openSheet(context, const DefinisiFaraidSheet());
//     break;
// ─────────────────────────────────────────────────────────────────────────────
class DefinisiFaraidSheet extends StatelessWidget {
  const DefinisiFaraidSheet({super.key});

  static const Color navy = Color(0xFF0D1247);
  static const Color royalBlue = Color(0xFF2E3192);
  static const Color gold = Color(0xFFC9A84C);
  static const Color goldLight = Color(0xFFFFF8E1);

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
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 36),
              child: Column(
                children: [

                  // ── Hero header ──
                  _HeroHeader(),
                  const SizedBox(height: 20),

                  // ── Bahasa card ──
                  _DefinitionCard(
                    badgeLabel: 'BAHASA',
                    badgeColor: royalBlue,
                    title: 'Dari Sudut Bahasa',
                    arabicWord: 'الفَرَائِض',
                    arabicSub: 'Jamak bagi "Farīḍah" (فَرِيضَة)',
                    meanings: const [
                      _MeaningItem(
                        icon: Icons.rule_rounded,
                        label: 'Ketentuan',
                        desc: 'Sesuatu yang telah ditetapkan dan dipastikan',
                      ),
                      _MeaningItem(
                        icon: Icons.check_circle_outline_rounded,
                        label: 'Sesuatu yang Difardhukan',
                        desc: 'Perkara yang diwajibkan oleh syarak',
                      ),
                      _MeaningItem(
                        icon: Icons.description_outlined,
                        label: 'Keterangan',
                        desc: 'Penjelasan dan perincian yang jelas',
                      ),
                      _MeaningItem(
                        icon: Icons.gavel_rounded,
                        label: 'Kewajipan',
                        desc: 'Tanggungjawab yang mesti dilaksanakan',
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ── Istilah card ──
                  _IstilahCard(),

                  const SizedBox(height: 16),

                  // ── Sumber nas card ──
                  _NasCard(),

                  const SizedBox(height: 16),

                  // ── Kesimpulan strip ──
                  _KesimpulanStrip(),
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
// HERO HEADER
// ─────────────────────────────────────────────────────────────────────────────
class _HeroHeader extends StatelessWidget {
  static const Color navy = Color(0xFF0D1247);
  static const Color royalBlue = Color(0xFF2E3192);
  static const Color gold = Color(0xFFC9A84C);

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
            color: royalBlue.withOpacity(0.35),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Ghost Arabic text in background
          Positioned(
            right: -8,
            top: -8,
            child: Text(
              'فَرَائِض',
              style: TextStyle(
                color: Colors.white.withOpacity(0.07),
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
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
                    child: const Icon(Icons.menu_book_rounded,
                        color: Colors.white, size: 26),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Definisi Faraid',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.3,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Definisi Faraid • Topik 2',
                          style:
                              TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Gold divider
              Container(
                width: 40,
                height: 2,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFC9A84C), Color(0xFFEDD98A)],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              const SizedBox(height: 14),

              // Arabic word big display
              const Center(
                child: Text(
                  'الفَرَائِض',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFEDD98A),
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Al-Farā\'iḍ',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 13,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DEFINITION CARD — Bahasa
// ─────────────────────────────────────────────────────────────────────────────
class _DefinitionCard extends StatelessWidget {
  final String badgeLabel;
  final Color badgeColor;
  final String title;
  final String arabicWord;
  final String arabicSub;
  final List<_MeaningItem> meanings;

  const _DefinitionCard({
    required this.badgeLabel,
    required this.badgeColor,
    required this.title,
    required this.arabicWord,
    required this.arabicSub,
    required this.meanings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── Title bar ──
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: badgeColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    badgeLabel,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Arabic word pill
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: badgeColor.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: badgeColor.withOpacity(0.2)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          arabicWord,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: badgeColor,
                            height: 1.4,
                          ),
                        ),
                        Text(
                          arabicSub,
                          style: TextStyle(
                            fontSize: 12,
                            color: badgeColor.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                Text(
                  'Empat Makna Utama:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: badgeColor,
                    letterSpacing: 0.3,
                  ),
                ),

                const SizedBox(height: 12),

                // 2x2 grid of meanings
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.55,
                  children: meanings.map((m) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: badgeColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            color: badgeColor.withOpacity(0.15)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(m.icon, color: badgeColor, size: 20),
                          const SizedBox(height: 6),
                          Text(
                            m.label,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: badgeColor,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            m.desc,
                            style: TextStyle(
                              fontSize: 10.5,
                              color: Colors.grey.shade600,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Meaning item data
class _MeaningItem {
  final IconData icon;
  final String label;
  final String desc;
  const _MeaningItem(
      {required this.icon, required this.label, required this.desc});
}

// ─────────────────────────────────────────────────────────────────────────────
// ISTILAH FUQAHA' CARD
// ─────────────────────────────────────────────────────────────────────────────
class _IstilahCard extends StatelessWidget {
  static const Color purple = Color(0xFF6A1B9A);
  static const Color purpleLight = Color(0xFFF3E5F5);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Title bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: const BoxDecoration(
              color: purple,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'ISTILAH',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Menurut Istilah Fuqaha\'',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Definition text with quote styling
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 4,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [purple, Color(0xFFAB47BC)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Text(
                        'Bahagian-bahagian pewarisan yang telah ditetapkan melalui nas untuk diagihkan kepada waris yang berhak.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.7,
                          color: Color(0xFF222222),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // Three keyword chips
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    _KeywordChip(
                      keyword: 'Bahagian Pewarisan',
                      icon: Icons.pie_chart_rounded,
                      color: purple,
                    ),
                    _KeywordChip(
                      keyword: 'Ditetapkan melalui Nas',
                      icon: Icons.auto_stories_rounded,
                      color: purple,
                    ),
                    _KeywordChip(
                      keyword: 'Waris yang Berhak',
                      icon: Icons.people_alt_rounded,
                      color: purple,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Breakdown boxes for each keyword
                _BreakdownTile(
                  color: purple,
                  lightColor: purpleLight,
                  icon: Icons.pie_chart_rounded,
                  title: 'Bahagian Pewarisan',
                  body:
                      'Kadar bahagian yang spesifik seperti ½, ¼, ⅛, ⅔, ⅓ dan ⅙ — sudah ditentukan dan tidak boleh diubah sewenang-wenangnya.',
                ),
                const SizedBox(height: 10),
                _BreakdownTile(
                  color: purple,
                  lightColor: purpleLight,
                  icon: Icons.auto_stories_rounded,
                  title: 'Ditetapkan Melalui Nas',
                  body:
                      'Sumbernya adalah Al-Quran, Hadis dan Ijmak ulama — bukan berdasarkan adat atau budi bicara manusia semata-mata.',
                ),
                const SizedBox(height: 10),
                _BreakdownTile(
                  color: purple,
                  lightColor: purpleLight,
                  icon: Icons.people_alt_rounded,
                  title: 'Waris yang Berhak',
                  body:
                      'Hanya waris yang memenuhi syarat — Islam, tidak membunuh si mati, dan tiada halangan lain — layak menerima bahagian.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Keyword chip
class _KeywordChip extends StatelessWidget {
  final String keyword;
  final IconData icon;
  final Color color;
  const _KeywordChip(
      {required this.keyword, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 5),
          Text(
            keyword,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// Breakdown tile
class _BreakdownTile extends StatelessWidget {
  final Color color;
  final Color lightColor;
  final IconData icon;
  final String title;
  final String body;
  const _BreakdownTile({
    required this.color,
    required this.lightColor,
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: color.withOpacity(0.15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: TextStyle(
                    fontSize: 12.5,
                    height: 1.45,
                    color: Colors.grey.shade700,
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
// NAS / SUMBER DALIL CARD
// ─────────────────────────────────────────────────────────────────────────────
class _NasCard extends StatelessWidget {
  static const Color green = Color(0xFF2E7D32);
  static const Color greenLight = Color(0xFFE8F5E9);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: const BoxDecoration(
              color: green,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: const Row(
              children: [
                Icon(Icons.auto_stories_rounded,
                    color: Colors.white, size: 20),
                SizedBox(width: 10),
                Text(
                  'Sumber Nas',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                _NasItem(
                  label: 'Al-Quran',
                  icon: Icons.menu_book_rounded,
                  color: green,
                  lightColor: greenLight,
                  desc: 'Ayat-ayat faraid dalam Surah An-Nisa\' (ayat 11, 12 & 176) menetapkan kadar bahagian setiap waris secara jelas dan terperinci.',
                ),
                SizedBox(height: 10),
                _NasItem(
                  label: 'Hadis',
                  icon: Icons.record_voice_over_rounded,
                  color: green,
                  lightColor: greenLight,
                  desc: 'Sabda Rasulullah ﷺ: "Berikan bahagian faraid kepada yang berhak, selebihnya untuk lelaki yang paling dekat."  (Riwayat Bukhari & Muslim)',
                ),
                SizedBox(height: 10),
                _NasItem(
                  label: 'Ijmak',
                  icon: Icons.groups_rounded,
                  color: green,
                  lightColor: greenLight,
                  desc: 'Para ulama bersepakat bahawa ilmu faraid adalah fardu kifayah — wajib ada dalam kalangan umat Islam.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NasItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final Color lightColor;
  final String desc;
  const _NasItem({
    required this.label,
    required this.icon,
    required this.color,
    required this.lightColor,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: lightColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13.5,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.5,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// KESIMPULAN STRIP
// ─────────────────────────────────────────────────────────────────────────────
class _KesimpulanStrip extends StatelessWidget {
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
            child: const Icon(Icons.lightbulb_rounded, color: gold, size: 20),
          ),
          const SizedBox(width: 13),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ringkasan',
                  style: TextStyle(
                    color: gold,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Faraid dari segi bahasa bermaksud ketentuan, kewajipan dan keterangan. Manakala dari sudut istilah fuqaha\', ia adalah sistem pembahagian harta pusaka yang ditetapkan oleh nas syarak kepada waris yang layak — bukan terserah kepada pertimbangan manusia.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12.5,
                    height: 1.55,
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