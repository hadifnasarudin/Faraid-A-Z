import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Panggil dari ilmu_faraid_screen.dart:
//
//   case "Kepentingan Faraid":
//     _openSheet(context, const KepentinganFaraidSheet());
//     break;
// ─────────────────────────────────────────────────────────────────────────────
class KepentinganFaraidSheet extends StatelessWidget {
  const KepentinganFaraidSheet({super.key});

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
                  _KepentinganCard(
                    number: '01',
                    title: 'Mekanisme Pengurusan Harta Keluarga',
                    icon: Icons.account_balance_rounded,
                    gradient: [Color(0xFF0D1247), Color(0xFF2E3192)],
                    accentColor: Color(0xFF82B1FF),
                    lightColor: Color(0xFFE8EAF6),
                    points: [
                      _Point(
                        icon: Icons.shield_rounded,
                        title: 'Melindungi Hak Waris',
                        desc:
                            'Setiap waris mendapat bahagian yang telah ditetapkan syarak — tiada siapa boleh dinafikan haknya tanpa sebab yang sah.',
                      ),
                      _Point(
                        icon: Icons.balance_rounded,
                        title: 'Pembahagian Teratur & Sistematik',
                        desc:
                            'Harta diagihkan mengikut kadar yang adil berdasarkan tanggungjawab dan hubungan kekeluargaan, bukan mengikut hawa nafsu.',
                      ),
                      _Point(
                        icon: Icons.trending_down_rounded,
                        title: 'Mencegah Penumpuan Kekayaan',
                        desc:
                            'Harta si mati tersebar kepada ramai waris — mengelakkan kekayaan terkumpul di tangan satu pihak sahaja.',
                      ),
                      _Point(
                        icon: Icons.family_restroom_rounded,
                        title: 'Menjaga Kesinambungan Keluarga',
                        desc:
                            'Sistem ini memastikan generasi seterusnya turut mendapat manfaat daripada usaha dan harta yang ditinggalkan.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _KepentinganCard(
                    number: '02',
                    title: 'Pentadbiran Keadilan & Perdamaian',
                    icon: Icons.gavel_rounded,
                    gradient: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                    accentColor: Color(0xFFA5D6A7),
                    lightColor: Color(0xFFE8F5E9),
                    points: [
                      _Point(
                        icon: Icons.handshake_rounded,
                        title: 'Menyelesaikan Pertikaian',
                        desc:
                            'Apabila pembahagian mengikut faraid, tiada ruang untuk perselisihan kerana kadar setiap waris sudah jelas ditetapkan.',
                      ),
                      _Point(
                        icon: Icons.verified_rounded,
                        title: 'Keadilan Ilahi',
                        desc:
                            'Keadilan faraid bukan datang dari manusia — ia datang daripada Allah yang Maha Mengetahui keperluan setiap hambaNya.',
                      ),
                      _Point(
                        icon: Icons.people_rounded,
                        title: 'Memelihara Hubungan Persaudaraan',
                        desc:
                            'Sistem yang adil mengelakkan rasa cemburu, dendam dan permusuhan dalam kalangan ahli keluarga.',
                      ),
                      _Point(
                        icon: Icons.public_rounded,
                        title: 'Keharmonian Sosial',
                        desc:
                            'Masyarakat yang mengamalkan faraid lebih aman dan harmoni kerana hak individu terpelihara dengan sempurna.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _KepentinganCard(
                    number: '03',
                    title: 'Lambang Keutuhan Ikatan Keluarga Islam',
                    icon: Icons.favorite_rounded,
                    gradient: [Color(0xFF880E4F), Color(0xFFC2185B)],
                    accentColor: Color(0xFFF48FB1),
                    lightColor: Color(0xFFFCE4EC),
                    points: [
                      _Point(
                        icon: Icons.mosque_rounded,
                        title: 'Ikatan Aqidah & Kekeluargaan',
                        desc:
                            'Faraid mengikat waris bukan sekadar melalui darah, tetapi melalui ikatan iman — hanya Muslim yang mewarisi Muslim.',
                      ),
                      _Point(
                        icon: Icons.auto_stories_rounded,
                        title: 'Cerminan Syariat Islam yang Sempurna',
                        desc:
                            'Islam mengatur kehidupan dari lahir hingga mati — faraid adalah bukti Islam mengambil berat tentang keadilan selepas kematian.',
                      ),
                      _Point(
                        icon: Icons.connect_without_contact_rounded,
                        title: 'Mengeratkan Silaturrahim',
                        desc:
                            'Proses pengurusan faraid bersama mendorong ahli keluarga untuk berbincang, berhubung dan saling mengenali antara satu sama lain.',
                      ),
                      _Point(
                        icon: Icons.psychology_rounded,
                        title: 'Mendidik Umat Tentang Tanggungjawab',
                        desc:
                            'Mempelajari faraid mendidik setiap Muslim untuk bertanggungjawab terhadap harta dan meninggalkan legasi yang baik.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _HadithStrip(),
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
          // Ghost icon background
          Positioned(
            right: -10,
            bottom: -10,
            child: Icon(
              Icons.star_rounded,
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
                    child: const Icon(Icons.star_rounded,
                        color: Colors.white, size: 26),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kepentingan Faraid',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.3,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Kepentingan Faraid • Topik 3',
                          style: TextStyle(
                              color: Colors.white54, fontSize: 12),
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
              // 3 stat chips
              Row(
                children: [
                  _StatChip(label: '3', sublabel: 'Kepentingan'),
                  const SizedBox(width: 10),
                  _StatChip(label: '12', sublabel: 'Poin Utama'),
                  const SizedBox(width: 10),
                  _StatChip(label: 'Wajib', sublabel: 'Dipelajari'),
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
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// KEPENTINGAN CARD — numbered, expandable feel
// ─────────────────────────────────────────────────────────────────────────────
class _Point {
  final IconData icon;
  final String title;
  final String desc;
  const _Point({required this.icon, required this.title, required this.desc});
}

class _KepentinganCard extends StatelessWidget {
  final String number;
  final String title;
  final IconData icon;
  final List<Color> gradient;
  final Color accentColor;
  final Color lightColor;
  final List<_Point> points;

  const _KepentinganCard({
    required this.number,
    required this.title,
    required this.icon,
    required this.gradient,
    required this.accentColor,
    required this.lightColor,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = gradient.first;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: baseColor.withOpacity(0.12),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── Title bar with gradient ──
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
                // Number badge
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
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
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 1.3,
                    ),
                  ),
                ),
                Icon(icon, color: Colors.white.withOpacity(0.6), size: 22),
              ],
            ),
          ),

          // ── Points list ──
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: List.generate(points.length, (i) {
                final p = points[i];
                final isLast = i == points.length - 1;
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
                                    color: baseColor.withOpacity(0.2)),
                              ),
                              child:
                                  Icon(p.icon, color: baseColor, size: 17),
                            ),
                            if (!isLast)
                              Expanded(
                                child: Container(
                                  width: 2,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 4),
                                  decoration: BoxDecoration(
                                    color: baseColor.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Content
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: isLast ? 0 : 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                p.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13.5,
                                  color: baseColor,
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
}

// ─────────────────────────────────────────────────────────────────────────────
// HADITH STRIP — closing reminder
// ─────────────────────────────────────────────────────────────────────────────
class _HadithStrip extends StatelessWidget {
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: gold.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.format_quote_rounded,
                color: gold, size: 20),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '"Pelajarilah ilmu faraid dan ajarkanlah ia, kerana sesungguhnya ia adalah separuh daripada ilmu."',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.5,
                    height: 1.6,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '— Hadis Riwayat Ibn Majah & Ad-Daraqutni',
                  style: TextStyle(color: gold, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}