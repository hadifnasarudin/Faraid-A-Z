import 'package:flutter/material.dart';

class KepentinganFaraidPage extends StatelessWidget {
  const KepentinganFaraidPage({super.key});

  final List<String> content = const [
    'Faraid satu bentuk mekanisme pengurusan harta keluarga.',
    'Faraid sebagai pentadbiran keadilan dan perdamaian.',
    'Faraid adalah lambang keutuhan ikatan keluarga Islam.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Kepentingan Faraid'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: const Text(
              'Ketahui peranan faraid dalam menjaga keadilan dan keharmonian keluarga.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: content.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.check_circle, color: Colors.blue),
                    title: Text(
                      content[index],
                      style: const TextStyle(fontSize: 16),
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
              child: const Text('OK', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}