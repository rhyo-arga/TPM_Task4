import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({Key? key}) : super(key: key);

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Favorit"),
          ),
        )
    );
  }
}