import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<bool> _onWillPop(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Keluar Aplikasi"),
            content: const Text("Apakah Anda yakin ingin keluar?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                // Batal keluar
                child: const Text("Tidak"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                // Keluar aplikasi
                child: const Text("Ya"),
              ),
            ],
          ),
        ) ??
        false; // Jika dialog ditutup tanpa memilih, kembalikan false
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      // Panggil fungsi dengan Future<bool>
      child: Scaffold(
        body: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            // Tambahkan padding agar lebih rapi
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.indigo[800]!, Colors.indigo[700]!]),
            ),
            child: Column(
              // Posisi ke tengah
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Datang",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 8), // Jarak antar teks
                Text(
                  "Di Aplikasi Absensi",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                Expanded(
                  child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                        crossAxisSpacing: 25,
                        mainAxisSpacing: 25,
                      ),
                      children: [
                        _buildCard(
                          context,
                          title: 'attend',
                          icon: Icons.calendar_month,
                          color: Colors.indigo[800]!,
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                        ),
                        _buildCard(
                          context,
                          title: 'absence',
                          icon: Icons.sick,
                          color: Colors.indigo[800]!,
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                        ),
                        _buildCard(
                          context,
                          title: 'history',
                          icon: Icons.history,
                          color: Colors.indigo[800]!,
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                        ),
                        _buildCard(
                          context,
                          title: 'Logout',
                          icon: Icons.logout,
                          color: Colors.indigo[800]!,
                          onTap: () async {
                            final bool shouldPop = await _onWillPop(context);
                            if (shouldPop) {
                              Navigator.of(context).pop<bool>(true);
                            }
                          },
                        ),
                      ]),
                ),
              ],
            )),
      ),
    );
  }
}

Widget _buildCard(
  BuildContext context, {
  required String title,
  required IconData icon,
  required Color color,
  required VoidCallback? onTap,
}) {
  return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              title!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ])));
}
