import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tpm_task4/data/situs.dart';
import 'package:tpm_task4/pages/detail_situs.dart';
import 'package:url_launcher/url_launcher.dart';


class SitusPage extends StatefulWidget {
  final Sites sites;
  const SitusPage({Key? key, required this.sites}) : super(key: key);

  @override
  State<SitusPage> createState() => _SitusPageState();
}

class _SitusPageState extends State<SitusPage> {
  String get url => widget.sites.sitesLink;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Situs Rekomendasi"),
          ),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index){
              final Sites sites = listSites[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(sites: sites)
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      child: Column(
                        children: [
                          Image.network(sites.imageUrls, width: 200, height: 200,),
                          Text(sites.sitesName)
                        ],
                      )

                  ),
                ),
              );
            },
            itemCount: listSites.length,

          ),
        )
    );
  }
}
