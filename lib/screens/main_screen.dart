import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';

import 'ilmu_faraid_screen.dart';
import 'soalan_glosari.dart';
import 'kes_faraid.dart';
import 'kalkulator_faraid.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  String gregorianDate = '';
  String gregorianTime = '';
  String hijriDate = '';
  late Timer _timer;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnim;

  // ── Colour palette ─────────────────────────────────────────────────────────
  static const Color navy = Color(0xFF0D1247);
  static const Color royalBlue = Color(0xFF2E3192);
  static const Color gold = Color(0xFFC9A84C);
  static const Color goldLight = Color(0xFFEDD98A);
  static const Color surface = Color(0xFFF7F8FC);
  static const Color cardBg = Colors.white;

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateDateTime());

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _pulseAnim = Tween<double>(begin: 0.97, end: 1.03).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  void _updateDateTime() {
    final now = DateTime.now();
    final hijri = HijriCalendar.fromDate(now);
    setState(() {
      gregorianDate = DateFormat('EEEE, dd MMMM yyyy').format(now);
      gregorianTime = DateFormat('HH:mm:ss').format(now);
      hijriDate = '${hijri.hDay} ${hijri.longMonthName} ${hijri.hYear} H';
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  void _navigate(BuildContext context, String title) {
    Widget? page;
    switch (title) {
      case 'Ilmu Faraid':
        page = const IlmuFaraidScreen();
        break;
      case 'Soalan Lazim':
        page = const SoalanGlosariMenu();
        break;
      case 'Kes Faraid':
        page = const KesFaraidListPage();
        break;

      case 'Kalkulator Faraid':
        page = const KalkulatorFaraidScreen();
        break;
    }
    if (page != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => page!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface,
      body: CustomScrollView(
        slivers: [
          // ── Collapsible App Bar ──────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 260,
            floating: false,
            pinned: true,
            backgroundColor: navy,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Faraid A-Z',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
                letterSpacing: 1.2,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: _HeaderBanner(
                hijriDate: hijriDate,
                gregorianDate: gregorianDate,
                gregorianTime: gregorianTime,
                pulseAnim: _pulseAnim,
              ),
            ),
          ),

          // ── Welcome greeting ────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Assalamualaikum',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: navy,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Apa yang ingin anda pelajari hari ini?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Feature Cards ────────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate([
                _FeatureCard(
                  title: 'Ilmu Faraid',
                  subtitle: 'Pelajari ilmu pembahagian harta',
                  icon: Icons.menu_book_rounded,
                  gradient: const [Color(0xFF2E3192), Color(0xFF1565C0)],
                  accentColor: const Color(0xFF82B1FF),
                  onTap: () => _navigate(context, 'Ilmu Faraid'),
                ),
                _FeatureCard(
                  title: 'Kalkulator',
                  subtitle: 'Kira bahagian waris',
                  icon: Icons.calculate_rounded,
                  gradient: const [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                  accentColor: const Color(0xFFA5D6A7),
                  onTap: () => _navigate(context, 'Kalkulator Faraid'),
                ),
                _FeatureCard(
                  title: 'Soalan Lazim',
                  subtitle: 'Soal jawab & glosari',
                  icon: Icons.help_outline_rounded,
                  gradient: const [Color(0xFF6A1B9A), Color(0xFF7B1FA2)],
                  accentColor: const Color(0xFFCE93D8),
                  onTap: () => _navigate(context, 'Soalan Lazim'),
                ),
                _FeatureCard(
                  title: 'Kes Faraid',
                  subtitle: 'Contoh kes & rujukan',
                  icon: Icons.folder_open_rounded,
                  gradient: const [Color(0xFF7B2D00), Color(0xFFBF360C)],
                  accentColor: const Color(0xFFFFAB91),
                  onTap: () => _navigate(context, 'Kes Faraid'),
                ),
              ]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.88,
              ),
            ),
          ),

          // ── Quick info strip ─────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: _QuickInfoStrip(),
            ),
          ),
        ],
      ),

      // ── Bottom Nav ────────────────────────────────────────────────────────
      bottomNavigationBar: _BottomNav(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// HEADER BANNER  (SliverAppBar background)
// ─────────────────────────────────────────────────────────────────────────────
class _HeaderBanner extends StatelessWidget {
  final String hijriDate;
  final String gregorianDate;
  final String gregorianTime;
  final Animation<double> pulseAnim;

  const _HeaderBanner({
    required this.hijriDate,
    required this.gregorianDate,
    required this.gregorianTime,
    required this.pulseAnim,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0D1247), Color(0xFF2E3192)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          // Decorative geometric circles
          Positioned(
            top: -40,
            right: -40,
            child: _GeoCircle(size: 180, opacity: 0.07),
          ),
          Positioned(
            bottom: 10,
            left: -30,
            child: _GeoCircle(size: 120, opacity: 0.05),
          ),
          Positioned(
            top: 40,
            right: 60,
            child: _GeoCircle(size: 60, opacity: 0.08),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 52, 24, 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Gold divider line
                  Container(
                    width: 48,
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFC9A84C), Color(0xFFEDD98A)],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Hijri date — big & gold
                  ScaleTransition(
                    scale: pulseAnim,
                    child: Text(
                      hijriDate,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFEDD98A),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Gregorian date
                  Text(
                    gregorianDate,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Live clock pill
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.15),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                            color: Color(0xFF69F0AE),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          gregorianTime,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            fontFeatures: [FontFeature.tabularFigures()],
                          ),
                        ),
                      ],
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

// Decorative circle
class _GeoCircle extends StatelessWidget {
  final double size;
  final double opacity;
  const _GeoCircle({required this.size, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(opacity),
          width: 1.5,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// FEATURE CARD
// ─────────────────────────────────────────────────────────────────────────────
class _FeatureCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradient;
  final Color accentColor;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    required this.accentColor,
    required this.onTap,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 120));
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.95).animate(
        CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _ctrl.forward(),
      onTapUp: (_) {
        _ctrl.reverse();
        widget.onTap();
      },
      onTapCancel: () => _ctrl.reverse(),
      child: ScaleTransition(
        scale: _scaleAnim,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: widget.gradient.first.withOpacity(0.40),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Big ghost icon (background)
              Positioned(
                right: -12,
                bottom: -12,
                child: Icon(
                  widget.icon,
                  size: 90,
                  color: Colors.white.withOpacity(0.08),
                ),
              ),
              // Small decorative circle
              Positioned(
                top: -18,
                left: -18,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.06),
                  ),
                ),
              ),
              // Main content
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon bubble
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(widget.icon,
                          color: Colors.white, size: 26),
                    ),
                    const Spacer(),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.72),
                        fontSize: 11.5,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Arrow chip
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Buka',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward_rounded,
                              color: Colors.white, size: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// QUICK INFO STRIP — small ayat / reminder card
// ─────────────────────────────────────────────────────────────────────────────
class _QuickInfoStrip extends StatelessWidget {
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
            color: navy.withOpacity(0.25),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: gold.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.format_quote_rounded,
                color: gold, size: 22),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '"Pelajarilah ilmu faraid dan ajarkanlah ia kepada manusia."',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.5,
                    height: 1.5,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '— Hadis Riwayat Ibn Majah',
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

// ─────────────────────────────────────────────────────────────────────────────
// BOTTOM NAVIGATION BAR
// ─────────────────────────────────────────────────────────────────────────────
class _BottomNav extends StatefulWidget {
  @override
  State<_BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<_BottomNav> {
  int _current = 0;
  static const Color navy = Color(0xFF0D1247);
  static const Color gold = Color(0xFFC9A84C);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: Icons.home_rounded,
                label: 'Utama',
                selected: _current == 0,
                onTap: () => setState(() => _current = 0),
              ),
              _NavItem(
                icon: Icons.bookmarks_rounded,
                label: 'Simpanan',
                selected: _current == 1,
                onTap: () => setState(() => _current = 1),
              ),
              _NavItem(
                icon: Icons.person_rounded,
                label: 'Profil',
                selected: _current == 2,
                onTap: () => setState(() => _current = 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  static const Color navy = Color(0xFF0D1247);
  static const Color gold = Color(0xFFC9A84C);

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: selected ? 16 : 10,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: selected ? navy : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: selected ? gold : Colors.grey.shade400,
            ),
            if (selected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}