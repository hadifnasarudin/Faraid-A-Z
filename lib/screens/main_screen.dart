import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';

import 'ilmu_faraid_screen.dart';
import 'soalan_glosari.dart';
import 'kes_faraid.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String gregorianDate = '';
  String hijriDate = '';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateDateTime();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateDateTime();
    });
  }

  void _updateDateTime() {
    final now = DateTime.now();

    final formattedDate = DateFormat('EEE, dd MMM yyyy').format(now);
    final formattedTime = DateFormat('HH:mm:ss').format(now);

    final hijri = HijriCalendar.fromDate(now);

    setState(() {
      gregorianDate = '$formattedDate\n$formattedTime';
      hijriDate = '${hijri.hDay} ${hijri.longMonthName} ${hijri.hYear} H';
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E3192),
        title: const Text('Faraid A-Z'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),

          /// Hijri Date
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 6,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2E3192), Color(0xFF1BFFFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: 28,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      hijriDate,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      gregorianDate,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildCard(context, 'Ilmu Faraid', Icons.menu_book),
                _buildCard(context, 'Kalkulator Faraid', Icons.calculate),
                _buildCard(context, 'Soalan Lazim', Icons.help_outline),
                _buildCard(context, 'Kes Faraid', Icons.folder_open),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.subject), label: 'Subjects'),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (title == 'Ilmu Faraid') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const IlmuFaraidScreen()),
          );
        } else if (title == 'Soalan Lazim') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SoalanGlosariMenu()),
          );
        } else if (title == 'Kes Faraid') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const KesFaraidListPage()),
          );
        }
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              const SizedBox(height: 8),
              Text(title, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
