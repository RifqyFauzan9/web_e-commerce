import 'package:flutter/material.dart';

class BannerDiscountHome extends StatelessWidget {
  const BannerDiscountHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Margin di sekitar banner
      child: Stack(
        clipBehavior: Clip.none, // Memungkinkan overflow
        children: [
          // Background container
          Container(
            decoration: BoxDecoration(
              color: Colors.green, // Warna hijau latar belakang
              borderRadius: BorderRadius.circular(20), // Sudut melengkung
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            child: Row(
              children: [
                // Bagian kiri (teks)
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Clearance Sales",
                        style: TextStyle(
                          fontSize: 30, // Ukuran teks besar
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Warna teks putih
                        ),
                      ),
                      const SizedBox(height: 15), // Spasi antara teks
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white, // Latar belakang putih
                          borderRadius:
                              BorderRadius.circular(50), // Sudut melengkung
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.percent,
                              color: Colors.green, // Ikon hijau
                              size: 22,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Up to 50%",
                              style: TextStyle(
                                fontSize: 20, // Ukuran teks kecil
                                color: Colors.green, // Warna teks hijau
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Spacer untuk memisahkan teks dan gambar
                const Expanded(
                  flex: 1,
                  child: SizedBox(), // Placeholder kosong di dalam container
                ),
              ],
            ),
          ),
          // Bagian gambar (overflow)
          Positioned(
            top: -12, // Membuat gambar overflow ke atas
            right: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(20)),
              child: Image.asset(
                'assets/images/iphone.png', // Gambar asset
                height: 186, // Ukuran gambar
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
