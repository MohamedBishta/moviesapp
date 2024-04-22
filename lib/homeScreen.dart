import 'package:flutter/material.dart';
import 'Home/home_page.dart';
import 'Movies/movies_screen.dart';
import 'Search/search_screen.dart';
import 'Theme/mytheme.dart';
import 'WatchList/watchlist_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  

  List<Widget> tabs =[
    HomePage(),
    SearchPage(),
    MoviesPage(),
    WatchlistPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      bottomNavigationBar:
         Theme(
           data: Theme.of(context)
               .copyWith(canvasColor: MyTheme.bottomColor),
           child: BottomNavigationBar(
             currentIndex: selectedindex,
             onTap: (index) {
               selectedindex = index;
               setState(() {});
             },
            selectedItemColor: MyTheme.lightYellowColor,
             type: BottomNavigationBarType.fixed,
             unselectedItemColor: MyTheme.offWhiteColor,
             unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
             items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home,size: 30,),
                  label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search,size: 30),
                label: 'Search'),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie,size: 30),
                label: 'Movies',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt,size: 30),
                label: 'WatchList',
              ),
            ],
        ),
         ),
      body: tabs[selectedindex],
    );
  }
}
