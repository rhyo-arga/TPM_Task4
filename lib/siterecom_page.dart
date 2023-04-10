import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SitusPage extends StatefulWidget {
  const SitusPage({Key? key}) : super(key: key);

  @override
  State<SitusPage> createState() => _SitusPageState();
}

class _SitusPageState extends State<SitusPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Situs Rekomendasi"),
          ),
        )
    );
  }
}
