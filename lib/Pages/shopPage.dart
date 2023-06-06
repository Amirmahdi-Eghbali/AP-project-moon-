import 'package:flutter/material.dart';
import 'package:moon/Pages/book.dart';

import '../main.dart';
import '../mainPage.dart';

int bookID = 0;

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

const List<String> list = <String>['Top rated', 'Cheapest', 'Most expensive'];
String dropdownValue = list.first;

class _ShopPageState extends State<ShopPage> {
  TextEditingController searcher = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor:
              darkMode ? Colors.blueGrey[800] : Colors.blueGrey[100],
          body: ListView(
            children: <Widget>[
              Container(
                height: 55,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueGrey.shade200),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: searcher,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search here',
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.table_rows_rounded),
                  elevation: 10,
                  style: TextStyle(
                      color: darkMode
                          ? Colors.blueGrey.shade100
                          : Colors.blueGrey.shade600),
                  underline: Container(
                    height: 2,
                    color: darkMode
                        ? Colors.blueGrey.shade100
                        : Colors.blueGrey.shade600,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                color: darkMode
                    ? Colors.blueGrey.shade500
                    : Colors.blueGrey.shade300 ,
                padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (Book book in books)
                        Column(children: [
                          InkWell(
                            onTap: () {

                            },

                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                color:darkMode
                                    ? Colors.blueGrey.shade700
                                    : Colors.blueGrey.shade100 ,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                  Image.asset(
                                    book.image,

                                    height: 100,
                                    alignment: Alignment.bottomLeft,
                                  ),
                                  Text(

                                    book.name,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: darkMode
                                            ? Colors.blueGrey.shade50
                                            : Colors.blueGrey.shade800),
                                  ),
                                ],
                              )),
                            ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ]),
                    ]),
              ),
            ],
          ),
        ));
  }
}
