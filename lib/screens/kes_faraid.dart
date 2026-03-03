import 'package:flutter/material.dart';
import 'kes_faraid_detail.dart';

class KesFaraidListPage extends StatelessWidget {
  const KesFaraidListPage({super.key});

  final List<Map<String, String>> kesList = const [
    {
      'title': 'Kes 1',
      'summary': 'Si mati tinggalkan isteri, ayah dan anak lelaki.',
    },
    {
      'title': 'Kes 2',
      'summary': 'Si mati tinggalkan ibu, isteri dan anak perempuan.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Kes Faraid'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: kesList.length,
        itemBuilder: (context, index) {
          final item = kesList[index];
          return Card(
            color: Colors.blue.shade50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item['summary']!),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KesFaraidDetailPage(caseTitle: item['title']!),
                    ),
                  );
                },
                child: const Text('Lihat penyelesaian'),
              ),
            ),
          );
        },
      ),
    );
  }
}