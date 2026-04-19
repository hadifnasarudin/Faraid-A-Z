import 'package:flutter/material.dart';

class GlosariPage extends StatefulWidget {
  const GlosariPage({super.key});

  @override
  State<GlosariPage> createState() => _GlosariPageState();
}

class _GlosariPageState extends State<GlosariPage> {
  String _query = '';

  static const Color primaryColor = Color(0xFF2E3192);
  static const Color navy = Color(0xFF0D1247);
  static const Color gold = Color(0xFFC9A84C);

  static const List<_GlosariData> glosariList = [
    _GlosariData(
      title: 'Faraid',
      arabic: 'الفَرَائِض',
      description:
          'Undang-undang Islam yang mengawal pembahagian harta pusaka si mati kepada waris-waris yang berhak mengikut kadar yang telah ditetapkan oleh syarak.',
    ),
    _GlosariData(
      title: 'Harta Pusaka',
      arabic: 'التَّرِكَة',
      description:
          'Harta yang ditinggalkan oleh si mati untuk diagihkan kepada waris — merangkumi harta alih, harta tidak alih dan hak-hak yang boleh diwarisi.',
    ),
    _GlosariData(
      title: 'Waris',
      arabic: 'الوَارِث',
      description:
          'Individu yang masih hidup dan berhak menerima bahagian harta pusaka secara sah berdasarkan hubungan nasab, perkahwinan atau wala\'.',
    ),
    _GlosariData(
      title: 'Si Mati / Pewaris',
      arabic: 'المُوَرِّث',
      description:
          'Seseorang yang telah meninggal dunia dan meninggalkan harta pusaka untuk diagihkan kepada waris-warisnya yang layak.',
    ),
    _GlosariData(
      title: 'Zawil Furud',
      arabic: 'ذَوِي الفُرُوض',
      description:
          'Waris yang berhak mendapat bahagian tetap (furud muqaddarah) seperti ½, ¼, ⅛, ⅔, ⅓ atau ⅙ — sebagaimana yang telah ditetapkan dalam Al-Quran.',
    ),
    _GlosariData(
      title: 'Asabah',
      arabic: 'العَصَبَة',
      description:
          'Waris yang menerima baki harta pusaka selepas bahagian Zawil Furud diagihkan. Jika tiada Zawil Furud, Asabah mewarisi keseluruhan harta.',
    ),
    _GlosariData(
      title: 'Asabah Ma\'al Ghairi',
      arabic: 'عَصَبَة مَعَ الغَيْر',
      description:
          'Waris perempuan yang menjadi Asabah apabila ditemani oleh waris perempuan tertentu — contohnya saudara perempuan yang menjadi Asabah bersama anak perempuan.',
    ),
    _GlosariData(
      title: 'Hajb',
      arabic: 'الحَجْب',
      description:
          'Penghalangan seseorang waris daripada menerima bahagiannya — sama ada hajb hirman (gugur sepenuhnya) atau hajb nuqsan (berkurang bahagiannya).',
    ),
    _GlosariData(
      title: 'Wasiat',
      arabic: 'الوَصِيَّة',
      description:
          'Perintah atau permintaan yang dibuat semasa hidup untuk dilaksanakan selepas kematian — terhad kepada tidak melebihi 1/3 daripada harta dan hanya kepada bukan waris.',
    ),
    _GlosariData(
      title: 'Harta Sepencarian',
      arabic: 'مَال الشَّرِيكَة',
      description:
          'Harta yang dikumpul bersama suami isteri semasa perkahwinan. Ia bukan harta pusaka dan perlu diselesaikan tuntutannya sebelum harta dibahagikan kepada waris.',
    ),
    _GlosariData(
      title: 'Mafqud',
      arabic: 'المَفْقُود',
      description:
          'Orang yang hilang dalam tempoh yang lama tanpa sebarang berita. Hakim boleh menetapkan kematiannya (kematian taqdiri) untuk tujuan pewarisan.',
    ),
    _GlosariData(
      title: 'Wala\'',
      arabic: 'الوَلَاء',
      description:
          'Hubungan pewarisan antara tuan yang memerdekakan hamba dengan bekas hambanya. Menjadi sebab pewarisan apabila tiada waris nasab atau perkahwinan.',
    ),
  ];

  List<_GlosariData> get _filtered {
    if (_query.isEmpty) return glosariList;
    return glosariList.where((g) =>
      g.title.toLowerCase().contains(_query.toLowerCase()) ||
      g.description.toLowerCase().contains(_query.toLowerCase()) ||
      g.arabic.contains(_query)
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Glosari',
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
                  "Glosari Faraid",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Senarai istilah dan terjemahan berkaitan ilmu faraid.",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── Search bar ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (val) => setState(() => _query = val),
                style: const TextStyle(fontSize: 13.5),
                decoration: InputDecoration(
                  hintText: 'Cari istilah...',
                  hintStyle: TextStyle(
                      color: Colors.grey.shade400, fontSize: 13.5),
                  prefixIcon: Icon(Icons.search_rounded,
                      color: Colors.grey.shade400, size: 20),
                  suffixIcon: _query.isNotEmpty
                      ? GestureDetector(
                          onTap: () => setState(() => _query = ''),
                          child: Icon(Icons.close_rounded,
                              color: Colors.grey.shade400, size: 18),
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // ── Count row ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  '${filtered.length} istilah',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (_query.isNotEmpty) ...[
                  const Spacer(),
                  GestureDetector(
                    onTap: () => setState(() => _query = ''),
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 12,
                        color: primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 8),

          // ── List ──
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off_rounded,
                            size: 48, color: Colors.grey.shade300),
                        const SizedBox(height: 12),
                        Text(
                          'Tiada istilah dijumpai',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) => _GlosariCard(
                      data: filtered[i],
                      index: i,
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
class _GlosariData {
  final String title;
  final String arabic;
  final String description;
  const _GlosariData({
    required this.title,
    required this.arabic,
    required this.description,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// GLOSARI CARD
// ─────────────────────────────────────────────────────────────────────────────
class _GlosariCard extends StatelessWidget {
  final _GlosariData data;
  final int index;

  static const Color primaryColor = Color(0xFF2E3192);

  const _GlosariCard({required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Number circle ──
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.10),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    color: primaryColor,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // ── Content ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Title + Arabic row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          data.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.5,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: primaryColor.withOpacity(0.15)),
                        ),
                        child: Text(
                          data.arabic,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Left border + description
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 3,
                        height: 52,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          data.description,
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.55,
                            color: Colors.grey.shade600,
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
      ),
    );
  }
}