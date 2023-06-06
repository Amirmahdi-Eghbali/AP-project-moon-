import 'package:flutter/material.dart';

import '../main.dart';
import '../mainPage.dart';
import 'book.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(text: 'EBook'),
    Tab(text: 'Audio book'),
  ];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor:
                darkMode ? Colors.blueGrey[800] : Colors.blueGrey[100],
            body: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.fromLTRB(16, 18, 16, 15),
                children: [
                  Text(
                    'Continue reading :',
                    style: TextStyle(fontSize: 26,
                    color: darkMode
                        ? Colors.blueGrey.shade100
                        : Colors.blueGrey.shade800,),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                      color: darkMode
                          ? Colors.blueGrey.shade800
                          : Colors.blueGrey.shade100,
                      height: 220,
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                        Row(children: [
                          for (Book book in books)
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => RunLog(),
                                      transitionDuration:
                                          Duration(milliseconds: 400),
                                      transitionsBuilder: (_, a, __, c) =>
                                          FadeTransition(opacity: a, child: c),
                                    ),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),

                                  color: darkMode
                                      ? Colors.blueGrey.shade700
                                      : Colors.blueGrey.shade600,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        book.image,
                                        height: 160,
                                      ),
                                      Text(
                                        book.name,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: darkMode
                                                ? Colors.blueGrey.shade100
                                                : Colors.blueGrey.shade50),
                                      ),

                                    ],
                                  ),
                                ))
                        ])
                      ])
                  ),
                  SizedBox(
                    height: 15,
                  ),








                    TabBar(
                      labelColor: darkMode? Colors.blueGrey.shade50:Colors.blueGrey.shade800,
                      controller: _tabController,
                      tabs: tabs,
                      unselectedLabelColor: darkMode? Colors.blueGrey.shade500:Colors.blueGrey.shade300,
                    ),
            Container(

                height: 840,
                  child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[


                    Column(
                      children: [
                        Text(
                        'Favorite ',
                          style: TextStyle(fontSize: 26,
                            color: darkMode
                                ? Colors.blueGrey.shade100
                                : Colors.blueGrey.shade800,),
                    ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                    color: darkMode
                        ? Colors.blueGrey.shade800
                        : Colors.blueGrey.shade100,
                    height: 240,
                    child: ListView(scrollDirection: Axis.horizontal, children: [
                      Row(children: [
                        for (Book book in books)
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => RunLog(),
                                    transitionDuration:
                                    Duration(milliseconds: 400),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(opacity: a, child: c),
                                  ),
                                );
                              },
                              child: Card(

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),

                                color: darkMode
                                    ? Colors.blueGrey.shade700
                                    : Colors.blueGrey.shade600,
                                // margin: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      book.image,
                                      height: 160,
                                    ),
                                    Icon(
                                      Icons.menu_book,
                                      color: Colors.white,

                                    ),
                                    Text(
                                      book.name,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: darkMode
                                              ? Colors.blueGrey.shade100
                                              : Colors.blueGrey.shade50),
                                    ),

                                  ],
                                ),
                              ))
                      ])
                    ])),
                        Text(
                          'Top selling',
                          style: TextStyle(fontSize: 26,
                            color: darkMode
                                ? Colors.blueGrey.shade100
                                : Colors.blueGrey.shade800,),                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                            color: darkMode
                                ? Colors.blueGrey.shade800
                                : Colors.blueGrey.shade100,
                            height: 240,
                            child: ListView(scrollDirection: Axis.horizontal, children: [
                              Row(children: [
                                for (Book book in books)
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) => RunLog(),
                                            transitionDuration:
                                            Duration(milliseconds: 400),
                                            transitionsBuilder: (_, a, __, c) =>
                                                FadeTransition(opacity: a, child: c),
                                          ),
                                        );
                                      },
                                      child: Card(

                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),

                                        color: darkMode
                                            ? Colors.blueGrey.shade700
                                            : Colors.blueGrey.shade600,
                                        // margin: EdgeInsets.all(16),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              book.image,
                                              height: 160,
                                            ),
                                            Icon(
                                                Icons.menu_book,
                                              color: Colors.white,

                                            ),
                                            Text(
                                              book.name,
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: darkMode
                                                      ? Colors.blueGrey.shade100
                                                      : Colors.blueGrey.shade50),
                                            ),

                                          ],
                                        ),
                                      ))
                              ])
                            ])),
                        Text(
                          'New release',
                          style: TextStyle(fontSize: 26,
                            color: darkMode
                                ? Colors.blueGrey.shade100
                                : Colors.blueGrey.shade800,),                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                            color: darkMode
                                ? Colors.blueGrey.shade800
                                : Colors.blueGrey.shade100,
                            height: 240,
                            child: ListView(scrollDirection: Axis.horizontal, children: [
                              Row(children: [
                                for (Book book in books)
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) => RunLog(),
                                            transitionDuration:
                                            Duration(milliseconds: 400),
                                            transitionsBuilder: (_, a, __, c) =>
                                                FadeTransition(opacity: a, child: c),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),

                                        color: darkMode
                                            ? Colors.blueGrey.shade700
                                            : Colors.blueGrey.shade600,
                                        // margin: EdgeInsets.all(16),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              book.image,
                                              height: 160,
                                            ),
                                            Icon(
                                                Icons.menu_book,
                                              color: Colors.white,

                                            ),
                                            Text(
                                              book.name,
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: darkMode
                                                      ? Colors.blueGrey.shade100
                                                      : Colors.blueGrey.shade50),
                                            ),

                                          ],
                                        ),
                                      ))
                              ])
                            ]))]),
                        Column(
                            children: [
                              Text(
                                'Favorite ',
                                style: TextStyle(fontSize: 26,
                                  color: darkMode
                                      ? Colors.blueGrey.shade100
                                      : Colors.blueGrey.shade800,),                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                  color: darkMode
                                      ? Colors.blueGrey.shade800
                                      : Colors.blueGrey.shade100,
                                  height: 240,
                                  child: ListView(scrollDirection: Axis.horizontal, children: [
                                    Row(children: [
                                      for (Book book in books)
                                        InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (_, __, ___) => RunLog(),
                                                  transitionDuration:
                                                  Duration(milliseconds: 400),
                                                  transitionsBuilder: (_, a, __, c) =>
                                                      FadeTransition(opacity: a, child: c),
                                                ),
                                              );
                                            },
                                            child: Card(

                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),

                                              color: darkMode
                                                  ? Colors.blueGrey.shade700
                                                  : Colors.blueGrey.shade600,
                                              // margin: EdgeInsets.all(16),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: [
                                                  Image.asset(
                                                    book.image,
                                                    height: 160,
                                                  ),
                                                  Icon(
                                                      Icons.headset,
                                                    color: Colors.white,

                                                  ),
                                                  Text(
                                                    book.name,
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        color: darkMode
                                                            ? Colors.blueGrey.shade100
                                                            : Colors.blueGrey.shade50),
                                                  ),

                                                ],
                                              ),
                                            ))
                                    ])
                                  ])),
                              Text(
                                'Top selling',
                                style: TextStyle(fontSize: 26,
                                  color: darkMode
                                      ? Colors.blueGrey.shade100
                                      : Colors.blueGrey.shade800,),                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                  color: darkMode
                                      ? Colors.blueGrey.shade800
                                      : Colors.blueGrey.shade100,
                                  height: 240,
                                  child: ListView(scrollDirection: Axis.horizontal, children: [
                                    Row(children: [
                                      for (Book book in books)
                                        InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (_, __, ___) => RunLog(),
                                                  transitionDuration:
                                                  Duration(milliseconds: 400),
                                                  transitionsBuilder: (_, a, __, c) =>
                                                      FadeTransition(opacity: a, child: c),
                                                ),
                                              );
                                            },
                                            child: Card(

                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),

                                              color: darkMode
                                                  ? Colors.blueGrey.shade700
                                                  : Colors.blueGrey.shade600,
                                              // margin: EdgeInsets.all(16),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: [
                                                  Image.asset(
                                                    book.image,
                                                    height: 160,
                                                  ),
                                                  Icon(
                                                    Icons.headset,
                                                    color: Colors.white,

                                                  ),
                                                  Text(
                                                    book.name,
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        color: darkMode
                                                            ? Colors.blueGrey.shade100
                                                            : Colors.blueGrey.shade50),
                                                  ),

                                                ],
                                              ),
                                            ))
                                    ])
                                  ])),
                              Text(
                                'New release',
                                style: TextStyle(fontSize: 26,
                                  color: darkMode
                                      ? Colors.blueGrey.shade100
                                      : Colors.blueGrey.shade800,),                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                  color: darkMode
                                      ? Colors.blueGrey.shade800
                                      : Colors.blueGrey.shade100,
                                  height: 240,
                                  child: ListView(scrollDirection: Axis.horizontal, children: [
                                    Row(children: [
                                      for (Book book in books)
                                        InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (_, __, ___) => RunLog(),
                                                  transitionDuration:
                                                  Duration(milliseconds: 400),
                                                  transitionsBuilder: (_, a, __, c) =>
                                                      FadeTransition(opacity: a, child: c),
                                                ),
                                              );
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),

                                              color: darkMode
                                                  ? Colors.blueGrey.shade700
                                                  : Colors.blueGrey.shade600,
                                              // margin: EdgeInsets.all(16),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: [
                                                  Image.asset(
                                                    book.image,
                                                    height: 160,
                                                  ),
                                                  Icon(
                                                    Icons.headset,
                                                    color: Colors.white,

                                                  ),
                                                  Text(
                                                    book.name,
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        color: darkMode
                                                            ? Colors.blueGrey.shade100
                                                            : Colors.blueGrey.shade50),
                                                  ),

                                                ],
                                              ),
                                            ))
                                    ])
                                  ]))])],
                  ),
            )

                ])));
  }
}
