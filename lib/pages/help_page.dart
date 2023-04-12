import 'package:flutter/material.dart';

class BantuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bantuan"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pada bagian halaman utama terdapat 4 menu yaitu:"),
                Text("- Menu pertama berisikan nama, foto, dan NIM masing-masing anggota"),
                Text("- Menu yang kedua yaitu stopwatch"),
                Text("- Menu yang ketiga berisikan daftar situs rekomendasi yang dilengkapi gambar dan link "),
                Text("- Menu yang terakhir adalah favorite"),
                SizedBox(height: 15,),
                Text("Di bagian bawah pada halaman utaman, terdapat Navigation Bar yang berisi:"),
                Text("- Home Page"),
                Text("- Bantuan"),
                Text("- Log Out"),
              ],
            ),

          )
        ],
      ),
    );
  }
}
