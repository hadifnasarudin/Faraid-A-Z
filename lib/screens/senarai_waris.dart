import 'package:flutter/material.dart';

class SenaraiWarisPage extends StatefulWidget {
  const SenaraiWarisPage({super.key});

  @override
  State<SenaraiWarisPage> createState() => _SenaraiWarisPageState();
}

class _SenaraiWarisPageState extends State<SenaraiWarisPage> {
  String selectedTab = 'Waris lelaki';

  final List<Map<String, String>> warisLelaki = const [
    {'title': 'Anak lelaki', 'description': 'Mewarisi secara penuh jika tiada penghalang.'},
    {'title': 'Cucu lelaki (anak kepada anak lelaki)', 'description': 'Mewarisi jika anak lelaki tiada.'},
    {'title': 'Bapa', 'description': 'Mewarisi secara tetap dan boleh jadi asabah.'},
    {'title': 'Datuk', 'description': 'Mewarisi jika bapa tiada.'},
  ];

  final List<Map<String, String>> warisPerempuan = const [
    {'title': 'Anak perempuan', 'description': 'Mewarisi separuh jika bersendirian.'},
    {'title': 'Cucu perempuan (anak kepada anak lelaki)', 'description': 'Mewarisi jika anak perempuan tiada.'},
    {'title': 'Ibu', 'description': 'Mewarisi satu perenam atau satu pertiga bergantung keadaan.'},
    {'title': 'Nenek sebelah ibu', 'description': 'Mewarisi jika ibu tiada dan tiada penghalang.'},
  ];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> currentList =
        selectedTab == 'Waris lelaki' ? warisLelaki : warisPerempuan;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Senarai Waris Pusaka'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: const Text(
              'Senarai waris yang layak menerima harta pusaka mengikut hukum faraid.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSelector('Waris lelaki'),
              const SizedBox(width: 12),
              _buildSelector('Waris perempuan'),
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