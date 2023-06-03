import 'package:flutter/material.dart';

import '../main.dart';
import '../mainPage.dart';
class RunLibrary extends StatelessWidget {
  const RunLibrary({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(),}),

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
        body: LibraryPage(),
      ),
    );
  }
}
class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}
class _LibraryPageState extends State<LibraryPage>{
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10)
    );
  }

}