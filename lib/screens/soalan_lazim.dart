import 'package:flutter/material.dart';

class SoalanLazimPage extends StatefulWidget {
  const SoalanLazimPage({super.key});

  @override
  State<SoalanLazimPage> createState() => _SoalanLazimPageState();
}

class _SoalanLazimPageState extends State<SoalanLazimPage> {
  String _query = '';

  static const Color navy = Color(0xFF0D1247);
  static const Color royalBlue = Color(0xFF2E3192);
  static const Color gold = Color(0xFFC9A84C);

  static const List<_FaqData> faqList = [
    _FaqData(
      no: 1,
      category: 'Harta Pusaka',
      categoryIcon: Icons.account_balance_wallet_rounded,
      categoryColor: Color(0xFF1565C0),
      question: 'Harta apa yang boleh difaraidkan?',
      answer:
          'Semua harta milik si mati yang sah seperti rumah, tanah, wang tunai, saham dan kenderaan. Syaratnya harta tersebut adalah milik penuh si mati semasa hayatnya dan berkekalan sehingga dia meninggal dunia.',
    ),
    _FaqData(
      no: 2,
      category: 'Permohonan',
      categoryIcon: Icons.description_rounded,
      categoryColor: Color(0xFF2E7D32),
      question:
          'Selepas saya meninggal dunia, siapa yang boleh memohon Perintah Faraid ke atas harta pusaka saya?',
      answer:
          'Waris sah seperti anak, isteri, ibu bapa atau sesiapa yang berkepentingan dalam harta pusaka boleh membuat permohonan. Permohonan boleh dikemukakan di Mahkamah Syariah negeri masing-masing.',
    ),
    _FaqData(
      no: 3,
      category: 'Waris',
      categoryIcon: Icons.people_alt_rounded,
      categoryColor: Color(0xFF6A1B9A),
      question: 'Siapakah yang layak untuk menerima harta pusaka saya?',
      answer:
          'Waris yang sah mengikut hukum faraid seperti anak lelaki, anak perempuan, isteri, ibu dan bapa. Syarat utama: waris mestilah beragama Islam, masih hidup ketika pewaris meninggal, dan tiada halangan pewarisan.',
    ),
    _FaqData(
      no: 4,
      category: 'Halangan Waris',
      categoryIcon: Icons.block_rounded,
      categoryColor: Color(0xFFBF360C),
      question:
          'Saya telah menganut agama Islam dan ibu bapa saya masih belum memeluk Islam. Adakah mereka akan mewarisi harta pusaka saya?',
      answer:
          'Tidak. Perbezaan agama menjadi halangan dalam hukum faraid — Muslim tidak mewarisi bukan Muslim, dan bukan Muslim tidak mewarisi Muslim. Walau bagaimanapun, anda boleh memberikan wasiat kepada mereka tidak melebihi 1/3 daripada harta.',
    ),
    _FaqData(
      no: 5,
      category: 'Perkahwinan',
      categoryIcon: Icons.favorite_rounded,
      categoryColor: Color(0xFF880E4F),
      question:
          'Saya telah bercerai dengan isteri saya, adakah bekas isteri saya masih boleh menuntut hak ke atas harta pusaka saya selepas kematian saya?',
      answer:
          'Tidak, bekas isteri yang telah diceraikan talak bain tidak berhak mewarisi. Pengecualian: jika masih dalam tempoh iddah talak raj\'i dan tiada halangan lain, hak waris masih kekal sehingga tamat iddah.',
    ),
  ];

  List<_FaqData> get _filtered {
    if (_query.isEmpty) return faqList;
    return faqList
        .where((f) =>
            f.question.toLowerCase().contains(_query.toLowerCase()) ||
            f.answer.toLowerCase().contains(_query.toLowerCase()) ||
            f.category.toLowerCase().contains(_query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Soalan Lazim',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [

          // ── Hero header ──
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: _buildHero(),
          ),
          const SizedBox(height: 14),

          // ── Search bar ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildSearchBar(),
          ),
          const SizedBox(height: 10),

          // ── Count row ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  '${filtered.length} soalan',
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
                        color: royalBlue,
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
                ? _buildEmpty()
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) => _FaqCard(
                      data: filtered[i],
                      onTap: () => _openDetail(context, filtered[i]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  // ── Hero ────────────────────────────────────────────────────────────────────
  Widget _buildHero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [navy, royalBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: royalBlue.withOpacity(0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -12,
            bottom: -12,
            child: Icon(Icons.help_outline_rounded,
                size: 100, color: Colors.white.withOpacity(0.05)),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(Icons.quiz_rounded,
                    color: Colors.white, size: 24),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Soalan Lazim',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Soalan-soalan lazim berkaitan faraid',
                      style:
                          TextStyle(color: Colors.white54, fontSize: 11.5),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Text(
                    '5',
                    style: TextStyle(
                      color: gold,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'Soalan',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5), fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Search bar ──────────────────────────────────────────────────────────────
  Widget _buildSearchBar() {
    return Container(
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
          hintText: 'Cari soalan...',
          hintStyle:
              TextStyle(color: Colors.grey.shade400, fontSize: 13.5),
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded,
              size: 48, color: Colors.grey.shade300),
          const SizedBox(height: 12),
          Text(
            'Tiada soalan dijumpai',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ── Detail bottom sheet ─────────────────────────────────────────────────────
  void _openDetail(BuildContext context, _FaqData data) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _FaqDetailSheet(data: data),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// FAQ DATA MODEL
// ─────────────────────────────────────────────────────────────────────────────
class _FaqData {
  final int no;
  final String category;
  final IconData categoryIcon;
  final Color categoryColor;
  final String question;
  final String answer;

  const _FaqData({
    required this.no,
    required this.category,
    required this.categoryIcon,
    required this.categoryColor,
    required this.question,
    required this.answer,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// FAQ CARD
// ─────────────────────────────────────────────────────────────────────────────
class _FaqCard extends StatelessWidget {
  final _FaqData data;
  final VoidCallback onTap;

  const _FaqCard({required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Number + icon column
            Column(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: data.categoryColor.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(data.categoryIcon,
                      color: data.categoryColor, size: 19),
                ),
              ],
            ),
            const SizedBox(width: 12),

            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: data.categoryColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      data.category,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: data.categoryColor,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    data.question,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                      color: Color(0xFF1A1A1A),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Preview of answer
                  Text(
                    data.answer,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            // Arrow
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: data.categoryColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.arrow_forward_ios_rounded,
                  size: 12, color: data.categoryColor),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// FAQ DETAIL BOTTOM SHEET
// ─────────────────────────────────────────────────────────────────────────────
class _FaqDetailSheet extends StatelessWidget {
  final _FaqData data;
  const _FaqDetailSheet({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 36),
      decoration: const BoxDecoration(
        color: Color(0xFFF7F8FC),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 20),

          // Category chip
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: data.categoryColor.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(data.categoryIcon,
                        size: 13, color: data.categoryColor),
                    const SizedBox(width: 5),
                    Text(
                      data.category,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: data.categoryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Question card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  data.categoryColor,
                  data.categoryColor.withOpacity(0.75),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: data.categoryColor.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.help_outline_rounded,
                    color: Colors.white70, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    data.question,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Answer card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 4,
                  height: 80,
                  decoration: BoxDecoration(
                    color: data.categoryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    data.answer,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.7,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Close button
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: data.categoryColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text(
                'Tutup',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}