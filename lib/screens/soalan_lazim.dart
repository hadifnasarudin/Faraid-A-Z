import 'package:flutter/material.dart';

class SoalanLazimPage extends StatelessWidget {
  const SoalanLazimPage({super.key});

  final List<Map<String, String>> faqList = const [
    {
      'question': 'Harta apa yang boleh difaraidkan?',
      'answer': 'Semua harta milik si mati yang sah seperti rumah, tanah, wang tunai, saham dan kenderaan.'
    },
    {
      'question': 'Selepas saya meninggal dunia, siapa yang boleh memohon Perintah Faraid ke atas harta pusaka saya?',
      'answer': 'Waris sah seperti anak, isteri, ibu bapa atau sesiapa yang berkepentingan dalam harta pusaka.'
    },
    {
      'question': 'Siapakah yang layak untuk menerima harta pusaka saya?',
      'answer': 'Waris yang sah mengikut hukum faraid seperti anak lelaki, anak perempuan, isteri, ibu dan bapa.'
    },
    {
      'question': 'Saya telah menganut agama Islam dan ibu bapa saya masih belum memeluk Islam. Adakah mereka akan mewarisi harta pusaka saya?',
      'answer': 'Tidak. Perbezaan agama menjadi halangan dalam hukum faraid.'
    },
    {
      'question': 'Saya telah bercerai dengan isteri saya, adakah bekas isteri saya masih boleh menuntut hak ke atas harta pusaka saya selepas kematian saya?',
      'answer': 'Tidak, kecuali jika masih dalam tempoh iddah dan tiada halangan lain.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Soalan Lazim'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          final item = faqList[index];
          return Card(
            color: Colors.blue.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(item['question']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.keyboard_arrow_up),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.75,
                    minChildSize: 0.5,
                    maxChildSize: 0.95,
                    builder: (context, scrollController) => SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: 40,
                                height: 4,
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                item['question']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              item['answer']!,
                              style: const TextStyle(fontSize: 16, height: 1.4),
                            ),
                            const SizedBox(height: 24),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Tutup'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}