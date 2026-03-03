import 'package:flutter/material.dart';

class DefinisiFaraidPage extends StatelessWidget {
  const DefinisiFaraidPage({super.key});

  final List<String> content = const [
    'Dari sudut bahasa:\nKetentuan, sesuatu yang dibenarkan, keterangan dan kewajipan.',
    'Faraid satu bentuk mekanisme pengurusan harta keluarga.',
    'Faraid sebagai gentian keadilan dan perdamaian.',
    'Menurut istilah fuqaha:\nBahagian-bahagian perwarisan yang telah ditetapkan melalui nas untuk diagihkan kepada waris yang berhak.',
    'Faraid adalah lambang keutuhan ikatan keluarga Islam.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Definisi Faraid'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: content.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blue.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  content[index],
                  style: const TextStyle(fontSize: 16, height: 1.4),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}