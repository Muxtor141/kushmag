import 'package:flutter/material.dart';

import '../main pages/actives/actives_orders_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    var appBar = AppBar();
    return Scaffold(
      body: ActiveActions(),
      bottomNavigationBar: Container(
        height: (sizeQuery.height -
           appBar.preferredSize.height -
            MediaQuery.of(context).padding.top- MediaQuery.of(context).padding.bottom) * 0.12,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.airplay_sharp), label: 'Aktivlar'),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_done_sharp),
              label: 'Bajarilganlar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete_sweep_outlined),
              label: 'Bajarilmaganlar',
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          onTap: onItemSelected,
        ),
      ),
    );
  }
}
