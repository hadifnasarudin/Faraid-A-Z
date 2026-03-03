import 'package:flutter/material.dart';
// Import page sebenar bila siap nanti
import 'soalan_lazim.dart';
import 'glossari.dart';

class SoalanGlosariMenu extends StatelessWidget {
  const SoalanGlosariMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Soalan Lazim dan Glosari'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: const Text(
              'Ketahui soalan umum dan glosari berkaitan faraid.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildMenuCard(
                  context,
                  icon: Icons.question_answer,
                  title: 'Soalan Lazim',
                  subtitle: 'Senarai soalan dan jawapan',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SoalanLazimPage()));
                  },
                ),
                const SizedBox(height: 16),
                _buildMenuCard(
                  context,
                  icon: Icons.book,
                  title: 'Glosari',
                  subtitle: 'Senarai istilah dan terjemahan',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const GlosariPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onTap}) {
    return Card(
      color: Colors.blue.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}