import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '';

import '../main.dart';
import '../mainPage.dart';
import '../signUpPage.dart';
bool toggleValue = false;



class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();

}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home : Scaffold(
        backgroundColor: darkMode ? Colors.blueGrey[800] : Colors.blueGrey[100],
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),

          child: CircleAvatar(

              radius: 70,
            backgroundImage: AssetImage('images/iron-man.jpg'),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                userName,
                style: TextStyle(
                    color: darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )),
          SizedBox(
            height: 20,
            width: 300,
            child: Divider(
              thickness: 1,
              color: Colors.blueGrey.shade400,
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(15, 15, 20, 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'First name :',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],
                          fontWeight: FontWeight.w500,
                          fontSize: 22),
                    ),
                    Text('Amirmahdi',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],
                            fontWeight: FontWeight.w500,
                            fontSize: 22)),
                  ])),
          Container(
              padding: EdgeInsets.fromLTRB(15, 15, 20, 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Last name :',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],
                          fontWeight: FontWeight.w500,
                          fontSize: 22),
                    ),
                    Text('Eghbali',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],
                            fontWeight: FontWeight.w500,
                            fontSize: 22)),
                  ])),
          Container(
              padding: EdgeInsets.fromLTRB(15, 15, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                'Balance :',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
                  Text('20000 IR',
                  textAlign: TextAlign.right,
                      style: TextStyle(
                          color: darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],
                          fontWeight: FontWeight.w500,
                          fontSize: 22)),
          ])),

          Container(
              padding: EdgeInsets.fromLTRB(15, 10, 20, 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Theme mode:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],
                          fontWeight: FontWeight.w500,
                          fontSize: 22),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey.shade600,strokeAlign:1),
                          borderRadius: BorderRadius.circular(20),
                          color: toggleValue
                              ? Colors.blueGrey.shade100
                              : Colors.blueGrey.shade900
                      ),
                      child: Stack(
                        children: <Widget>[
                          AnimatedPositioned(
                            child: InkWell(
                              onTap: toggleButton,
                              child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 400),
                                  transitionBuilder: (Widget child,Animation<double> animation){
                                    return ScaleTransition(child: child ,scale: animation);
                                  },
                                  child: toggleValue ? Icon((CupertinoIcons.moon_fill),color: Colors.blueGrey.shade900,size: 35
                                      ,key: UniqueKey()
                                  ):
                                  Icon((CupertinoIcons.sun_max_fill),color: Colors.blueGrey.shade100,size: 35,
                                  )
                              ),
                            ),
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                            top: 3,
                            left: toggleValue ? 60 : 0,
                            right: toggleValue ? 0 : 60,
                          )
                        ],
                      ),
                    ),
                  ])),
          Container(
            child: TextButton(
              style: TextButton.styleFrom(shadowColor: Colors.black,),
              onPressed: () {
                //forgot password screen
              },
              child: Text(
                'Change information',
                style: TextStyle(
                  fontSize: 15,
                  color: darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],

                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(15, 0, 20, 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        width: 150,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(20, 15, 10, 0),
                        child: TextButton(
                          child: Text('Increase credit',
                            style: TextStyle(
                                color: Colors.blueGrey.shade50,
                                fontSize: 16
                            ),),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(10)),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black54),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueGrey.shade500),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.0),
                                      side: BorderSide(
                                          color: Colors.blueGrey.shade300)))),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => RunLog(),
                                transitionDuration: Duration(milliseconds: 400),
                                transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                              ),

                            );
                          },
                        )),
                    Container(
                        width: 150,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(10, 15, 20, 0),
                        child: TextButton(

                          child: Text('premium',
                            style: TextStyle(
                                color: Colors.blueGrey.shade50,
                                fontSize: 18,

                            ),),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(10)),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black54),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueGrey.shade500),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.0),
                                      side: BorderSide(
                                          color: Colors.blueGrey.shade300)))),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => RunLog(),
                                transitionDuration: Duration(milliseconds: 400),
                                transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                              ),

                            );
                          },
                        )),
                  ])),
          Container(
              width: 350,
              height: 50,
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextButton(
                child: Text('Sign out',
                  style: TextStyle(
                      color: darkMode? Colors.blueGrey.shade50 : Colors.blueGrey.shade800,
                      fontSize: 18,
                  ),),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(10)),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black54),
                    backgroundColor: darkMode? MaterialStateProperty.all<Color>(
                        Colors.blueGrey.shade800) :
                    MaterialStateProperty.all<Color>(
                        Colors.blueGrey.shade100),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                            side: BorderSide(
                                color: Colors.blueGrey.shade500)))),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => RunLog(),
                      transitionDuration: Duration(milliseconds: 400),
                      transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                    ),

                  );
                },
              )),
        ],
      ),
    )
    )
    );
  }
  toggleButton(){
     setState(() {
      toggleValue=!toggleValue;
      darkMode=toggleValue;

     });
  }
}
