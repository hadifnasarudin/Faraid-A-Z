import 'package:flutter/material.dart';

class SebabFaraidPage extends StatefulWidget {
  const SebabFaraidPage({super.key});

  @override
  State<SebabFaraidPage> createState() => _SebabFaraidPageState();
}

class _SebabFaraidPageState extends State<SebabFaraidPage> {
  String selectedTab = 'Sebab';

  final List<Map<String, String>> sebabList = const [
    {'title': 'Al-Qarabah (Keturunan)', 'description': 'Hubungan darah seperti anak, cucu, ibu, bapa.'},
    {'title': 'Al-Zawjiyyah (Perkahwinan)', 'description': 'Hubungan perkahwinan seperti suami dan isteri.'},
    {'title': 'Al-Wala\' (Penguasaan)', 'description': 'Hubungan perlindungan seperti bekas hamba.'},
  ];

  final List<Map<String, String>> halanganList = const [
    {'title': 'Perbezaan agama', 'description': 'Waris bukan Islam tidak mewarisi harta pewaris Muslim.'},
    {'title': 'Hamba', 'description': 'Hamba tidak mewarisi harta pusaka.'},
    {'title': 'Pembunuhan terhadap pewaris', 'description': 'Waris yang membunuh pewaris hilang hak pusaka.'},
  ];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> currentList =
        selectedTab == 'Sebab' ? sebabList : halanganList;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Sebab Faraid'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: const Text(
              'Faktor yang menentukan kelayakan waris dan halangan yang membatalkan hak pusaka.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSelector('Sebab'),
              const SizedBox(width: 12),
              _buildSelector('Halangan'),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: currentList.length,
              itemBuilder: (context, index) {
                final item = currentList[index];
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
              child: const Text('OK', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelector(String label) {
    final bool isSelected = selectedTab == label;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}