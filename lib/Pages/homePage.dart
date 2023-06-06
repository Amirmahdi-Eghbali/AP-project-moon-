import 'package:flutter/material.dart';

import '../main.dart';
import '../mainPage.dart';
import 'book.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    style: TextStyle(
                      fontSize: 30
                    ),
                  ),
                  Container(
                    color: Colors.blueGrey.shade300,
                    height: 200,
                      child:
                          ListView(scrollDirection: Axis.horizontal,
                              children: [
                                Row(
                                  children: [
                    for (Book book in books)
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => RunLog(),
                              transitionDuration: Duration(milliseconds: 400),
                              transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                            ),

                          );
                        },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),

                        color: darkMode ? Colors.blueGrey.shade100
                            : Colors.blueGrey.shade500,
                        // margin: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [Image.asset(book.image,
                          height: 140,),
                            Text(
                              book.name,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: darkMode
                                      ? Colors.blueGrey.shade50
                                      : Colors.blueGrey.shade800),
                            ),

                          ],
                        ),
                      ))])
                  ]))
                ])));
  }
}
