import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// ✅ FIX 1: relative path, buang leading slash
import '/screens/main_screen.dart';
import '/screens/saved_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;
  static const Color _navy = Color(0xFF0D1247);

  // ✅ FIX 2: tambah GlobalKey untuk CurvedNavigationBar
  // Ini yang fix animation — boleh set index programmatically tanpa trigger animation pelik
  final _navBarKey = GlobalKey<CurvedNavigationBarState>();

  final List<GlobalKey<NavigatorState>> _navKeys = [
    GlobalKey<NavigatorState>(), // Home
    GlobalKey<NavigatorState>(), // Saved
    GlobalKey<NavigatorState>(), // Settings
  ];

  int _keyIndex(int tab) {
    if (tab == 0) return 0;
    if (tab == 2) return 1;
    return 2;
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex == 1) {
      // Tab modal — balik ke home tanpa trigger navbar animation
      setState(() => _selectedIndex = 0);
      _navBarKey.currentState?.setPage(0);
      return false;
    }
    final nav = _navKeys[_keyIndex(_selectedIndex)].currentState;
    if (nav != null && nav.canPop()) {
      nav.pop();
      return false;
    }
    if (_selectedIndex != 0) {
      setState(() => _selectedIndex = 0);
      _navBarKey.currentState?.setPage(0);
      return false;
    }
    return true;
  }

  void _onTap(int index) {
    // ✅ FIX 3: Tab modal (index 1) — buka dialog dan RESET navbar balik ke tab sebelumnya
    // Ini fix animation kerana navbar tak akan "stuck" di index 1
    if (index == 1) {
      // Reset navbar visual balik ke tab yang aktif sebelum modal dibuka
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _navBarKey.currentState?.setPage(_selectedIndex);
      });
      _showAbout();
      return;
    }

    if (_selectedIndex == index) {
      // Double tap — pop ke root
      _navKeys[_keyIndex(index)].currentState?.popUntil((r) => r.isFirst);
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  void _showAbout() {
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (_) => const _AboutModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: Navigator(
              key: _navKeys[0],
              onGenerateRoute: (_) =>
                  MaterialPageRoute(builder: (_) => const MainScreen()),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: Navigator(
              key: _navKeys[1],
              onGenerateRoute: (_) =>
                  MaterialPageRoute(builder: (_) => const SavedScreen()),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Navigator(
              key: _navKeys[2],
              onGenerateRoute: (_) =>
                  MaterialPageRoute(builder: (_) => const _SettingsScreen()),
            ),
          ),
        ]),
        bottomNavigationBar: CurvedNavigationBar(
          key: _navBarKey, // ✅ GlobalKey disambung
          index: _selectedIndex,
          height: 60,
          backgroundColor: Colors.transparent,
          color: _navy,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          items: const [
            Icon(Icons.home_rounded,           color: Colors.white, size: 26),
            Icon(Icons.info_outline_rounded,   color: Colors.white, size: 26),
            Icon(Icons.bookmark_rounded,       color: Colors.white, size: 26),
            Icon(Icons.settings_rounded,       color: Colors.white, size: 26),
          ],
          onTap: _onTap,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ABOUT MODAL
// ─────────────────────────────────────────────────────────────────────────────
class _AboutModal extends StatelessWidget {
  const _AboutModal();

  static const Color navy = Color(0xFF0D1247);
  static const Color royalBlue = Color(0xFF2E3192);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8FC),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [

          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [navy, royalBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Row(children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: const Icon(Icons.info_outline_rounded,
                    color: Colors.white, size: 20),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text('Tentang Faraid A-Z',
                    style: TextStyle(color: Colors.white, fontSize: 16,
                        fontWeight: FontWeight.w800)),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.close_rounded,
                      color: Colors.white, size: 16),
                ),
              ),
            ]),
          ),

          // Scrollable content
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(children: [

                // Rujukan kami
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8, offset: const Offset(0, 3))],
                  ),
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: const BoxDecoration(
                        color: royalBlue,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(18)),
                      ),
                      child: const Row(children: [
                        Icon(Icons.auto_stories_rounded,
                            color: Colors.white, size: 16),
                        SizedBox(width: 8),
                        Text('Rujukan Kami',
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'lib/assets/images/buku_madad.jpeg',
                              width: 75, height: 100, fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                width: 75, height: 100,
                                decoration: BoxDecoration(
                                  color: royalBlue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: royalBlue.withOpacity(0.2)),
                                ),
                                child: const Icon(Icons.menu_book_rounded,
                                    color: royalBlue, size: 32),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('E-Book Harta Pusaka Edisi Faraid',
                                    style: TextStyle(fontWeight: FontWeight.w700,
                                        fontSize: 13, color: Color(0xFF1A1A1A))),
                                const SizedBox(height: 5),
                                Text(
                                  'Kandungan aplikasi ini diadaptasi daripada e-book ini oleh Pusat Dakwah Murtadha (MADAD).',
                                  style: TextStyle(fontSize: 12, height: 1.5,
                                      color: Colors.grey.shade600)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),

                const SizedBox(height: 12),

                // 4 mission cards
                ...[
                  _MissionCard(
                    icon: Icons.lightbulb_rounded,
                    color: const Color(0xFF1565C0),
                    lightColor: const Color(0xFFE3F2FD),
                    label: 'Tujuan Kami',
                    content: 'Membantu masyarakat lebih memahami dan mengenali konsep faraid dengan cara yang mudah dan jelas.',
                  ),
                  _MissionCard(
                    icon: Icons.flag_rounded,
                    color: const Color(0xFF2E7D32),
                    lightColor: const Color(0xFFE8F5E9),
                    label: 'Misi Kami',
                    content: 'Menyampaikan ilmu faraid dengan lebih mudah dan dekat dengan masyarakat agar lebih ramai yang memahaminya.',
                  ),
                  _MissionCard(
                    icon: Icons.favorite_rounded,
                    color: const Color(0xFF880E4F),
                    lightColor: const Color(0xFFFCE4EC),
                    label: 'Harapan Kami',
                    content: 'Membantu masyarakat memahami konsep faraid dan lebih tergalak untuk menyelesaikan urusan faraid yang seringkali tertangguh.',
                  ),
                  _MissionCard(
                    icon: Icons.gps_fixed_rounded,
                    color: const Color(0xFF6A1B9A),
                    lightColor: const Color(0xFFF3E5F5),
                    label: 'Matlamat Kami',
                    content: 'Memberi panduan berdasarkan sumber yang boleh dipercayai demi memastikan kebenaran ilmu yang disampaikan.',
                  ),
                ].map((card) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: card,
                )),

                const SizedBox(height: 4),

                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      backgroundColor: navy,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text('Tutup', style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700,
                        fontSize: 14)),
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// MISSION CARD — extracted widget (buang int.parse hack)
// ─────────────────────────────────────────────────────────────────────────────
class _MissionCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color lightColor;
  final String label;
  final String content;

  const _MissionCard({
    required this.icon,
    required this.color,
    required this.lightColor,
    required this.label,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: lightColor,
            borderRadius: BorderRadius.circular(11),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 13, color: color)),
            const SizedBox(height: 4),
            Text(content, style: TextStyle(
                fontSize: 12.5, height: 1.5, color: Colors.grey.shade600)),
          ],
        )),
      ]),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SETTINGS PLACEHOLDER
// ─────────────────────────────────────────────────────────────────────────────
class _SettingsScreen extends StatelessWidget {
  const _SettingsScreen();

  static const Color navy = Color(0xFF0D1247);
  static const Color royalBlue = Color(0xFF2E3192);
  static const Color gold = Color(0xFFC9A84C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Tetapan',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
        children: [
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tetapan', style: TextStyle(color: Colors.white,
                    fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Urus tetapan aplikasi Faraid A-Z.',
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: navy,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                  color: navy.withOpacity(0.25),
                  blurRadius: 14, offset: const Offset(0, 5))],
            ),
            child: Row(children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: gold.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(Icons.info_outline_rounded,
                    color: gold, size: 24),
              ),
              const SizedBox(width: 14),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Faraid A-Z', style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w800, fontSize: 15)),
                  SizedBox(height: 3),
                  Text('Versi 1.0.0',
                      style: TextStyle(color: Colors.white54, fontSize: 12)),
                ],
              ),
            ]),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8, offset: const Offset(0, 3))],
            ),
            child: Row(children: [
              Icon(Icons.construction_rounded, color: royalBlue, size: 24),
              const SizedBox(width: 14),
              const Expanded(
                child: Text('Tetapan lanjutan akan ditambah tidak lama lagi.',
                    style: TextStyle(fontSize: 13.5, color: Color(0xFF444444))),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}