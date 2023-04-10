import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnggotaPage extends StatelessWidget {
  const AnggotaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Daftar Anggota"),
          ),
        )
    );
  }
}
