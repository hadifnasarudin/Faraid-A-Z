import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Panggil dari ilmu_faraid_screen.dart:
//
//   case "Waris lelaki":
//     _openSheet(context, const WarisLelakiSheet());
//     break;
//   case "Waris perempuan":
//     _openSheet(context, const WarisPerempuanSheet());
//     break;
// ─────────────────────────────────────────────────────────────────────────────

// ═════════════════════════════════════════════════════════════════════════════
// WARIS LELAKI
// ═════════════════════════════════════════════════════════════════════════════
class WarisLelakiSheet extends StatelessWidget {
  const WarisLelakiSheet({super.key});

  static const List<_WarisData> warisList = [
    _WarisData(no: 1,  name: 'Anak Lelaki',                             arabic: 'الابن',              group: _Group.keturunan),
    _WarisData(no: 2,  name: 'Cucu (anak lelaki kpd anak lelaki)',      arabic: 'ابن الابن',           group: _Group.keturunan),
    _WarisData(no: 3,  name: 'Bapa',                                    arabic: 'الأب',               group: _Group.usul),
    _WarisData(no: 4,  name: 'Datuk (bapa kepada bapa)',                arabic: 'الجدّ',              group: _Group.usul),
    _WarisData(no: 5,  name: 'Saudara lelaki seibu sebapa',             arabic: 'الأخ الشقيق',        group: _Group.saudara),
    _WarisData(no: 6,  name: 'Saudara lelaki sebapa',                   arabic: 'الأخ لأب',           group: _Group.saudara),
    _WarisData(no: 7,  name: 'Saudara lelaki seibu',                    arabic: 'الأخ لأم',           group: _Group.saudara),
    _WarisData(no: 8,  name: 'Anak saudara lelaki seibu sebapa',        arabic: 'ابن الأخ الشقيق',    group: _Group.saudara),
    _WarisData(no: 9,  name: 'Bapa saudara seibu sebapa',               arabic: 'العمّ الشقيق',       group: _Group.bapaSaudara),
    _WarisData(no: 10, name: 'Bapa saudara sebapa',                     arabic: 'العمّ لأب',          group: _Group.bapaSaudara),
    _WarisData(no: 11, name: 'Sepupu drpd bapa saudara seibu sebapa',   arabic: 'ابن العمّ الشقيق',   group: _Group.bapaSaudara),
    _WarisData(no: 12, name: 'Sepupu drpd bapa saudara sebapa',         arabic: 'ابن العمّ لأب',      group: _Group.bapaSaudara),
    _WarisData(no: 13, name: 'Suami',                                   arabic: 'الزوج',              group: _Group.perkahwinan),
    _WarisData(no: 14, name: 'Tuan yang merdekakan hamba',              arabic: 'المعتِق',            group: _Group.wala),
  ];

  @override
  Widget build(BuildContext context) {
    return _WarisSheet(
      title: 'Waris Lelaki',
      arabic: 'الوارِثُوْن',
      subtitle: 'Senarai Waris Pusaka • Waris Lelaki',
      totalCount: warisList.length,
      warisList: warisList,
      themeColor: const Color(0xFF1565C0),
      gradientColors: const [Color(0xFF0D1247), Color(0xFF1565C0)],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// WARIS PEREMPUAN
// ═════════════════════════════════════════════════════════════════════════════
class WarisPerempuanSheet extends StatelessWidget {
  const WarisPerempuanSheet({super.key});

  static const List<_WarisData> warisList = [
    _WarisData(no: 1,  name: 'Anak Perempuan',                          arabic: 'البنت',              group: _Group.keturunan),
    _WarisData(no: 2,  name: 'Cucu (anak perempuan kpd anak lelaki)',   arabic: 'بنت الابن',          group: _Group.keturunan),
    _WarisData(no: 3,  name: 'Ibu',                                     arabic: 'الأمّ',              group: _Group.usul),
    _WarisData(no: 4,  name: 'Nenek sebelah ibu',                       arabic: 'الجدّة من الأمّ',    group: _Group.usul),
    _WarisData(no: 5,  name: 'Nenek sebelah bapa',                      arabic: 'الجدّة من الأب',     group: _Group.usul),
    _WarisData(no: 6,  name: 'Saudara perempuan seibu sebapa',          arabic: 'الأخت الشقيقة',      group: _Group.saudara),
    _WarisData(no: 7,  name: 'Saudara perempuan seibu',                 arabic: 'الأخت لأمّ',         group: _Group.saudara),
    _WarisData(no: 8,  name: 'Saudara perempuan sebapa',                arabic: 'الأخت لأب',          group: _Group.saudara),
    _WarisData(no: 9,  name: 'Isteri',                                  arabic: 'الزوجة',             group: _Group.perkahwinan),
    _WarisData(no: 10, name: 'Perempuan yang merdekakan hamba',         arabic: 'المعتِقة',           group: _Group.wala),
  ];

  @override
  Widget build(BuildContext context) {
    return _WarisSheet(
      title: 'Waris Perempuan',
      arabic: 'الوارِثَات',
      subtitle: 'Senarai Waris Pusaka • Waris Perempuan',
      totalCount: warisList.length,
      warisList: warisList,
      themeColor: const Color(0xFF880E4F),
      gradientColors: const [Color(0xFF4A0030), Color(0xFF880E4F)],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// SHARED SHEET WIDGET
// ═════════════════════════════════════════════════════════════════════════════
enum _Group { keturunan, usul, saudara, bapaSaudara, perkahwinan, wala }

class _WarisData {
  final int no;
  final String name;
  final String arabic;
  final _Group group;
  const _WarisData({
    required this.no,
    required this.name,
    required this.arabic,
    required this.group,
  });
}

class _WarisSheet extends StatefulWidget {
  final String title;
  final String arabic;
  final String subtitle;
  final int totalCount;
  final List<_WarisData> warisList;
  final Color themeColor;
  final List<Color> gradientColors;

  const _WarisSheet({
    required this.title,
    required this.arabic,
    required this.subtitle,
    required this.totalCount,
    required this.warisList,
    required this.themeColor,
    required this.gradientColors,
  });

  @override
  State<_WarisSheet> createState() => _WarisSheetState();
}

class _WarisSheetState extends State<_WarisSheet> {
  String _query = '';
  _Group? _selectedGroup;

  static const Map<_Group, String> _groupLabels = {
    _Group.keturunan:    'Keturunan',
    _Group.usul:         'Usul (Ibu Bapa)',
    _Group.saudara:      'Saudara',
    _Group.bapaSaudara:  'Bapa Saudara',
    _Group.perkahwinan:  'Perkahwinan',
    _Group.wala:         'Wala\'',
  };

  static const Map<_Group, IconData> _groupIcons = {
    _Group.keturunan:    Icons.child_care_rounded,
    _Group.usul:         Icons.elderly_rounded,
    _Group.saudara:      Icons.people_rounded,
    _Group.bapaSaudara:  Icons.person_rounded,
    _Group.perkahwinan:  Icons.favorite_rounded,
    _Group.wala:         Icons.shield_rounded,
  };

  List<_WarisData> get _filtered {
    return widget.warisList.where((w) {
      final matchQuery = _query.isEmpty ||
          w.name.toLowerCase().contains(_query.toLowerCase());
      final matchGroup = _selectedGroup == null || w.group == _selectedGroup;
      return matchQuery && matchGroup;
    }).toList();
  }

  // Get groups that exist in this waris list
  List<_Group> get _availableGroups {
    return _groupLabels.keys
        .where((g) => widget.warisList.any((w) => w.group == g))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final filtered = _filtered;

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

          // ── Hero header (fixed, not scrollable) ──
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: _buildHero(),
          ),
          const SizedBox(height: 12),

          // ── Search bar (fixed) ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildSearchBar(),
          ),
          const SizedBox(height: 10),

          // ── Group filter chips (fixed) ──
          SizedBox(
            height: 36,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _FilterChip(
                  label: 'Semua',
                  selected: _selectedGroup == null,
                  color: widget.themeColor,
                  onTap: () => setState(() => _selectedGroup = null),
                ),
                const SizedBox(width: 8),
                ..._availableGroups.map((g) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _FilterChip(
                        label: _groupLabels[g]!,
                        selected: _selectedGroup == g,
                        color: widget.themeColor,
                        onTap: () => setState(() => _selectedGroup =
                            _selectedGroup == g ? null : g),
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // ── Count indicator ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  '${filtered.length} waris',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (_query.isNotEmpty || _selectedGroup != null) ...[
                  const Spacer(),
                  GestureDetector(
                    onTap: () => setState(() {
                      _query = '';
                      _selectedGroup = null;
                    }),
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 12,
                        color: widget.themeColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 8),

          // ── Scrollable list ──
          Expanded(
            child: filtered.isEmpty
                ? _buildEmpty()
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (_, i) => _WarisItem(
                      data: filtered[i],
                      themeColor: widget.themeColor,
                      groupLabel: _groupLabels[filtered[i].group]!,
                      groupIcon: _groupIcons[filtered[i].group]!,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: widget.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: widget.themeColor.withOpacity(0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(Icons.people_alt_rounded,
                color: Colors.white, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  widget.subtitle,
                  style: const TextStyle(
                      color: Colors.white54, fontSize: 11),
                ),
              ],
            ),
          ),
          // Count badge
          Column(
            children: [
              Text(
                '${widget.totalCount}',
                style: const TextStyle(
                  color: Color(0xFFEDD98A),
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                'Waris',
                style: TextStyle(color: Colors.white54, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

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
          hintText: 'Cari nama waris...',
          hintStyle:
              TextStyle(color: Colors.grey.shade400, fontSize: 13.5),
          prefixIcon:
              Icon(Icons.search_rounded, color: Colors.grey.shade400, size: 20),
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
            'Tiada waris dijumpai',
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
}

// ─────────────────────────────────────────────────────────────────────────────
// FILTER CHIP
// ─────────────────────────────────────────────────────────────────────────────
class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? color : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? color : Colors.grey.shade300,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.28),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  )
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// WARIS ITEM ROW
// ─────────────────────────────────────────────────────────────────────────────
class _WarisItem extends StatelessWidget {
  final _WarisData data;
  final Color themeColor;
  final String groupLabel;
  final IconData groupIcon;

  const _WarisItem({
    required this.data,
    required this.themeColor,
    required this.groupLabel,
    required this.groupIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Number circle
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: themeColor.withOpacity(0.10),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${data.no}',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                  color: themeColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Name + group
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5,
                    color: Color(0xFF222222),
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Icon(groupIcon, size: 11, color: Colors.grey.shade400),
                    const SizedBox(width: 4),
                    Text(
                      groupLabel,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Arabic text
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: themeColor.withOpacity(0.07),
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: themeColor.withOpacity(0.15)),
            ),
            child: Text(
              data.arabic,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: themeColor,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}