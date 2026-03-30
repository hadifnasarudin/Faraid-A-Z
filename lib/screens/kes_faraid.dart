import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// KES FARAID LIST PAGE
// ═════════════════════════════════════════════════════════════════════════════
class KesFaraidListPage extends StatefulWidget {
  const KesFaraidListPage({super.key});

  @override
  State<KesFaraidListPage> createState() => _KesFaraidListPageState();
}

class _KesFaraidListPageState extends State<KesFaraidListPage> {
  String? _expandedId;

  static const Color primaryColor = Color(0xFF2E3192);
  static const Color navy = Color(0xFF0D1247);
  static const Color gold = Color(0xFFC9A84C);

  static const List<_KesData> kesList = [
    _KesData(
      id: '1',
      title: 'Kes 1: Pasangan Suami Isteri dengan Anak',
      difficulty: 'Mudah',
      harta: 300000,
      scenario:
          'Encik Ahmad meninggal dunia meninggalkan harta sebanyak RM300,000. Beliau mempunyai seorang isteri, dua orang anak lelaki dan seorang anak perempuan.',
      waris: [
        _Waris(nama: 'Isteri', bilangan: 1),
        _Waris(nama: 'Anak Lelaki', bilangan: 2),
        _Waris(nama: 'Anak Perempuan', bilangan: 1),
      ],
      langkah: [
        'Isteri mendapat ⅛ kerana ada anak (RM37,500)',
        'Baki harta (RM262,500) dibahagi kepada anak-anak',
        'Anak lelaki mendapat 2 bahagian, anak perempuan 1 bahagian',
        'Jumlah bahagian: (2×2) + (1×1) = 5 bahagian',
        'Setiap bahagian: RM262,500 ÷ 5 = RM52,500',
      ],
      pembahagian: [
        _Bahagian(waris: 'Isteri', pecahan: '⅛', jumlah: 37500),
        _Bahagian(waris: 'Anak Lelaki (2 orang)', pecahan: '2 bhg setiap seorang', jumlah: 210000),
        _Bahagian(waris: 'Anak Perempuan', pecahan: '1 bahagian', jumlah: 52500),
      ],
    ),
    _KesData(
      id: '2',
      title: 'Kes 2: Tiada Anak, Ada Ibu Bapa',
      difficulty: 'Mudah',
      harta: 500000,
      scenario:
          'Encik Bakar meninggal dunia dengan harta RM500,000. Beliau tidak mempunyai anak, tetapi meninggalkan isteri, bapa dan ibu.',
      waris: [
        _Waris(nama: 'Isteri', bilangan: 1),
        _Waris(nama: 'Bapa', bilangan: 1),
        _Waris(nama: 'Ibu', bilangan: 1),
      ],
      langkah: [
        'Isteri mendapat ¼ kerana tiada anak (RM125,000)',
        'Ibu mendapat ⅓ dari baki selepas bahagian isteri',
        'Baki selepas isteri: RM375,000',
        'Ibu: ⅓ × RM375,000 = RM125,000',
        'Bapa mendapat baki sebagai asabah (RM250,000)',
      ],
      pembahagian: [
        _Bahagian(waris: 'Isteri', pecahan: '¼', jumlah: 125000),
        _Bahagian(waris: 'Ibu', pecahan: '⅓ dari baki', jumlah: 125000),
        _Bahagian(waris: 'Bapa', pecahan: 'Asabah (baki)', jumlah: 250000),
      ],
    ),
    _KesData(
      id: '3',
      title: 'Kes 3: Anak Perempuan Sahaja',
      difficulty: 'Sederhana',
      harta: 600000,
      scenario:
          'Puan Siti meninggal dunia meninggalkan harta RM600,000. Waris termasuk suami, 2 orang anak perempuan dan bapa.',
      waris: [
        _Waris(nama: 'Suami', bilangan: 1),
        _Waris(nama: 'Anak Perempuan', bilangan: 2),
        _Waris(nama: 'Bapa', bilangan: 1),
      ],
      langkah: [
        'Suami mendapat ¼ kerana ada anak (RM150,000)',
        '2 anak perempuan mendapat ⅔ bersama (RM400,000)',
        'Bapa mendapat ⅙ (RM100,000)',
        'Jumlah: RM150,000 + RM400,000 + RM100,000 = RM650,000',
        'Terjadi aul (lebihan), diselesaikan dengan penyesuaian kadar',
      ],
      pembahagian: [
        _Bahagian(waris: 'Suami', pecahan: '¼ (disesuaikan)', jumlah: 138462),
        _Bahagian(waris: 'Anak Perempuan (2 orang)', pecahan: '⅔ (disesuaikan)', jumlah: 369231),
        _Bahagian(waris: 'Bapa', pecahan: '⅙ (disesuaikan)', jumlah: 92307),
      ],
    ),
    _KesData(
      id: '4',
      title: 'Kes 4: Saudara-mara Sebagai Waris',
      difficulty: 'Sederhana',
      harta: 400000,
      scenario:
          'Encik Daud meninggal dunia tanpa anak dan bapa telah meninggal lebih awal. Harta sebanyak RM400,000 ditinggalkan kepada isteri, ibu dan 2 orang saudara lelaki.',
      waris: [
        _Waris(nama: 'Isteri', bilangan: 1),
        _Waris(nama: 'Ibu', bilangan: 1),
        _Waris(nama: 'Saudara Lelaki', bilangan: 2),
      ],
      langkah: [
        'Isteri mendapat ¼ kerana tiada anak (RM100,000)',
        'Ibu mendapat ⅙ (RM66,667)',
        'Baki dibahagi kepada 2 saudara lelaki sebagai asabah',
        'Baki: RM400,000 - RM100,000 - RM66,667 = RM233,333',
        'Setiap saudara lelaki: RM116,667',
      ],
      pembahagian: [
        _Bahagian(waris: 'Isteri', pecahan: '¼', jumlah: 100000),
        _Bahagian(waris: 'Ibu', pecahan: '⅙', jumlah: 66667),
        _Bahagian(waris: 'Saudara Lelaki (2 orang)', pecahan: 'Asabah (baki)', jumlah: 233333),
      ],
    ),
    _KesData(
      id: '5',
      title: 'Kes 5: Kes Kompleks dengan Cucu',
      difficulty: 'Kompleks',
      harta: 800000,
      scenario:
          'Encik Hassan meninggal dunia dengan harta RM800,000. Anak lelaki telah meninggal lebih awal tetapi meninggalkan seorang cucu lelaki. Waris lain ialah isteri, seorang anak perempuan dan ibu.',
      waris: [
        _Waris(nama: 'Isteri', bilangan: 1),
        _Waris(nama: 'Anak Perempuan', bilangan: 1),
        _Waris(nama: 'Cucu Lelaki (dari anak lelaki)', bilangan: 1),
        _Waris(nama: 'Ibu', bilangan: 1),
      ],
      langkah: [
        'Isteri mendapat ⅛ kerana ada anak/cucu (RM100,000)',
        'Anak perempuan mendapat ½ (RM400,000)',
        'Ibu mendapat ⅙ (RM133,333)',
        'Cucu lelaki sebagai asabah mendapat baki (RM166,667)',
        'Cucu menggantikan kedudukan bapanya yang telah meninggal',
      ],
      pembahagian: [
        _Bahagian(waris: 'Isteri', pecahan: '⅛', jumlah: 100000),
        _Bahagian(waris: 'Anak Perempuan', pecahan: '½', jumlah: 400000),
        _Bahagian(waris: 'Ibu', pecahan: '⅙', jumlah: 133333),
        _Bahagian(waris: 'Cucu Lelaki', pecahan: 'Asabah (baki)', jumlah: 166667),
      ],
    ),
  ];

  int get _mudahCount =>
      kesList.where((k) => k.difficulty == 'Mudah').length;
  int get _sederhanaCount =>
      kesList.where((k) => k.difficulty == 'Sederhana').length;
  int get _kompleksCount =>
      kesList.where((k) => k.difficulty == 'Kompleks').length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Kes Faraid',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 36),
        children: [

          // ── Header ──
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0D1247), Color(0xFF2E3192)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -12,
                  bottom: -12,
                  child: Icon(Icons.folder_open_rounded,
                      size: 100, color: Colors.white.withOpacity(0.05)),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kes Faraid',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Pelajari contoh kes pembahagian harta pusaka secara praktikal.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ── Stats row ──
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  label: 'Mudah',
                  count: _mudahCount,
                  color: const Color(0xFF2E7D32),
                  lightColor: const Color(0xFFE8F5E9),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatCard(
                  label: 'Sederhana',
                  count: _sederhanaCount,
                  color: const Color(0xFFF59E0B),
                  lightColor: const Color(0xFFFFF8E1),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatCard(
                  label: 'Kompleks',
                  count: _kompleksCount,
                  color: const Color(0xFFBF360C),
                  lightColor: const Color(0xFFFBE9E7),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ── Kes cards ──
          ...kesList.map((kes) {
            final isExpanded = _expandedId == kes.id;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _KesCard(
                kes: kes,
                isExpanded: isExpanded,
                onToggle: () => setState(() {
                  _expandedId = isExpanded ? null : kes.id;
                }),
              ),
            );
          }),

          const SizedBox(height: 6),

          // ── Cara menggunakan ──
          _CaraMenggunakan(),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DATA MODELS
// ─────────────────────────────────────────────────────────────────────────────
class _Waris {
  final String nama;
  final int bilangan;
  const _Waris({required this.nama, required this.bilangan});
}

class _Bahagian {
  final String waris;
  final String pecahan;
  final double jumlah;
  const _Bahagian(
      {required this.waris, required this.pecahan, required this.jumlah});
}

class _KesData {
  final String id;
  final String title;
  final String difficulty;
  final double harta;
  final String scenario;
  final List<_Waris> waris;
  final List<String> langkah;
  final List<_Bahagian> pembahagian;

  const _KesData({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.harta,
    required this.scenario,
    required this.waris,
    required this.langkah,
    required this.pembahagian,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// STAT CARD
// ─────────────────────────────────────────────────────────────────────────────
class _StatCard extends StatelessWidget {
  final String label;
  final int count;
  final Color color;
  final Color lightColor;

  const _StatCard({
    required this.label,
    required this.count,
    required this.color,
    required this.lightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3))
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// KES CARD
// ─────────────────────────────────────────────────────────────────────────────
class _KesCard extends StatelessWidget {
  final _KesData kes;
  final bool isExpanded;
  final VoidCallback onToggle;

  const _KesCard({
    required this.kes,
    required this.isExpanded,
    required this.onToggle,
  });

  Color get _diffColor {
    switch (kes.difficulty) {
      case 'Mudah':
        return const Color(0xFF2E7D32);
      case 'Sederhana':
        return const Color(0xFFF59E0B);
      case 'Kompleks':
        return const Color(0xFFBF360C);
      default:
        return Colors.grey;
    }
  }

  Color get _diffLight {
    switch (kes.difficulty) {
      case 'Mudah':
        return const Color(0xFFE8F5E9);
      case 'Sederhana':
        return const Color(0xFFFFF8E1);
      case 'Kompleks':
        return const Color(0xFFFBE9E7);
      default:
        return Colors.grey.shade100;
    }
  }

  static String _fmt(double val) {
    final s = val.toStringAsFixed(0);
    final buffer = StringBuffer();
    int count = 0;
    for (int i = s.length - 1; i >= 0; i--) {
      if (count > 0 && count % 3 == 0) buffer.write(',');
      buffer.write(s[i]);
      count++;
    }
    return buffer.toString().split('').reversed.join();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.06),
      child: Column(
        children: [

          // ── Card header ──
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Title + difficulty badge
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        kes.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.5,
                          color: Color(0xFF1A1A1A),
                          height: 1.35,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: _diffLight,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: _diffColor.withOpacity(0.3)),
                      ),
                      child: Text(
                        kes.difficulty,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: _diffColor,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Harta + waris info pills
                Row(
                  children: [
                    _InfoPill(
                      icon: Icons.account_balance_wallet_rounded,
                      label: 'Harta',
                      value: 'RM ${_fmt(kes.harta)}',
                      color: const Color(0xFF2E7D32),
                      lightColor: const Color(0xFFE8F5E9),
                    ),
                    const SizedBox(width: 10),
                    _InfoPill(
                      icon: Icons.people_alt_rounded,
                      label: 'Waris',
                      value: '${kes.waris.length} kategori',
                      color: const Color(0xFF1565C0),
                      lightColor: const Color(0xFFE3F2FD),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Scenario
                Text(
                  kes.scenario,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                    height: 1.55,
                  ),
                ),

                const SizedBox(height: 14),

                // Toggle button
                GestureDetector(
                  onTap: onToggle,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    decoration: BoxDecoration(
                      color: isExpanded
                          ? const Color(0xFF2E3192)
                          : const Color(0xFF2E3192).withOpacity(0.07),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: isExpanded
                              ? Colors.white
                              : const Color(0xFF2E3192),
                          size: 20,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          isExpanded
                              ? 'Tutup Penyelesaian'
                              : 'Lihat Penyelesaian',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13.5,
                            color: isExpanded
                                ? Colors.white
                                : const Color(0xFF2E3192),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Expanded content ──
          if (isExpanded) _ExpandedContent(kes: kes, diffColor: _diffColor),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// INFO PILL
// ─────────────────────────────────────────────────────────────────────────────
class _InfoPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final Color lightColor;

  const _InfoPill({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.lightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 16),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: TextStyle(
                          fontSize: 10, color: color.withOpacity(0.8))),
                  Text(value,
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: color,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// EXPANDED CONTENT
// ─────────────────────────────────────────────────────────────────────────────
class _ExpandedContent extends StatelessWidget {
  final _KesData kes;
  final Color diffColor;

  const _ExpandedContent({required this.kes, required this.diffColor});

  static String _fmtRM(double val) {
    final parts = val.toStringAsFixed(2).split('.');
    final intPart = parts[0];
    final decPart = parts[1];
    final buffer = StringBuffer();
    int count = 0;
    for (int i = intPart.length - 1; i >= 0; i--) {
      if (count > 0 && count % 3 == 0) buffer.write(',');
      buffer.write(intPart[i]);
      count++;
    }
    return 'RM ${buffer.toString().split('').reversed.join()}.$decPart';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FC),
        borderRadius:
            const BorderRadius.vertical(bottom: Radius.circular(20)),
        border: Border(
            top: BorderSide(color: Colors.grey.shade100, width: 1)),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── Senarai Waris ──
          _SubSectionLabel(label: 'Senarai Waris', icon: Icons.people_alt_rounded),
          const SizedBox(height: 10),
          ...kes.waris.map((w) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: diffColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${w.nama} (${w.bilangan} orang)',
                      style: const TextStyle(
                          fontSize: 13, color: Color(0xFF444444)),
                    ),
                  ],
                ),
              )),

          const SizedBox(height: 18),

          // ── Langkah Pengiraan ──
          _SubSectionLabel(
              label: 'Langkah Pengiraan',
              icon: Icons.format_list_numbered_rounded),
          const SizedBox(height: 10),
          ...List.generate(kes.langkah.length, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: diffColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${i + 1}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      kes.langkah[i],
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 18),

          // ── Pembahagian Harta ──
          _SubSectionLabel(
              label: 'Pembahagian Harta',
              icon: Icons.account_balance_wallet_rounded),
          const SizedBox(height: 10),
          ...kes.pembahagian.map((p) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                      color: diffColor.withOpacity(0.2)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 6,
                        offset: const Offset(0, 2))
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            p.waris,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13.5,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(
                              color: diffColor.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              p.pecahan,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: diffColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      _fmtRM(p.jumlah),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: diffColor,
                      ),
                    ),
                  ],
                ),
              )),

          const SizedBox(height: 12),

          // ── Disclaimer ──
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8E1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: const Color(0xFFC9A84C).withOpacity(0.3)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.lightbulb_rounded,
                    color: Color(0xFFC9A84C), size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Kes ini adalah contoh umum. Untuk kes sebenar, sila rujuk pakar faraid atau peguam syarie untuk nasihat yang tepat.',
                    style: TextStyle(
                        fontSize: 11.5,
                        color: Colors.grey.shade700,
                        height: 1.5),
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
// SUB SECTION LABEL
// ─────────────────────────────────────────────────────────────────────────────
class _SubSectionLabel extends StatelessWidget {
  final String label;
  final IconData icon;
  const _SubSectionLabel({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15, color: const Color(0xFF2E3192)),
        const SizedBox(width: 7),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Color(0xFF2E3192),
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CARA MENGGUNAKAN STRIP
// ─────────────────────────────────────────────────────────────────────────────
class _CaraMenggunakan extends StatelessWidget {
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
              offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: gold.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.menu_book_rounded,
                    color: gold, size: 18),
              ),
              const SizedBox(width: 10),
              const Text(
                'Cara Menggunakan',
                style: TextStyle(
                  color: gold,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...[
            'Baca senario kes dengan teliti',
            'Cuba kira sendiri menggunakan Kalkulator Faraid',
            'Bandingkan dengan penyelesaian yang diberikan',
            'Fahami setiap langkah pengiraan',
          ].asMap().entries.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: gold.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${e.key + 1}',
                          style: const TextStyle(
                              color: gold,
                              fontSize: 10,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        e.value,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12.5,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}