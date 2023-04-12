import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tpm_task4/data/situs.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Sites sites;
  const DetailPage({Key? key, required this.sites}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.sites.sitesName),
            actions: [
              IconButton(
                onPressed: () async {
                  final snackBar = SnackBar(
                    content: Text(
                      widget.sites.isFavorite
                          ? "Berhasil Dihapus dari Favorit"
                          : "Berhasil Ditambahkan Ke Favorit",
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {
                    widget.sites.isFavorite = !widget.sites.isFavorite;
                  });
                },
                icon: Icon(
                  widget.sites.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    child: Image.network(widget.sites.imageUrls, width: MediaQuery.of(context).size.width/2, height: MediaQuery.of(context).size.height/2,)
                ),
                Container(
                  child: Text(widget.sites.sitesName, style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.topLeft,
                  child: Text('Description', style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(widget.sites.description),
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: 40,
                  child: ElevatedButton( onPressed: () async {
                    _launchInBrowser('${widget.sites.sitesLink}');
                  },
                    child: Text('Pergi Ke Situs'),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  Future<void> _launchInBrowser(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $url');
    }
  }
}
