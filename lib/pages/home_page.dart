import 'package:flutter/material.dart';
import 'package:tpm_task4/data/situs.dart';
import 'package:tpm_task4/pages/favorite_page.dart';
import 'package:tpm_task4/pages/help_page.dart';
import 'package:tpm_task4/pages/login_page.dart';
import 'package:tpm_task4/pages/memberlist_page.dart';
import 'package:tpm_task4/pages/siterecom_page.dart';
import 'package:tpm_task4/pages/stopwatch_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home_Page(), BantuanPage(), const Log_Out(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index == 2){
        logout(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Bantuan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Log Out',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final Sites sites = listSites[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home Page"),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AnggotaPage()
                          ));
                    },
                    child: Text("Daftar Anggota",
                    style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StopwatchPage()
                          ));
                    },
                    child: Text("Stopwatch",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SitusPage(sites:sites)
                          ));
                    },
                    child: Text("Situs Rekomendasi",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FavoritPage(sites: sites)
                          ));
                    },
                    child: Text("Favorit",
                      style: TextStyle(fontSize: 20),
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

class Log_Out extends StatefulWidget {
  const Log_Out({Key? key}) : super(key: key);

  @override
  State<Log_Out> createState() => _Log_OutState();
}

class _Log_OutState extends State<Log_Out> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

void logout(context){
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => LoginPage()
      ));
}
