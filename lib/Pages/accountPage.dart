import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../mainPage.dart';
bool toggleValue = false;

class RunAccount extends StatelessWidget {
  const RunAccount({Key? key}) : super(key: key);
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
        body: AccountPage(),
      ),
    );
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: AnimatedContainer(
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
    );
  }
  toggleButton(){
     setState(() {
      toggleValue=!toggleValue;
      darkMode=toggleValue;
    });
  }
}
