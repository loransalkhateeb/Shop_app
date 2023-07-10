import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/banner_images_prov.dart';
import 'men_page.dart';
class main_secreen extends StatefulWidget {

  const main_secreen({Key? key}) : super(key: key);

  @override
  State<main_secreen> createState() => _main_secreenState();
}

class _main_secreenState extends State<main_secreen> {
  int current_index=0;
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          fixedColor: Color(0xffEC4156),
          currentIndex: current_index,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              current_index = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favoutite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart')
          ],
        ),
        backgroundColor: Color(0xff272727),
        appBar: AppBar(
          backgroundColor: Color(0xff272727),
          bottom: TabBar(
              indicatorColor: Color(0xffEC4156),
              indicatorPadding: EdgeInsets.only(left: 40,right: 40),
              tabs: [
                Tab(
                  child: Text(
                    "Men",
                    style: TextStyle(
                        fontWeight: FontWeight.w900
                        ,color: Colors.white, fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    "Women",
                    style: TextStyle(
                        fontWeight: FontWeight.w900
                        ,color: Colors.white, fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    "Kids",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                )
              ]),
          toolbarHeight: 180,
          leadingWidth: 100,
          leading: Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Image(image: AssetImage("images/img2.png")),
                SizedBox(
                  height: 37,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "SHOP",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),

              ],
            ),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 30, bottom: 40),
                child: Icon(
                  Icons.search,
                  size: 40,
                  color: Colors.white,
                ))
          ],
          elevation: 0,
        ),
        body:
        TabBarView(
          children: [
            men_page();
          ],
        ),
      ),
    );
  }
}
