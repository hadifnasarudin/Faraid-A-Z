import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Panggil dari ilmu_faraid_screen.dart:
//
//   case "Syarat-syarat Faraid":
//     _openSheet(context, const SyaratFaraidSheet());
//     break;
// ─────────────────────────────────────────────────────────────────────────────
class SyaratFaraidSheet extends StatelessWidget {
  const SyaratFaraidSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.92,
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
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 36),
              child: Column(
                children: [
                  _HeroHeader(),
                  const SizedBox(height: 20),
                  _SyaratCard(
                    number: '01',
                    title: 'Kematian Pewaris',
                    subtitle: 'Al-Muwarrith',
                    icon: Icons.person_off_rounded,
                    gradient: [Color(0xFF0D1247), Color(0xFF2E3192)],
                    lightColor: Color(0xFFE8EAF6),
                    accentColor: Color(0xFF2E3192),
                    definisi:
                        'Pewaris (si mati) mestilah telah meninggal dunia — sama ada kematian hakiki, kematian hukmi, atau kematian taqdiri.',
                    huraianItems: [
                      _HuraianItem(
                        icon: Icons.close_rounded,
                        label: 'Kematian Hakiki',
                        desc:
                            'Kematian yang benar-benar berlaku dan disahkan — rohnya telah berpisah dengan jasad.',
                      ),
                      _HuraianItem(
                        icon: Icons.gavel_rounded,
                        label: 'Kematian Hukmi',
                        desc:
                            'Kematian yang ditetapkan oleh hakim melalui hukuman — contohnya pesalah yang dihukum bunuh oleh mahkamah.',
                      ),
                      _HuraianItem(
                        icon: Icons.calculate_rounded,
                        label: 'Kematian Taqdiri',
                        desc:
                            'Kematian yang dianggarkan oleh hakim kerana orang tersebut hilang dalam jangka masa yang sangat lama tanpa sebarang berita (mafqud).',
                      ),
                    ],
                    contoh:
                        'Seorang bapa meninggal dunia. Hartanya baru boleh dibahagikan kepada anak-anaknya selepas kematiannya disahkan — bukan sebelum.',
                    nota: 'Harta orang yang masih hidup tidak boleh dibahagikan sebagai pusaka walaupun ia sakit tenat.',
                  ),
                  _TimelineConnector(),
                  _SyaratCard(
                    number: '02',
                    title: 'Hidupnya Waris',
                    subtitle: 'Al-Wārith',
                    icon: Icons.favorite_rounded,
                    gradient: [Color(0xFF1B5E20), Color(0xFF388E3C)],
                    lightColor: Color(0xFFE8F5E9),
                    accentColor: Color(0xFF2E7D32),
                    definisi:
                        'Waris mestilah masih hidup pada saat pewaris meninggal dunia — sama ada hidup hakiki atau hidup taqdiri (dalam kandungan).',
                    huraianItems: [
                      _HuraianItem(
                        icon: Icons.person_rounded,
                        label: 'Hidup Hakiki',
                        desc:
                            'Waris yang benar-benar masih hidup ketika pewaris meninggal dunia dan disahkan masih bernyawa.',
                      ),
                      _HuraianItem(
                        icon: Icons.child_care_rounded,
                        label: 'Hidup Taqdiri (Janin)',
                        desc:
                            'Bayi dalam kandungan dianggap hidup dan berhak mewarisi — dengan syarat dilahirkan hidup walaupun hanya seketika.',
                      ),
                      _HuraianItem(
                        icon: Icons.timer_off_rounded,
                        label: 'Waris Yang Mati Lebih Awal',
                        desc:
                            'Jika waris mati sebelum pewaris, dia tidak berhak mewarisi langsung — bahagiannya tidak boleh dipindah kepada warisnya pula.',
                      ),
                    ],
                    contoh:
                        'Si bapa meninggal, meninggalkan seorang isteri yang sedang mengandung 7 bulan. Bayi dalam kandungan itu berhak mendapat bahagian faraid — tetapi bahagiannya ditangguhkan sehingga dilahirkan.',
                    nota: 'Jika dua orang meninggal serentak (contoh: kemalangan), tiada yang mewarisi antara satu sama lain kecuali dapat dipastikan siapa yang mati dahulu.',
                  ),
                  _TimelineConnector(),
                  _SyaratCard(
                    number: '03',
                    title: 'Mengetahui Sebab Hubungan',
                    subtitle: 'Asbāb al-Irth',
                    icon: Icons.account_tree_rounded,
                    gradient: [Color(0xFF4A148C), Color(0xFF7B1FA2)],
                    lightColor: Color(0xFFF3E5F5),
                    accentColor: Color(0xFF6A1B9A),
                    definisi:
                        'Mesti ada hubungan yang jelas dan sah antara pewaris dan waris — iaitu melalui salah satu daripada tiga sebab pewarisan yang diiktiraf syarak.',
                    huraianItems: [
                      _HuraianItem(
                        icon: Icons.favorite_border_rounded,
                        label: 'Perkahwinan (Nikah)',
                        desc:
                            'Akad nikah yang sah menjadikan suami dan isteri mewarisi antara satu sama lain selagi tidak berlaku talak bain (cerai mutlak).',
                      ),
                      _HuraianItem(
                        icon: Icons.family_restroom_rounded,
                        label: 'Keturunan (Nasab)',
                        desc:
                            'Hubungan darah yang sah — anak, ibu bapa, adik-beradik, datuk, nenek dan sebagainya — menjadi sebab utama pewarisan.',
                      ),
                      _HuraianItem(
                        icon: Icons.shield_rounded,
                        label: 'Wala\' (Pemerdekaan)',
                        desc:
                            'Hubungan antara bekas hamba dengan tuannya yang memerdekakannya. Jarang berlaku pada zaman ini.',
                      ),
                    ],
                    contoh:
                        'Seorang lelaki meninggal tanpa waris nasab. Jika dia pernah memerdekakan seorang hamba, hamba tersebut (atau keturunannya) boleh mewarisi hartanya melalui hubungan wala\'.',
                    nota: 'Tiada hubungan yang sah = tiada hak waris. Anak angkat TIDAK mewarisi melalui nasab — hanya boleh menerima wasiat tidak melebihi 1/3.',
                  ),
                  _TimelineConnector(),
                  _SyaratCard(
                    number: '04',
                    title: 'Tiada Halangan Pewarisan',
                    subtitle: 'Mawāni\' al-Irth',
                    icon: Icons.block_rounded,
                    gradient: [Color(0xFF7B2D00), Color(0xFFBF360C)],
                    lightColor: Color(0xFFFBE9E7),
                    accentColor: Color(0xFFBF360C),
                    definisi:
                        'Waris mestilah bebas daripada semua halangan pewarisan yang ditetapkan syarak. Jika ada halangan, hak waris gugur sepenuhnya.',
                    huraianItems: [
                      _HuraianItem(
                        icon: Icons.not_interested_rounded,
                        label: 'Pembunuhan (Qatl)',
                        desc:
                            'Waris yang membunuh pewaris — sama ada sengaja atau tidak — hilang hak untuk mewarisi hartanya.',
                      ),
                      _HuraianItem(
                        icon: Icons.mosque_rounded,
                        label: 'Beza Agama (Ikhtilāf al-Dīn)',
                        desc:
                            'Muslim tidak mewarisi daripada bukan Muslim, dan bukan Muslim tidak mewarisi daripada Muslim.',
                      ),
                      _HuraianItem(
                        icon: Icons.public_off_rounded,
                        label: 'Perbezaan Negara (Ikhtilāf al-Dār)',
                        desc:
                            'Dalam konteks tertentu, perbezaan kewarganegaraan antara pewaris dan waris boleh menjadi halangan. Tertakluk kepada pandangan mazhab.',
                      ),
                    ],
                    contoh:
                        'Seorang anak yang murtad tidak berhak mewarisi harta bapa Muslimnya. Begitu juga anak yang dengan sengaja membunuh bapanya — dia hilang hak waris sepenuhnya.',
                    nota: 'Halangan pewarisan tidak menjejaskan waris-waris lain. Hak gugur hanya untuk individu yang ada halangan tersebut.',
                  ),
                  const SizedBox(height: 16),
                  _RumusanStrip(),
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
          Positioned(
            right: -10,
            bottom: -10,
            child: Icon(
              Icons.checklist_rounded,
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
                    child: const Icon(Icons.check_circle_outline_rounded,
                        color: Colors.white, size: 26),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Syarat-syarat Faraid',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.3,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Syarat-syarat Faraid • Topik 5',
                          style: TextStyle(
                              color: Colors.white54, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
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
              Row(
                children: [
                  _StatChip(label: '4', sublabel: 'Syarat'),
                  const SizedBox(width: 10),
                  _StatChip(label: '3', sublabel: 'Jenis Kematian'),
                  const SizedBox(width: 10),
                  _StatChip(label: '3', sublabel: 'Halangan'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String sublabel;
  const _StatChip({required this.label, required this.sublabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFEDD98A),
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
          Text(
            sublabel,
            style: const TextStyle(color: Colors.white60, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// TIMELINE CONNECTOR between cards
// ─────────────────────────────────────────────────────────────────────────────
class _TimelineConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 2,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFF2E3192).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xFF2E3192).withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 2,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFF2E3192).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
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
// SYARAT CARD
// ─────────────────────────────────────────────────────────────────────────────
class _HuraianItem {
  final IconData icon;
  final String label;
  final String desc;
  const _HuraianItem(
      {required this.icon, required this.label, required this.desc});
}

class _SyaratCard extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradient;
  final Color lightColor;
  final Color accentColor;
  final String definisi;
  final List<_HuraianItem> huraianItems;
  final String contoh;
  final String nota;

  const _SyaratCard({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    required this.lightColor,
    required this.accentColor,
    required this.definisi,
    required this.huraianItems,
    required this.contoh,
    required this.nota,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradient.first.withOpacity(0.12),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── Title bar ──
          Container(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Center(
                    child: Text(
                      number,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        letterSpacing: 0.5,
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
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.5,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.65),
                          fontSize: 11.5,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(icon,
                    color: Colors.white.withOpacity(0.6), size: 22),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ── Definisi ──
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 4,
                      height: 64,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        definisi,
                        style: const TextStyle(
                          fontSize: 13.5,
                          height: 1.65,
                          color: Color(0xFF222222),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                Divider(color: Colors.grey.shade100),
                const SizedBox(height: 12),

                // ── Huraian label ──
                Text(
                  'Huraian:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: accentColor,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 12),

                // ── Huraian timeline ──
                ...List.generate(huraianItems.length, (i) {
                  final item = huraianItems[i];
                  final isLast = i == huraianItems.length - 1;
                  return IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                      color:
                                          accentColor.withOpacity(0.2)),
                                ),
                                child: Icon(item.icon,
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
                                      borderRadius:
                                          BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: isLast ? 0 : 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.label,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                    color: accentColor,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  item.desc,
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    height: 1.45,
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

                const SizedBox(height: 14),
                Divider(color: Colors.grey.shade100),
                const SizedBox(height: 12),

                // ── Contoh ──
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                        color: accentColor.withOpacity(0.15)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.lightbulb_rounded,
                          color: accentColor, size: 17),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contoh',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: accentColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              contoh,
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
                  ),
                ),

                const SizedBox(height: 10),

                // ── Nota ──
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8E1),
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                        color: const Color(0xFFC9A84C).withOpacity(0.25)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.info_outline_rounded,
                          color: Color(0xFFC9A84C), size: 17),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nota Penting',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFC9A84C),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              nota,
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
// RUMUSAN STRIP
// ─────────────────────────────────────────────────────────────────────────────
class _RumusanStrip extends StatelessWidget {
  static const Color navy = Color(0xFF0D1247);
  static const Color gold = Color(0xFFC9A84C);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: navy,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(0.28),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: gold.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.checklist_rounded,
                    color: gold, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                'Rumusan Syarat Faraid',
                style: TextStyle(
                  color: gold,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...[
            '01  Pewaris mesti telah meninggal dunia (hakiki / hukmi / taqdiri)',
            '02  Waris mesti masih hidup ketika pewaris meninggal',
            '03  Hubungan pewarisan yang sah mesti wujud antara keduanya',
            '04  Waris mesti bebas daripada semua halangan pewarisan',
          ].map(
            (text) => Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: gold,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12.5,
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}