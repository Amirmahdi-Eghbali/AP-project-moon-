import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moon/Pages/accountPage.dart';
import 'package:moon/Pages/homePage.dart';
import 'package:moon/Pages/libraryPage.dart';
import 'package:moon/Pages/shopPage.dart';
import 'main.dart';

class RunMain extends StatelessWidget {
  const RunMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/moon-logo.png',
                fit: BoxFit.contain,
                height: 37,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
              )
            ],
          ),
        ),
        body: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

  bool darkMode = false;
class _MainPageState extends State<MainPage> {



  final List<Widget> _pages = <Widget>[
    HomePage(),
    LibraryPage(),
    ShopPage(),
    AccountPage(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkMode ? Colors.blueGrey[900] : Colors.blueGrey[100],
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
            color: Colors.blueGrey.shade900,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: GNav(
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                    darkMode = toggleValue;
                  });
                },
                gap: 8,
                padding: EdgeInsets.all(12),
                backgroundColor: Colors.blueGrey.shade900,
                color: Colors.blueGrey[100],
                activeColor: Colors.blueGrey[100],
                tabBackgroundColor: Colors.blueGrey.shade700,
                tabs: [
                  GButton(
                    icon: Icons.home_sharp,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.library_books,
                    text: 'Library',
                  ),
                  GButton(
                    icon: Icons.shop_two,
                    text: 'Shop',
                  ),
                  GButton(
                    icon: Icons.account_circle,
                    text: 'Account',
                  ),
                ],
              ),
            )));
  }
}
