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
          body: Container(
            height: double.infinity,
            padding: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  child: Container(
                    height: 230,
                    width: 350,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: 130,
                            child: Image.asset('/images/rhyoargasiwi.jpg'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Nama : Rhyo Argasiwi',
                              style: TextStyle(fontSize: 14),
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'NIM  : 123200059',
                              style: TextStyle(fontSize: 14),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  child: Container(
                    height: 230,
                    width: 350,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: 130,
                            child: Image.asset('/images/alfa.jpg'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Nama : Alfa Aditya W.',
                              style: TextStyle(fontSize: 14),
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'NIM  : 123200094',
                              style: TextStyle(fontSize: 14),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
