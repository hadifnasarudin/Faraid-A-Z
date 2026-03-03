import 'package:flutter/material.dart';

class MaksudHartaPusakaPage extends StatelessWidget {
  const MaksudHartaPusakaPage({super.key});

  static const Color primaryColor = Color(0xFF2E3192);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text("Maksud Harta Pusaka"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tekan setiap kad untuk melihat penerangan.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            _buildCard(context, "Maksud Harta Pusaka",
                "Harta pusaka ialah segala harta yang ditinggalkan oleh seseorang selepas kematiannya untuk diwarisi oleh waris yang layak."),

            _buildCard(context, "Jenis Harta",
                "Harta boleh terdiri daripada harta alih seperti wang, kenderaan dan perhiasan serta harta tidak alih seperti rumah dan tanah."),

            _buildCard(context, "Contoh Harta Pusaka",
                "Contoh harta pusaka termasuk rumah, tanah, simpanan bank, saham dan kenderaan milik si mati."),

            _buildCard(context, "Bukan Harta Pusaka",
                "Hutang si mati perlu diselesaikan terlebih dahulu sebelum pembahagian harta pusaka dibuat."),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        elevation: 4,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          onTap: () {
            _showBottomSheet(context, title, content);
          },
        ),
      ),
    );
  }

  void _showBottomSheet(
      BuildContext context, String title, String content) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}