import 'package:flutter/material.dart';

class RukunFaraidPage extends StatelessWidget {
  const RukunFaraidPage({super.key});

  final List<Map<String, String>> rukun = const [
    {
      'title': 'Al-Muwarith (Pewaris)',
      'description': 'Mereka yang meninggal dunia dan meninggalkan harta untuk diwarisi.'
    },
    {
      'title': 'Al-Warith (Waris)',
      'description': 'Mereka yang masih hidup dan layak menerima harta pusaka.'
    },
    {
      'title': 'Al-Mawruth (Harta pusaka)',
      'description': 'Harta yang ditinggalkan oleh si mati dan layak diagihkan.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Rukun Faraid'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: const Text(
              'Rukun faraid terbahagi kepada 3 komponen utama.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: rukun.length,
              itemBuilder: (context, index) {
                final item = rukun[index];
                return Card(
                  color: Colors.blue.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(item['description']!, style: const TextStyle(fontSize: 16)),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('Seterusnya', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}