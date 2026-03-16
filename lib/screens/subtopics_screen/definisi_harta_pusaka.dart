import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// HOW TO CALL THIS BOTTOM SHEET from ilmu_faraid_screen.dart
//
// Replace openPage() with:
//
//   void openPage(BuildContext context, String title) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) => DefinisiHartaPusakaSheet(),
//     );
//   }
// ─────────────────────────────────────────────────────────────────────────────

class DefinisiHartaPusakaSheet extends StatelessWidget {
  const DefinisiHartaPusakaSheet({super.key});

  static const Color primaryColor = Color(0xFF2E3192);
  static const Color accentColor = Color(0xFF4CAF82);
  static const Color dangerColor = Color(0xFFE53935);
  static const Color bgColor = Color(0xFFF4F6FA);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.92,
      decoration: const BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          // ── Drag handle ──
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

          // ── Scrollable content ──
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ── Hero header card ──
                  _HeroCard(),
                  const SizedBox(height: 16),

                  // ── Definisi card ──
                  _DefinisiCard(),
                  const SizedBox(height: 16),

                  // ── Mindmap / Canva image card ──
                  // _MindmapCard(),
                  // const SizedBox(height: 16),

                  // ── Contoh harta pusaka ──
                  _ContohHartaCard(),
                  const SizedBox(height: 16),

                  // ── Bukan harta pusaka ──
                  _BukanHartaCard(),
                  const SizedBox(height: 16),

                  // ── Nota penting ──
                  _NotaPentingCard(),
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
// HERO HEADER CARD
// ─────────────────────────────────────────────────────────────────────────────
class _HeroCard extends StatelessWidget {
  static const Color primaryColor = Color(0xFF2E3192);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2E3192), Color(0xFF1B1E6E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon bubble
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.account_balance_wallet_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Definisi Harta Pusaka",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Maksud Harta Pusaka • Topik 1",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
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
// DEFINISI CARD — with quote-style highlight
// ─────────────────────────────────────────────────────────────────────────────
class _DefinisiCard extends StatelessWidget {
  static const Color primaryColor = Color(0xFF2E3192);

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
          // Title bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: const BoxDecoration(
              color: Color(0xFF2E3192),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: const Row(
              children: [
                Icon(Icons.format_quote_rounded, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  "Definisi",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          // Content with left border accent
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 4,
                  height: 80,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Text(
                    "Harta pusaka ialah harta peninggalan si mati iaitu harta yang dimiliki oleh si mati semasa hayatnya dan berkekalan miliknya sehingga dia meninggal dunia.",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.65,
                      color: Color(0xFF333333),
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
}

// ─────────────────────────────────────────────────────────────────────────────
// MINDMAP CARD — placeholder for Canva image
// ─────────────────────────────────────────────────────────────────────────────
class _MindmapCard extends StatelessWidget {
  static const Color primaryColor = Color(0xFF2E3192);

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
              color: Color(0xFF2E3192),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: const Row(
              children: [
                Icon(Icons.account_tree_rounded, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  "Gambaran Ringkas",
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                // ── GANTI PATH INI dengan image Canva awak ──
                "assets/images/harta_pusaka_mindmap.png",
                width: double.infinity,
                fit: BoxFit.contain,
                // Placeholder kalau image belum ada
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: primaryColor.withOpacity(0.2),
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          color: primaryColor.withOpacity(0.4),
                          size: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Letak infographic Canva di sini\nassets/images/harta_pusaka_mindmap.png",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryColor.withOpacity(0.5),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CONTOH HARTA PUSAKA — grid chips style
// ─────────────────────────────────────────────────────────────────────────────
class _ContohHartaCard extends StatelessWidget {
  static const Color primaryColor = Color(0xFF2E3192);
  static const Color accentColor = Color(0xFF4CAF82);

  static const List<Map<String, dynamic>> items = [
    {"label": "Rumah",         "icon": Icons.home_rounded},
    {"label": "Tanah",         "icon": Icons.landscape_rounded},
    {"label": "Wang Simpanan", "icon": Icons.savings_rounded},
    {"label": "Kereta",        "icon": Icons.directions_car_rounded},
    {"label": "Perniagaan",    "icon": Icons.store_rounded},
    {"label": "Pelaburan",     "icon": Icons.trending_up_rounded},
  ];

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
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: const Row(
              children: [
                Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  "Contoh Harta Pusaka",
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
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.0,
              children: items.map((item) {
                return Container(
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: accentColor.withOpacity(0.25),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item["icon"] as IconData, color: accentColor, size: 28),
                      const SizedBox(height: 6),
                      Text(
                        item["label"] as String,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: accentColor.withOpacity(0.85),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BUKAN HARTA PUSAKA — red-toned with X badges
// ─────────────────────────────────────────────────────────────────────────────
class _BukanHartaCard extends StatelessWidget {
  static const Color dangerColor = Color(0xFFE53935);

  static const List<Map<String, dynamic>> items = [
    {
      "label": "Harta yang telah dihibahkan",
      "desc": "Sudah dipindahkan milik semasa hidup",
      "icon": Icons.card_giftcard_rounded,
    },
    {
      "label": "Harta Wakaf",
      "desc": "Telah diwakafkan untuk tujuan agama",
      "icon": Icons.mosque_rounded,
    },
    {
      "label": "Harta Amanah",
      "desc": "Dipercayakan kepada orang lain",
      "icon": Icons.lock_rounded,
    },
  ];

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
              color: Color(0xFFE53935),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: const Row(
              children: [
                Icon(Icons.cancel_rounded, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  "Bukan Harta Pusaka",
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
              children: items.map((item) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: dangerColor.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: dangerColor.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: dangerColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          item["icon"] as IconData,
                          color: dangerColor,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["label"] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item["desc"] as String,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.close_rounded, color: dangerColor, size: 18),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// NOTA PENTING — numbered steps with icons
// ─────────────────────────────────────────────────────────────────────────────
class _NotaPentingCard extends StatelessWidget {
  static const Color primaryColor = Color(0xFF2E3192);
  static const Color amberColor = Color(0xFFF59E0B);

  static const List<Map<String, dynamic>> steps = [
    {
      "step": "1",
      "title": "Kos Pengurusan Jenazah",
      "desc": "Perbelanjaan memandikan, mengkafan, menyembahyangkan & mengebumikan si mati.",
      "icon": Icons.volunteer_activism_rounded,
    },
    {
      "step": "2",
      "title": "Hutang Si Mati",
      "desc": "Semua hutang termasuk hutang kepada Allah (zakat, nazar) dan hutang sesama manusia.",
      "icon": Icons.receipt_long_rounded,
    },
    {
      "step": "3",
      "title": "Wasiat",
      "desc": "Dilaksanakan jika ada, tertakluk kepada 1/3 daripada baki harta.",
      "icon": Icons.description_rounded,
    },
  ];

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
              color: Color(0xFFF59E0B),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: const Row(
              children: [
                Icon(Icons.lightbulb_rounded, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  "Nota Penting",
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
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Harta pusaka hanya boleh dibahagikan SELEPAS:",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 14),

                // Timeline steps
                ...List.generate(steps.length, (i) {
                  final step = steps[i];
                  final isLast = i == steps.length - 1;
                  return IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Timeline column
                        SizedBox(
                          width: 40,
                          child: Column(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: amberColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    step["step"] as String,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              if (!isLast)
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    margin: const EdgeInsets.symmetric(vertical: 4),
                                    color: amberColor.withOpacity(0.3),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Content
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  step["title"] as String,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  step["desc"] as String,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                    height: 1.4,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}