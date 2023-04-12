import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tpm_task4/data/situs.dart';
import 'package:tpm_task4/pages/detail_situs.dart';

class FavoritPage extends StatefulWidget {
  final Sites sites;
  const FavoritPage({Key? key, required this.sites}) : super(key: key);

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
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index){
              List list = listSites.where((element) => element.isFavorite == true).toList();
              Sites sites = list[index];
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
            itemCount: listSites.where((element) => element.isFavorite == true).toList().length,

          ),
        )
    );
  }
}
