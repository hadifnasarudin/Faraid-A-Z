import 'package:flutter/material.dart';

class KesFaraidDetailPage extends StatelessWidget {
  final String caseTitle;
  const KesFaraidDetailPage({super.key, required this.caseTitle});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = {
      'Kes 1': {
        'harta': 'RM 100,000.00',
        'waris': [
          {'label': 'Isteri', 'amount': 'RM 12,500.00'},
          {'label': 'Ayah', 'amount': 'RM 16,666.67'},
          {'label': 'Anak lelaki', 'amount': 'RM 70,833.33'},
        ],
      },
      'Kes 2': {
        'harta': 'RM 100,000.00',
        'waris': [
          {'label': 'Ibu', 'amount': 'RM 13,333.33'},
          {'label': 'Isteri', 'amount': 'RM 12,500.00'},
          {'label': 'Anak perempuan', 'amount': 'RM 74,166.67'},
        ],
      },
    }[caseTitle]!;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(caseTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jumlah Harta: ${data['harta']}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('Pembahagian:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            ...List.generate(data['waris'].length, (index) {
              final item = data['waris'][index];
              return Card(
                color: Colors.blue.shade50,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  title: Text(item['label'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Text(item['amount'], style: const TextStyle(fontSize: 16)),
                ),
              );
            }),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Tutup penyelesaian'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}