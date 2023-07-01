import 'package:flutter/material.dart';
import 'package:moon/Pages/PDFViewer.dart';
import 'package:moon/Pages/book.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../mainPage.dart';

bool liked = false;

class BookPage extends StatelessWidget {
  late final Book book;
  BookPage({required this.book});
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
          primarySwatch: Colors.blueGrey,
        ),
        home: Scaffold(
          backgroundColor:
              darkMode ? Colors.blueGrey[800] : Colors.blueGrey[100],
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[900],
            title: Row(
              children: [
                IconButton(
                  alignment: Alignment.bottomLeft,
                  icon: Icon(Icons.keyboard_backspace),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 77,
                ),
                Image.asset(
                  'images/moon-logo.png',
                  fit: BoxFit.contain,
                  height: 37,
                ),
                SizedBox(
                  width: 77,
                ),
                IconButton(
                    alignment: Alignment.center,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => BookPage(book: book),
                          transitionDuration: Duration(milliseconds: 10),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                      liked = !liked;
                    },
                    icon: Icon(
                      liked ? Icons.favorite : Icons.favorite_border,
                      color: liked ? Colors.red : Colors.white,
                    ))
              ],
            ),
          ),
          body: ListView(
            children: [
              SafeArea(
                  child: Column(children: <Widget>[
                Container(
                  width: 350,
                  height: 350,
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: Image.asset(
                    book.image,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 300,
                  child: Divider(
                    thickness: 2,
                    color: Colors.blueGrey.shade400,
                  ),
                ),
                Text(
                  book.name,
                  style: TextStyle(
                      color: darkMode
                          ? Colors.blueGrey.shade50
                          : Colors.blueGrey.shade800,
                      fontSize: 36,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 29,
                    ),
                    Text(
                      book.rate.toString(),
                      style: TextStyle(
                          color: darkMode
                              ? Colors.blueGrey.shade50
                              : Colors.blueGrey.shade800,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  height: 60,
                  child: TextButton(
                    child: Text(
                      'Add to cart : ' + book.value.toString() + ' T',
                      style: TextStyle(
                          color: Colors.blueGrey.shade50, fontSize: 18),
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(10)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black54),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade500),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                    side: BorderSide(
                                        color: Colors.blueGrey.shade500)))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => PDFViewer(),
                          transitionDuration: Duration(milliseconds: 400),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                  ),
                ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blueGrey.shade200),
                      height: 200,
                      width: 400,
                      padding: EdgeInsets.fromLTRB(15, 10, 10, 0),

                      child: Text(
                        'Description :',
                        style: TextStyle(
                            color: darkMode
                                ? Colors.blueGrey.shade50
                                : Colors.blueGrey.shade800,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                SizedBox(
                  height: 30,
                  child: Divider(
                    thickness: 2,
                    color: Colors.blueGrey.shade400,
                  ),
                ),
                Text(
                  'Rate this book',
                  style: TextStyle(
                      color: darkMode
                          ? Colors.blueGrey.shade50
                          : Colors.blueGrey.shade800,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Comments:',
                        style: TextStyle(
                            color: darkMode
                                ? Colors.blueGrey.shade50
                                : Colors.blueGrey.shade800,
                            fontSize: 26,
                            fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        child: Text(
                          'Write a comment',
                          style: TextStyle(
                              color: Colors.blueGrey.shade50, fontSize: 14),
                        ),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(10)),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.black54),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueGrey.shade500),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                    side: BorderSide(
                                        color: Colors.blueGrey.shade900)))),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                    Container(
                      height: 400,
                    )
              ])),
            ],
          ),
        ));
  }
}
