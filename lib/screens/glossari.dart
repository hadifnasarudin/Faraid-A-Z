import 'package:flutter/material.dart';

class GlosariPage extends StatelessWidget {
  const GlosariPage({super.key});

  final List<Map<String, String>> glosariList = const [
    {
      'title': 'Faraid',
      'description': 'Undang-undang Islam yang mengawal pembahagian pusaka.'
    },
    {
      'title': 'Harta pusaka',
      'description': 'Harta yang ditinggalkan oleh si mati untuk diagihkan kepada waris.'
    },
    {
      'title': 'Waris',
      'description': 'Seseorang yang berhak menerima pusaka secara sah.'
    },
    {
      'title': 'Si mati',
      'description': 'Seseorang yang telah meninggal dunia dan meninggalkan harta pusaka.'
    },
    {
      'title': 'Zawil furud',
      'description': 'Waris yang berhak mendapat bahagian tetap seperti yang ditetapkan dalam undang-undang Islam.'
    },
    {
      'title': 'Asabah',
      'description': 'Waris yang menerima baki harta pusaka selepas bahagian tetap diagihkan.'
    },
    {
      'title': 'Asabah Ma\'al Ghairi',
      'description': 'Waris wanita yang menjadi Asabah apabila ditemani oleh waris lelaki tertentu.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Glosari'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: glosariList.length,
        itemBuilder: (context, index) {
          final item = glosariList[index];
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
    );
  }
}