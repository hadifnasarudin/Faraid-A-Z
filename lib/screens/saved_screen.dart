import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/subtopics_screen/rukun_faraid.dart';
import '../screens/subtopics_screen/definisi_harta_pusaka.dart';
import '../screens/subtopics_screen/cara_pengagihan_harta.dart';
import '../screens/subtopics_screen/definisi_faraid.dart';
import '../screens/subtopics_screen/kepentingan_faraid.dart';
import '../screens/subtopics_screen/syarat_faraid.dart';
import '../screens/subtopics_screen/sebab_berlaku_faraid.dart';
import '../screens/subtopics_screen/halangan_pembahagian_faraid.dart';
import '../screens/subtopics_screen/senarai_waris.dart';

// ══════════════════════════════════════════════════════════════════════════
// SAVED NOTIFIER
// ══════════════════════════════════════════════════════════════════════════
class SavedNotifier extends ValueNotifier<Set<String>> {
  static final SavedNotifier instance = SavedNotifier._();
  SavedNotifier._() : super({}) {
    _init();
  }

  static const String _key = 'saved_topics';

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    value = Set.from(list);
  }

  Future<void> toggle(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final newSet = Set<String>.from(value);
    if (newSet.contains(title)) {
      newSet.remove(title);
    } else {
      newSet.add(title);
    }
    await prefs.setStringList(_key, newSet.toList());
    value = newSet;
  }

  bool isSaved(String title) => value.contains(title);
  List<String> get savedList => value.toList();
}

// ══════════════════════════════════════════════════════════════════════════
// SAVED MANAGER — backward compat
// ══════════════════════════════════════════════════════════════════════════
class SavedManager {
  static Future<List<String>> getSaved() async =>
      SavedNotifier.instance.savedList;
  static Future<void> toggle(String title) async =>
      SavedNotifier.instance.toggle(title);
  static Future<bool> isSaved(String title) async =>
      SavedNotifier.instance.isSaved(title);
}

// ══════════════════════════════════════════════════════════════════════════
// TOPIC ROUTER — open modal dari mana-mana screen
// Function ini sama dengan openPage dalam IlmuFaraidScreen
// Extract ke sini supaya boleh dipakai oleh SavedScreen juga
// ══════════════════════════════════════════════════════════════════════════
void openTopicSheet(BuildContext context, String title) {
  Widget? sheet;

  switch (title) {
    case "Definisi Harta Pusaka":
      sheet = const DefinisiHartaPusakaSheet();
      break;
    case "Cara Pengagihan Harta Si Mati":
      sheet = const CaraPengagihanHartaSheet();
      break;
    case "Definisi Faraid":
      sheet = const DefinisiFaraidSheet();
      break;
    case "Kepentingan Faraid":
      sheet = const KepentinganFaraidSheet();
      break;
    case "Syarat-syarat Faraid":
      sheet = const SyaratFaraidSheet();
      break;
    case "Al-Muwarrith":
      sheet = const AlMuwarrithSheet();
      break;
    case "Al-Warith":
      sheet = const AlWarithSheet();
      break;
    case "Al-Mawruth":
      sheet = const AlMawruthSheet();
      break;
    case "Sebab berlaku faraid":
      sheet = const SebabBerlakuFaraidSheet();
      break;
    case "Halangan pembahagian faraid":
      sheet = const HalanganFaraidSheet();
      break;
    case "Waris lelaki":
      sheet = const WarisLelakiSheet();
      break;
    case "Waris perempuan":
      sheet = const WarisPerempuanSheet();
      break;
    default:
      // Topic tanpa subtopic (e.g. Definisi Faraid, Kepentingan Faraid)
      // Dah handle di atas — kalau sampai sini bermakna ada typo
      sheet = null;
  }

  if (sheet == null) return;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => sheet!,
  );
}

// ══════════════════════════════════════════════════════════════════════════
// SAVED SCREEN
// ══════════════════════════════════════════════════════════════════════════
class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  static const Color primaryColor = Color(0xFF2E3192);
  static const Color navy = Color(0xFF0D1247);
  static const Color gold = Color(0xFFC9A84C);

  static const Map<String, IconData> _iconMap = {
    'Definisi Harta Pusaka':         Icons.account_balance_wallet_rounded,
    'Cara Pengagihan Harta Si Mati': Icons.account_tree_rounded,
    'Definisi Faraid':               Icons.menu_book_rounded,
    'Kepentingan Faraid':            Icons.star_rounded,
    'Al-Muwarrith':                  Icons.person_off_rounded,
    'Al-Warith':                     Icons.people_alt_rounded,
    'Al-Mawruth':                    Icons.account_balance_wallet_rounded,
    'Syarat-syarat Faraid':          Icons.check_circle_outline_rounded,
    'Sebab berlaku faraid':          Icons.gavel_rounded,
    'Halangan pembahagian faraid':   Icons.block_rounded,
    'Waris lelaki':                  Icons.man_rounded,
    'Waris perempuan':               Icons.woman_rounded,
  };

  static const Map<String, String> _groupMap = {
    'Definisi Harta Pusaka':         'Maksud Harta Pusaka',
    'Cara Pengagihan Harta Si Mati': 'Maksud Harta Pusaka',
    'Definisi Faraid':               'Definisi Faraid',
    'Kepentingan Faraid':            'Kepentingan Faraid',
    'Al-Muwarrith':                  'Rukun Faraid',
    'Al-Warith':                     'Rukun Faraid',
    'Al-Mawruth':                    'Rukun Faraid',
    'Syarat-syarat Faraid':          'Syarat-syarat Faraid',
    'Sebab berlaku faraid':          'Sebab Faraid',
    'Halangan pembahagian faraid':   'Sebab Faraid',
    'Waris lelaki':                  'Senarai Waris Pusaka',
    'Waris perempuan':               'Senarai Waris Pusaka',
  };

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<String>>(
      valueListenable: SavedNotifier.instance,
      builder: (context, savedSet, _) {
        final savedList = savedSet.toList();

        return Scaffold(
          backgroundColor: const Color(0xFFF4F6FA),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              'Simpanan',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(children: [

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
              child: Stack(children: [
                Positioned(
                  right: -12, bottom: -12,
                  child: Icon(Icons.bookmark_rounded, size: 100,
                      color: Colors.white.withOpacity(0.05)),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Topik Simpanan',
                      style: TextStyle(color: Colors.white, fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Topik yang awak simpan untuk rujukan mudah.',
                      style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withOpacity(0.18)),
                    ),
                    child: Text('${savedList.length} topik disimpan',
                        style: const TextStyle(color: Color(0xFFEDD98A),
                            fontWeight: FontWeight.w700, fontSize: 13)),
                  ),
                ]),
              ]),
            ),

            const SizedBox(height: 16),

            // ── Content ──
            Expanded(
              child: savedList.isEmpty
                  ? ListView(children: [
                      SizedBox(
                        height: 300,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.bookmark_border_rounded,
                                  size: 64, color: Colors.grey.shade300),
                              const SizedBox(height: 16),
                              Text('Tiada topik disimpan',
                                  style: TextStyle(fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade400)),
                              const SizedBox(height: 8),
                              Text(
                                'Tekan ikon simpan pada mana-mana\ntopik dalam Ilmu Faraid.',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13,
                                    color: Colors.grey.shade400, height: 1.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                      itemCount: savedList.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (_, i) {
                        final title = savedList[i];
                        return _SavedItem(
                          title: title,
                          group: _groupMap[title] ?? 'Ilmu Faraid',
                          icon: _iconMap[title] ?? Icons.bookmark_rounded,
                        );
                      },
                    ),
            ),
          ]),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SAVED ITEM — extracted widget supaya context untuk showModalBottomSheet betul
// ─────────────────────────────────────────────────────────────────────────────
class _SavedItem extends StatelessWidget {
  final String title;
  final String group;
  final IconData icon;

  static const Color primaryColor = Color(0xFF2E3192);

  const _SavedItem({
    required this.title,
    required this.group,
    required this.icon,
  });

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
              offset: const Offset(0, 3)),
        ],
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 6),

        // ── Icon ──
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: primaryColor, size: 22),
        ),

        // ── Title + group ──
        title: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13.5,
                color: Color(0xFF1A1A1A))),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Row(
            children: [
              Icon(Icons.folder_outlined,
                  size: 12, color: Colors.grey.shade400),
              const SizedBox(width: 4),
              Text(group,
                  style: TextStyle(
                      fontSize: 11.5, color: Colors.grey.shade500)),
            ],
          ),
        ),

        // ── Trailing: open + remove ──
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Butang buka modal
            GestureDetector(
              onTap: () => openTopicSheet(context, title),
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(Icons.open_in_new_rounded,
                    color: primaryColor, size: 16),
              ),
            ),
            const SizedBox(width: 8),
            // Butang buang simpanan
            GestureDetector(
              onTap: () {
                SavedNotifier.instance.toggle(title);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('"$title" dibuang dari simpanan'),
                    backgroundColor: primaryColor,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    action: SnackBarAction(
                      label: 'Batal',
                      textColor: const Color(0xFFEDD98A),
                      onPressed: () =>
                          SavedNotifier.instance.toggle(title),
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(Icons.bookmark_remove_rounded,
                    color: Colors.red.shade400, size: 16),
              ),
            ),
          ],
        ),

        // ── Tap pada row → buka modal juga ──
        onTap: () => openTopicSheet(context, title),
      ),
    );
  }
}