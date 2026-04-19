import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ═════════════════════════════════════════════════════════════════════════════
// KALKULATOR FARAID
// Panggil dari main_screen.dart:
//   Navigator.push(context, MaterialPageRoute(builder: (_) => const KalkulatorFaraidScreen()));
// ═════════════════════════════════════════════════════════════════════════════
class KalkulatorFaraidScreen extends StatefulWidget {
  const KalkulatorFaraidScreen({super.key});

  @override
  State<KalkulatorFaraidScreen> createState() => _KalkulatorFaraidScreenState();
}

class _KalkulatorFaraidScreenState extends State<KalkulatorFaraidScreen>
    with SingleTickerProviderStateMixin {
  static const Color navy = Color(0xFF0D1247);
  static const Color royalBlue = Color(0xFF2E3192);
  static const Color gold = Color(0xFFC9A84C);

  late TabController _tabCtrl;

  // ── Form state ──
  final _hartaCtrl = TextEditingController();
  String _statusPewaris = 'lelaki'; // lelaki / perempuan

  // Waris yang dipilih: key = waris id, value = bilangan
  final Map<String, int> _selectedWaris = {};

  // Result
  List<_HasilItem>? _hasil;
  double _totalHarta = 0;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    _hartaCtrl.dispose();
    super.dispose();
  }

  // ── Waris definitions ────────────────────────────────────────────────────
  // Format: id, nama, jantina pewaris yang boleh ada ('l'=lelaki sahaja, 'p'=perempuan sahaja, 'b'=kedua)
  static const List<_WarisInfo> _semua_waris = [
    // Waris lelaki
    _WarisInfo(id: 'anak_l',        nama: 'Anak Lelaki',                          gender: 'b', maxBil: 10),
    _WarisInfo(id: 'anak_p',        nama: 'Anak Perempuan',                       gender: 'b', maxBil: 10),
    _WarisInfo(id: 'cucu_l',        nama: 'Cucu Lelaki (drpd anak lelaki)',        gender: 'b', maxBil: 10),
    _WarisInfo(id: 'cucu_p',        nama: 'Cucu Perempuan (drpd anak lelaki)',     gender: 'b', maxBil: 10),
    _WarisInfo(id: 'bapa',          nama: 'Bapa',                                 gender: 'b', maxBil: 1),
    _WarisInfo(id: 'datuk',         nama: 'Datuk (bapa kpd bapa)',                gender: 'b', maxBil: 1),
    _WarisInfo(id: 'ibu',           nama: 'Ibu',                                  gender: 'b', maxBil: 1),
    _WarisInfo(id: 'nenek_ibu',     nama: 'Nenek (sebelah ibu)',                  gender: 'b', maxBil: 1),
    _WarisInfo(id: 'nenek_bapa',    nama: 'Nenek (sebelah bapa)',                 gender: 'b', maxBil: 1),
    _WarisInfo(id: 'suami',         nama: 'Suami',                                gender: 'p', maxBil: 1),
    _WarisInfo(id: 'isteri',        nama: 'Isteri',                               gender: 'l', maxBil: 4),
    _WarisInfo(id: 'sdra_l_sb',     nama: 'Saudara Lelaki Seibu Sebapa',          gender: 'b', maxBil: 5),
    _WarisInfo(id: 'sdra_p_sb',     nama: 'Saudara Perempuan Seibu Sebapa',       gender: 'b', maxBil: 5),
    _WarisInfo(id: 'sdra_l_bapa',   nama: 'Saudara Lelaki Sebapa',                gender: 'b', maxBil: 5),
    _WarisInfo(id: 'sdra_p_bapa',   nama: 'Saudara Perempuan Sebapa',             gender: 'b', maxBil: 5),
    _WarisInfo(id: 'sdra_l_ibu',    nama: 'Saudara Lelaki Seibu',                 gender: 'b', maxBil: 5),
    _WarisInfo(id: 'sdra_p_ibu',    nama: 'Saudara Perempuan Seibu',              gender: 'b', maxBil: 5),
    _WarisInfo(id: 'anak_sdra_sb',  nama: 'Anak Saudara Lelaki Seibu Sebapa',     gender: 'b', maxBil: 5),
    _WarisInfo(id: 'bapa_sdr_sb',   nama: 'Bapa Saudara Seibu Sebapa',            gender: 'b', maxBil: 3),
    _WarisInfo(id: 'bapa_sdr_bapa', nama: 'Bapa Saudara Sebapa',                  gender: 'b', maxBil: 3),
    _WarisInfo(id: 'sepupu_sb',     nama: 'Sepupu (drpd bapa saudara seibu sebapa)', gender: 'b', maxBil: 5),
    _WarisInfo(id: 'sepupu_bapa',   nama: 'Sepupu (drpd bapa saudara sebapa)',    gender: 'b', maxBil: 5),
    _WarisInfo(id: 'tuan_l',        nama: 'Tuan lelaki yang merdekakan hamba',    gender: 'b', maxBil: 1),
    _WarisInfo(id: 'tuan_p',        nama: 'Tuan perempuan yang merdekakan hamba', gender: 'b', maxBil: 1),
  ];

  List<_WarisInfo> get _aktifWaris => _semua_waris
      .where((w) => w.gender == 'b' || w.gender == _statusPewaris[0])
      .toList();

  // ── Kiraan Faraid ────────────────────────────────────────────────────────
  void _kira() {
    final hartaText = _hartaCtrl.text.replaceAll(',', '');
    final harta = double.tryParse(hartaText) ?? 0;
    if (harta <= 0) {
      _showError('Sila masukkan jumlah harta yang sah.');
      return;
    }
    if (_selectedWaris.isEmpty) {
      _showError('Sila pilih sekurang-kurangnya satu waris.');
      return;
    }

    _totalHarta = harta;
    final hasil = _hitungFaraid(harta, _selectedWaris, _statusPewaris);

    setState(() {
      _hasil = hasil;
    });

    _tabCtrl.animateTo(1);
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _reset() {
    setState(() {
      _hartaCtrl.clear();
      _selectedWaris.clear();
      _hasil = null;
      _statusPewaris = 'lelaki';
    });
    _tabCtrl.animateTo(0);
  }

  // ════════════════════════════════════════════════════════════════════════
  // FARAID CALCULATION ENGINE
  // Mengikut hukum faraid Mazhab Syafie
  // ════════════════════════════════════════════════════════════════════════
  static List<_HasilItem> _hitungFaraid(
    double harta,
    Map<String, int> w,
    String pewaris,
  ) {
    final hasil = <_HasilItem>[];

    bool ada(String id) => (w[id] ?? 0) > 0;
    int bil(String id) => w[id] ?? 0;

    // ── Helpers ──
    double rm(double bahagian) => harta * bahagian;
    String pct(double bahagian) =>
        '${(bahagian * 100).toStringAsFixed(1)}%';

    // ── Penentuan hajb (halangan) ──
    final bool adaAnakL = ada('anak_l');
    final bool adaAnakP = ada('anak_p');
    final bool adaAnakLOrP = adaAnakL || adaAnakP;
    final bool adaBapa = ada('bapa');
    final bool adaIbu = ada('ibu');
    final bool adaCucuL = ada('cucu_l');
    final bool adaCucuP = ada('cucu_p');

    // Cucu ditutup oleh anak lelaki
    final bool cucuAktif = (adaCucuL || adaCucuP) && !adaAnakL;

    // Datuk ditutup oleh bapa
    final bool datukAktif = ada('datuk') && !adaBapa;

    // Nenek ditutup oleh ibu
    final bool nenekIbuAktif = ada('nenek_ibu') && !adaIbu;
    final bool nenekBapaAktif = ada('nenek_bapa') && !adaIbu && !adaBapa;

    // Saudara ditutup oleh: anak lelaki, cucu lelaki, bapa
    final bool saudaraAktif =
        !adaAnakL && !adaCucuL && !adaBapa;

    // Bapa saudara / sepupu ditutup oleh saudara lelaki seibu sebapa
    final bool bapaSdrAktif = saudaraAktif &&
        !ada('sdra_l_sb') && !ada('anak_sdra_sb');

    // ── Pengiraan bahagian ──
    double sisaHarta = 1.0; // dalam nisbah
    double diagih = 0.0;

    // 1. SUAMI / ISTERI
    if (pewaris == 'perempuan' && ada('suami')) {
      double bhg = adaAnakLOrP || cucuAktif ? 1 / 4 : 1 / 2;
      hasil.add(_HasilItem(
        nama: 'Suami',
        bilangan: 1,
        pecahan: adaAnakLOrP || cucuAktif ? '¼' : '½',
        peratus: pct(bhg),
        jumlahRM: rm(bhg),
        warna: const Color(0xFF880E4F),
        icon: Icons.favorite_rounded,
      ));
      diagih += bhg;
    }

    if (pewaris == 'lelaki' && ada('isteri')) {
      int bilIsteri = bil('isteri').clamp(1, 4);
      double bhg = adaAnakLOrP || cucuAktif ? 1 / 8 : 1 / 4;
      hasil.add(_HasilItem(
        nama: 'Isteri${bilIsteri > 1 ? ' ($bilIsteri orang)' : ''}',
        bilangan: bilIsteri,
        pecahan: adaAnakLOrP || cucuAktif ? '⅛' : '¼',
        peratus: pct(bhg),
        jumlahRM: rm(bhg),
        warna: const Color(0xFF880E4F),
        icon: Icons.favorite_rounded,
        nota: bilIsteri > 1
            ? 'Dibahagi sama rata antara ${bilIsteri} isteri'
            : null,
      ));
      diagih += bhg;
    }

    // 2. IBU
    if (adaIbu) {
      bool adaSaudaraBanyak = (bil('sdra_l_sb') + bil('sdra_p_sb') +
              bil('sdra_l_bapa') + bil('sdra_p_bapa') +
              bil('sdra_l_ibu') + bil('sdra_p_ibu')) >= 2;
      double bhg = (adaAnakLOrP || cucuAktif)
          ? 1 / 6
          : adaSaudaraBanyak
              ? 1 / 6
              : 1 / 3;
      String pec = bhg == 1 / 6 ? '⅙' : '⅓';
      hasil.add(_HasilItem(
        nama: 'Ibu',
        bilangan: 1,
        pecahan: pec,
        peratus: pct(bhg),
        jumlahRM: rm(bhg),
        warna: const Color(0xFF1B5E20),
        icon: Icons.elderly_woman_rounded,
      ));
      diagih += bhg;
    }

    // 3. NENEK
    if (nenekIbuAktif || nenekBapaAktif) {
      double bhg = 1 / 6;
      String namaNenek = '';
      if (nenekIbuAktif && nenekBapaAktif) {
        namaNenek = 'Nenek (sebelah ibu & bapa)';
      } else if (nenekIbuAktif) {
        namaNenek = 'Nenek (sebelah ibu)';
      } else {
        namaNenek = 'Nenek (sebelah bapa)';
      }
      hasil.add(_HasilItem(
        nama: namaNenek,
        bilangan: 1,
        pecahan: '⅙',
        peratus: pct(bhg),
        jumlahRM: rm(bhg),
        warna: const Color(0xFF1B5E20),
        icon: Icons.elderly_woman_rounded,
      ));
      diagih += bhg;
    }

    // 4. BAPA
    if (adaBapa) {
      if (adaAnakLOrP || cucuAktif) {
        // Ada anak/cucu: bapa dapat ⅙ sahaja
        double bhg = 1 / 6;
        hasil.add(_HasilItem(
          nama: 'Bapa',
          bilangan: 1,
          pecahan: '⅙',
          peratus: pct(bhg),
          jumlahRM: rm(bhg),
          warna: const Color(0xFF1565C0),
          icon: Icons.person_rounded,
          nota: 'Mendapat ⅙ kerana ada anak/cucu',
        ));
        diagih += bhg;
      } else {
        // Tiada anak/cucu: bapa jadi asabah — ambil sisa
        // (akan diproses di bahagian asabah bawah)
      }
    }

    // 5. DATUK (jika aktif, tiada bapa)
    if (datukAktif) {
      if (adaAnakLOrP || cucuAktif) {
        double bhg = 1 / 6;
        hasil.add(_HasilItem(
          nama: 'Datuk',
          bilangan: 1,
          pecahan: '⅙',
          peratus: pct(bhg),
          jumlahRM: rm(bhg),
          warna: const Color(0xFF1565C0),
          icon: Icons.person_rounded,
        ));
        diagih += bhg;
      }
    }

    // 6. ANAK PEREMPUAN (Zawil Furud)
    if (adaAnakP && !adaAnakL) {
      int bilAnakP = bil('anak_p');
      double bhg = bilAnakP == 1 ? 1 / 2 : 2 / 3;
      String pec = bilAnakP == 1 ? '½' : '⅔';
      hasil.add(_HasilItem(
        nama: 'Anak Perempuan',
        bilangan: bilAnakP,
        pecahan: pec,
        peratus: pct(bhg),
        jumlahRM: rm(bhg),
        warna: const Color(0xFF6A1B9A),
        icon: Icons.child_care_rounded,
        nota: bilAnakP > 1 ? 'Dibahagi sama rata' : null,
      ));
      diagih += bhg;
    }

    // 7. CUCU PEREMPUAN (jika aktif)
    if (cucuAktif && adaCucuP && !adaCucuL) {
      int bilCucuP = bil('cucu_p');
      // Jika ada anak perempuan 1 orang, cucu perempuan dapat ⅙
      // Jika tiada anak perempuan, cucu perempuan dapat ½ atau ⅔
      double bhg;
      String pec;
      if (adaAnakP && bil('anak_p') == 1) {
        bhg = 1 / 6;
        pec = '⅙';
      } else if (!adaAnakP) {
        bhg = bilCucuP == 1 ? 1 / 2 : 2 / 3;
        pec = bilCucuP == 1 ? '½' : '⅔';
      } else {
        bhg = 0;
        pec = '-';
      }
      if (bhg > 0) {
        hasil.add(_HasilItem(
          nama: 'Cucu Perempuan',
          bilangan: bilCucuP,
          pecahan: pec,
          peratus: pct(bhg),
          jumlahRM: rm(bhg),
          warna: const Color(0xFF6A1B9A),
          icon: Icons.child_care_rounded,
          nota: bilCucuP > 1 ? 'Dibahagi sama rata' : null,
        ));
        diagih += bhg;
      }
    }

    // 8. SAUDARA PEREMPUAN SEIBU SEBAPA (jika tiada anak, bapa, datuk)
    if (saudaraAktif && !datukAktif && ada('sdra_p_sb') && !ada('sdra_l_sb')) {
      int bilSdr = bil('sdra_p_sb');
      // Jika ada anak/cucu perempuan → asabah (proses kemudian)
      bool jadAsabah = adaAnakP || adaCucuP;
      if (!jadAsabah) {
        double bhg = bilSdr == 1 ? 1 / 2 : 2 / 3;
        String pec = bilSdr == 1 ? '½' : '⅔';
        hasil.add(_HasilItem(
          nama: 'Saudara Perempuan Seibu Sebapa',
          bilangan: bilSdr,
          pecahan: pec,
          peratus: pct(bhg),
          jumlahRM: rm(bhg),
          warna: const Color(0xFFBF360C),
          icon: Icons.people_rounded,
          nota: bilSdr > 1 ? 'Dibahagi sama rata' : null,
        ));
        diagih += bhg;
      }
    }

    // 9. SAUDARA SEIBU (lelaki & perempuan)
    if (saudaraAktif) {
      int bilSeibu = bil('sdra_l_ibu') + bil('sdra_p_ibu');
      if (bilSeibu > 0 && !adaAnakLOrP && !cucuAktif) {
        double bhg = bilSeibu == 1 ? 1 / 6 : 1 / 3;
        String pec = bilSeibu == 1 ? '⅙' : '⅓';
        String nama = bilSeibu == 1
            ? (ada('sdra_l_ibu') ? 'Saudara Lelaki Seibu' : 'Saudara Perempuan Seibu')
            : 'Saudara Seibu ($bilSeibu orang)';
        hasil.add(_HasilItem(
          nama: nama,
          bilangan: bilSeibu,
          pecahan: pec,
          peratus: pct(bhg),
          jumlahRM: rm(bhg),
          warna: const Color(0xFFBF360C),
          icon: Icons.people_rounded,
          nota: bilSeibu > 1 ? 'Dibahagi sama rata (lelaki = perempuan)' : null,
        ));
        diagih += bhg;
      }
    }

    // ── ASABAH (ambil sisa) ──────────────────────────────────────────────
    double sisa = (1.0 - diagih).clamp(0.0, 1.0);

    if (sisa > 0.001) {
      // Tentukan siapa asabah
      if (adaAnakL) {
        // Anak lelaki + anak perempuan (jika ada) — 2:1
        int bilL = bil('anak_l');
        int bilP = adaAnakP ? bil('anak_p') : 0;
        if (bilP == 0) {
          hasil.add(_HasilItem(
            nama: 'Anak Lelaki${bilL > 1 ? ' ($bilL orang)' : ''}',
            bilangan: bilL,
            pecahan: 'Sisa',
            peratus: pct(sisa),
            jumlahRM: rm(sisa),
            warna: const Color(0xFF0D47A1),
            icon: Icons.child_care_rounded,
            nota: bilL > 1 ? 'Dibahagi sama rata' : null,
          ));
        } else {
          // Bersama anak perempuan: 2:1
          double unit = sisa / (bilL * 2 + bilP);
          double bhgL = unit * 2 * bilL;
          double bhgP = unit * bilP;
          hasil.add(_HasilItem(
            nama: 'Anak Lelaki ($bilL orang)',
            bilangan: bilL,
            pecahan: 'Sisa',
            peratus: pct(bhgL),
            jumlahRM: rm(bhgL),
            warna: const Color(0xFF0D47A1),
            icon: Icons.child_care_rounded,
            nota: 'Kadar 2:1 bersama anak perempuan',
          ));
          hasil.add(_HasilItem(
            nama: 'Anak Perempuan ($bilP orang)',
            bilangan: bilP,
            pecahan: 'Sisa',
            peratus: pct(bhgP),
            jumlahRM: rm(bhgP),
            warna: const Color(0xFF6A1B9A),
            icon: Icons.child_care_rounded,
            nota: 'Kadar 2:1 bersama anak lelaki',
          ));
        }
      } else if (cucuAktif && adaCucuL) {
        int bilL = bil('cucu_l');
        int bilP = adaCucuP ? bil('cucu_p') : 0;
        double unit = sisa / (bilL * 2 + (bilP == 0 ? 0 : bilP));
        if (bilP == 0) {
          hasil.add(_HasilItem(
            nama: 'Cucu Lelaki${bilL > 1 ? ' ($bilL orang)' : ''}',
            bilangan: bilL,
            pecahan: 'Sisa',
            peratus: pct(sisa),
            jumlahRM: rm(sisa),
            warna: const Color(0xFF0D47A1),
            icon: Icons.child_care_rounded,
            nota: bilL > 1 ? 'Dibahagi sama rata' : null,
          ));
        } else {
          double bhgL = unit * 2 * bilL;
          double bhgP = unit * bilP;
          hasil.add(_HasilItem(
            nama: 'Cucu Lelaki ($bilL orang)',
            bilangan: bilL,
            pecahan: 'Sisa',
            peratus: pct(bhgL),
            jumlahRM: rm(bhgL),
            warna: const Color(0xFF0D47A1),
            icon: Icons.child_care_rounded,
          ));
          hasil.add(_HasilItem(
            nama: 'Cucu Perempuan ($bilP orang)',
            bilangan: bilP,
            pecahan: 'Sisa',
            peratus: pct(bhgP),
            jumlahRM: rm(bhgP),
            warna: const Color(0xFF6A1B9A),
            icon: Icons.child_care_rounded,
          ));
        }
      } else if (adaBapa) {
        hasil.add(_HasilItem(
          nama: 'Bapa',
          bilangan: 1,
          pecahan: adaAnakLOrP || cucuAktif ? '⅙+Sisa' : 'Sisa',
          peratus: pct(adaAnakLOrP || cucuAktif ? sisa + 1 / 6 : sisa),
          jumlahRM: rm(adaAnakLOrP || cucuAktif ? sisa + 1 / 6 : sisa),
          warna: const Color(0xFF1565C0),
          icon: Icons.person_rounded,
          nota: adaAnakLOrP || cucuAktif
              ? 'Jumlah ⅙ (furud) + baki sisa (asabah)'
              : 'Mendapat semua baki sebagai asabah',
        ));
        // Kalau bapa dapat furud + asabah, remove entry furud bapa yg lepas
        hasil.removeWhere((h) =>
            h.nama == 'Bapa' &&
            h.pecahan == '⅙' &&
            hasil.length > 1);
      } else if (datukAktif) {
        hasil.add(_HasilItem(
          nama: 'Datuk',
          bilangan: 1,
          pecahan: 'Sisa',
          peratus: pct(sisa),
          jumlahRM: rm(sisa),
          warna: const Color(0xFF1565C0),
          icon: Icons.person_rounded,
        ));
      } else if (saudaraAktif && ada('sdra_l_sb')) {
        int bilL = bil('sdra_l_sb');
        int bilP = ada('sdra_p_sb') ? bil('sdra_p_sb') : 0;
        if (bilP == 0) {
          hasil.add(_HasilItem(
            nama: 'Saudara Lelaki Seibu Sebapa${bilL > 1 ? ' ($bilL orang)' : ''}',
            bilangan: bilL,
            pecahan: 'Sisa',
            peratus: pct(sisa),
            jumlahRM: rm(sisa),
            warna: const Color(0xFFBF360C),
            icon: Icons.people_rounded,
            nota: bilL > 1 ? 'Dibahagi sama rata' : null,
          ));
        } else {
          double unit = sisa / (bilL * 2 + bilP);
          hasil.add(_HasilItem(
            nama: 'Saudara Lelaki Seibu Sebapa ($bilL)',
            bilangan: bilL,
            pecahan: 'Sisa',
            peratus: pct(unit * 2 * bilL),
            jumlahRM: rm(unit * 2 * bilL),
            warna: const Color(0xFFBF360C),
            icon: Icons.people_rounded,
          ));
          hasil.add(_HasilItem(
            nama: 'Saudara Perempuan Seibu Sebapa ($bilP)',
            bilangan: bilP,
            pecahan: 'Sisa',
            peratus: pct(unit * bilP),
            jumlahRM: rm(unit * bilP),
            warna: const Color(0xFFBF360C),
            icon: Icons.people_rounded,
            nota: 'Kadar 2:1',
          ));
        }
      } else if (saudaraAktif && ada('sdra_l_bapa')) {
        int bilL = bil('sdra_l_bapa');
        hasil.add(_HasilItem(
          nama: 'Saudara Lelaki Sebapa${bilL > 1 ? ' ($bilL orang)' : ''}',
          bilangan: bilL,
          pecahan: 'Sisa',
          peratus: pct(sisa),
          jumlahRM: rm(sisa),
          warna: const Color(0xFFBF360C),
          icon: Icons.people_rounded,
        ));
      } else if (bapaSdrAktif && ada('anak_sdra_sb')) {
        int bil2 = bil('anak_sdra_sb');
        hasil.add(_HasilItem(
          nama: 'Anak Saudara Lelaki Seibu Sebapa${bil2 > 1 ? ' ($bil2 orang)' : ''}',
          bilangan: bil2,
          pecahan: 'Sisa',
          peratus: pct(sisa),
          jumlahRM: rm(sisa),
          warna: const Color(0xFFBF360C),
          icon: Icons.people_rounded,
        ));
      } else if (bapaSdrAktif && ada('bapa_sdr_sb')) {
        int bil2 = bil('bapa_sdr_sb');
        hasil.add(_HasilItem(
          nama: 'Bapa Saudara Seibu Sebapa${bil2 > 1 ? ' ($bil2 orang)' : ''}',
          bilangan: bil2,
          pecahan: 'Sisa',
          peratus: pct(sisa),
          jumlahRM: rm(sisa),
          warna: const Color(0xFF4A148C),
          icon: Icons.person_rounded,
        ));
      } else if (bapaSdrAktif && ada('bapa_sdr_bapa')) {
        int bil2 = bil('bapa_sdr_bapa');
        hasil.add(_HasilItem(
          nama: 'Bapa Saudara Sebapa${bil2 > 1 ? ' ($bil2 orang)' : ''}',
          bilangan: bil2,
          pecahan: 'Sisa',
          peratus: pct(sisa),
          jumlahRM: rm(sisa),
          warna: const Color(0xFF4A148C),
          icon: Icons.person_rounded,
        ));
      } else if (bapaSdrAktif && ada('sepupu_sb')) {
        int bil2 = bil('sepupu_sb');
        hasil.add(_HasilItem(
          nama: 'Sepupu (drpd bapa saudara seibu sebapa)${bil2 > 1 ? ' ($bil2 orang)' : ''}',
          bilangan: bil2,
          pecahan: 'Sisa',
          peratus: pct(sisa),
          jumlahRM: rm(sisa),
          warna: const Color(0xFF4A148C),
          icon: Icons.person_rounded,
        ));
      } else if (ada('tuan_l') || ada('tuan_p')) {
        hasil.add(_HasilItem(
          nama: ada('tuan_l') ? 'Tuan yang merdekakan hamba' : 'Tuan perempuan yang merdekakan hamba',
          bilangan: 1,
          pecahan: 'Sisa',
          peratus: pct(sisa),
          jumlahRM: rm(sisa),
          warna: const Color(0xFF37474F),
          icon: Icons.shield_rounded,
        ));
      } else {
        // Baitul Mal
        hasil.add(_HasilItem(
          nama: 'Baitul Mal',
          bilangan: 1,
          pecahan: 'Sisa',
          peratus: pct(sisa),
          jumlahRM: rm(sisa),
          warna: Colors.grey,
          icon: Icons.account_balance_rounded,
          nota: 'Tiada asabah — harta dipulangkan ke Baitul Mal',
        ));
      }
    }

    return hasil;
  }

  // ─────────────────────────────────────────────────────────────────────────
  // BUILD
  // ─────────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Kalkulator Faraid',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          if (_hasil != null)
            TextButton(
              onPressed: _reset,
              child: const Text('Reset',
                  style: TextStyle(
                      color: royalBlue, fontWeight: FontWeight.w700)),
            ),
        ],
      ),
      body: Column(
        children: [
          // ── Header ──
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kira Bahagian Waris',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Masukkan maklumat pewaris dan waris untuk pengiraan faraid.',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 14),
                // Tab bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                    controller: _tabCtrl,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white54,
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 13),
                    indicator: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tabs: const [
                      Tab(text: '  Input  '),
                      Tab(text: '  Hasil  '),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Tab content ──
          Expanded(
            child: TabBarView(
              controller: _tabCtrl,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildInputTab(),
                _buildHasilTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // INPUT TAB
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildInputTab() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
      children: [

        // ── Jumlah harta ──
        _SectionLabel(label: 'Jumlah Harta (RM)'),
        const SizedBox(height: 8),
        Container(
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
          child: TextField(
            controller: _hartaCtrl,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[\d.]'))
            ],
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              prefixText: 'RM  ',
              prefixStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade500),
              hintText: '0.00',
              hintStyle: TextStyle(color: Colors.grey.shade300),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(18),
            ),
          ),
        ),

        const SizedBox(height: 22),

        // ── Status pewaris ──
        _SectionLabel(label: 'Status Pewaris (Si Mati)'),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _StatusChip(
                label: 'Lelaki',
                icon: Icons.man_rounded,
                selected: _statusPewaris == 'lelaki',
                onTap: () => setState(() {
                  _statusPewaris = 'lelaki';
                  _selectedWaris.remove('suami');
                }),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatusChip(
                label: 'Perempuan',
                icon: Icons.woman_rounded,
                selected: _statusPewaris == 'perempuan',
                onTap: () => setState(() {
                  _statusPewaris = 'perempuan';
                  _selectedWaris.remove('isteri');
                }),
              ),
            ),
          ],
        ),

        const SizedBox(height: 22),

        // ── Pilih waris ──
        _SectionLabel(label: 'Pilih Waris yang Ada'),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 3))
            ],
          ),
          child: Column(
            children: List.generate(_aktifWaris.length, (i) {
              final w = _aktifWaris[i];
              final isLast = i == _aktifWaris.length - 1;
              final selected = (_selectedWaris[w.id] ?? 0) > 0;
              return Column(
                children: [
                  _WarisRow(
                    waris: w,
                    bilangan: _selectedWaris[w.id] ?? 0,
                    onToggle: (val) {
                      setState(() {
                        if (val) {
                          _selectedWaris[w.id] = 1;
                        } else {
                          _selectedWaris.remove(w.id);
                        }
                      });
                    },
                    onChangeBil: (bil) {
                      setState(() {
                        if (bil <= 0) {
                          _selectedWaris.remove(w.id);
                        } else {
                          _selectedWaris[w.id] = bil;
                        }
                      });
                    },
                  ),
                  if (!isLast)
                    Divider(
                        height: 1,
                        color: Colors.grey.shade100,
                        indent: 16,
                        endIndent: 16),
                ],
              );
            }),
          ),
        ),

        const SizedBox(height: 28),

        // ── Butang kira ──
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _kira,
            style: ElevatedButton.styleFrom(
              backgroundColor: royalBlue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              shadowColor: royalBlue.withOpacity(0.4),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calculate_rounded, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Kira Faraid',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // HASIL TAB
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildHasilTab() {
    if (_hasil == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calculate_outlined,
                size: 56, color: Colors.grey.shade300),
            const SizedBox(height: 14),
            Text(
              'Belum ada pengiraan',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text(
              'Isikan maklumat di tab Input dan tekan Kira Faraid.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.5, color: Colors.grey.shade400),
            ),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
      children: [

        // ── Summary card ──
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0D1247), Color(0xFF2E3192)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: royalBlue.withOpacity(0.3),
                  blurRadius: 14,
                  offset: const Offset(0, 5))
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
                child: const Icon(Icons.account_balance_wallet_rounded,
                    color: Colors.white, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Jumlah Harta',
                        style:
                            TextStyle(color: Colors.white60, fontSize: 12)),
                    Text(
                      'RM ${_formatRM(_totalHarta)}',
                      style: const TextStyle(
                        color: Color(0xFFEDD98A),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${_hasil!.length} waris',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    _statusPewaris == 'lelaki' ? 'Pewaris: Lelaki' : 'Pewaris: Perempuan',
                    style: const TextStyle(
                        color: Colors.white60, fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // ── Hasil cards ──
        ..._hasil!.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _HasilCard(item: item),
            )),

        const SizedBox(height: 16),

        // ── Disclaimer ──
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF8E1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: gold.withOpacity(0.3)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info_outline_rounded,
                  color: gold, size: 18),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Pengiraan ini adalah panduan asas mengikut Mazhab Syafie. Untuk kes yang kompleks, sila dapatkan khidmat nasihat daripada Pejabat Agama Islam atau pakar faraid yang berkelayakan.',
                  style: TextStyle(
                      fontSize: 12, color: Colors.grey.shade700, height: 1.5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static String _formatRM(double val) {
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
    return '${buffer.toString().split('').reversed.join()}.$decPart';
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SECTION LABEL
// ─────────────────────────────────────────────────────────────────────────────
class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: Colors.grey.shade600,
        letterSpacing: 0.3,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// STATUS CHIP (Lelaki / Perempuan)
// ─────────────────────────────────────────────────────────────────────────────
class _StatusChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  static const Color royalBlue = Color(0xFF2E3192);

  const _StatusChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: selected ? royalBlue : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              color: selected ? royalBlue : Colors.grey.shade300),
          boxShadow: selected
              ? [
                  BoxShadow(
                      color: royalBlue.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3))
                ]
              : [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 2))
                ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: selected ? Colors.white : Colors.grey.shade500,
                size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.grey.shade600,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// WARIS ROW (checkbox + bilangan)
// ─────────────────────────────────────────────────────────────────────────────
class _WarisInfo {
  final String id;
  final String nama;
  final String gender; // 'l', 'p', 'b'
  final int maxBil;
  const _WarisInfo(
      {required this.id,
      required this.nama,
      required this.gender,
      required this.maxBil});
}

class _WarisRow extends StatelessWidget {
  final _WarisInfo waris;
  final int bilangan;
  final ValueChanged<bool> onToggle;
  final ValueChanged<int> onChangeBil;

  static const Color royalBlue = Color(0xFF2E3192);

  const _WarisRow({
    required this.waris,
    required this.bilangan,
    required this.onToggle,
    required this.onChangeBil,
  });

  @override
  Widget build(BuildContext context) {
    final selected = bilangan > 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          // Checkbox
          GestureDetector(
            onTap: () => onToggle(!selected),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: selected ? royalBlue : Colors.transparent,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                    color:
                        selected ? royalBlue : Colors.grey.shade400,
                    width: 1.8),
              ),
              child: selected
                  ? const Icon(Icons.check_rounded,
                      color: Colors.white, size: 16)
                  : null,
            ),
          ),
          const SizedBox(width: 12),

          // Nama
          Expanded(
            child: Text(
              waris.nama,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight:
                    selected ? FontWeight.w600 : FontWeight.normal,
                color: selected
                    ? const Color(0xFF1A1A1A)
                    : Colors.grey.shade600,
              ),
            ),
          ),

          // Bilangan stepper (hanya jika selected & maxBil > 1)
          if (selected && waris.maxBil > 1) ...[
            GestureDetector(
              onTap: () => onChangeBil(bilangan - 1),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: royalBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.remove_rounded,
                    color: royalBlue, size: 16),
              ),
            ),
            SizedBox(
              width: 32,
              child: Text(
                '$bilangan',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: royalBlue,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (bilangan < waris.maxBil) onChangeBil(bilangan + 1);
              },
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: royalBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.add_rounded,
                    color: royalBlue, size: 16),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// HASIL ITEM MODEL
// ─────────────────────────────────────────────────────────────────────────────
class _HasilItem {
  final String nama;
  final int bilangan;
  final String pecahan;
  final String peratus;
  final double jumlahRM;
  final Color warna;
  final IconData icon;
  final String? nota;

  const _HasilItem({
    required this.nama,
    required this.bilangan,
    required this.pecahan,
    required this.peratus,
    required this.jumlahRM,
    required this.warna,
    required this.icon,
    this.nota,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// HASIL CARD
// ─────────────────────────────────────────────────────────────────────────────
class _HasilCard extends StatelessWidget {
  final _HasilItem item;
  const _HasilCard({required this.item});

  static String _fmt(double val) {
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
    return '${buffer.toString().split('').reversed.join()}.$decPart';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              color: item.warna.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, 3))
        ],
      ),
      child: Column(
        children: [
          // ── Top row ──
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: item.warna.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(item.icon, color: item.warna, size: 19),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.nama,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.5,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      if (item.nota != null)
                        Text(
                          item.nota!,
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade500),
                        ),
                    ],
                  ),
                ),
                // Pecahan badge
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: item.warna.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: item.warna.withOpacity(0.2)),
                  ),
                  child: Text(
                    item.pecahan,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: item.warna,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Bottom: % + RM ──
          Container(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
            decoration: BoxDecoration(
              color: item.warna.withOpacity(0.04),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(18)),
            ),
            child: Row(
              children: [
                // %
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Peratus',
                          style: TextStyle(
                              fontSize: 10.5,
                              color: Colors.grey.shade500)),
                      Text(
                        item.peratus,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: item.warna,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: 1,
                    height: 30,
                    color: item.warna.withOpacity(0.15)),
                const SizedBox(width: 14),
                // RM
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jumlah',
                          style: TextStyle(
                              fontSize: 10.5,
                              color: Colors.grey.shade500)),
                      Text(
                        'RM ${_fmt(item.jumlahRM)}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1A1A1A),
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