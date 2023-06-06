import 'package:flutter/material.dart';

import '../main.dart';
import '../mainPage.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}
class _LibraryPageState extends State<LibraryPage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home : Scaffold(
            backgroundColor: darkMode ? Colors.blueGrey[800] : Colors.blueGrey[100],
            body: Padding(
              padding: EdgeInsets.all(10),
            )
        )
    );
  }

}