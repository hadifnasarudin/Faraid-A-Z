import 'package:flutter/material.dart';

class SyaratFaraidPage extends StatelessWidget {
  const SyaratFaraidPage({super.key});

  final List<String> syarat = const [
    'Kematian Pewaris telah berlaku.',
    'Hidupnya waris yang layak menerima pusaka.',
    'Mengetahui sebab hubungan dan tiada halangan perwarisan.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Syarat-syarat Faraid'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: const Text(
              'Syarat faraid perlu dipenuhi sebelum pembahagian pusaka dilakukan.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: syarat.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      color: Colors.blue.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text('${index + 1}', style: const TextStyle(color: Colors.white)),
                        ),
                        title: Text(syarat[index], style: const TextStyle(fontSize: 16)),
                      ),
                    ),
                    if (index < syarat.length - 1)
                      const Icon(Icons.arrow_downward, color: Colors.blue),
                  ],
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