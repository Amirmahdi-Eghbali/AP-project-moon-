import 'package:flutter/material.dart';
import 'package:moon/signUpPage.dart';

import 'mainPage.dart';
void main() => runApp(const RunLog());
bool dMode=false;
class RunLog extends StatelessWidget {
  const RunLog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(),}),

        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        backgroundColor: darkMode ? Colors.blueGrey[900] : Colors.blueGrey[100],
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
        body: SingleChildScrollView(child: LoginPage()),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  'moon liberary',
                  style: TextStyle(
                      color: darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 25,
                    color: darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],
                  ),
                )),
            Container(
              height: 65,
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueGrey.shade200),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: userNameController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'User Name',
                    hintText: 'Enter your ID'),
              ),
            ),
            Container(
              height: 65,
              padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
              margin: EdgeInsets.symmetric(vertical: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueGrey.shade200),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.blueGrey[900],
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(138, 0, 138, 0),
              child: TextButton(
                style: TextButton.styleFrom(shadowColor: Colors.black),
                onPressed: () {
                  //forgot password screen
                },
                child: Text(
                  'Forgot Password!',
                  style: TextStyle(
                    color: darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],

                  ),
                ),
              ),
            ),
            Container(
                width: 350,
                height: 50,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextButton(
                  child: Text(
                    'Login',
                    style:
                        TextStyle(color: Colors.blueGrey.shade50, fontSize: 18),
                  ),
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
                                  color: Colors.blueGrey.shade500)))),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => RunMain(),
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                      ),

                    );
                  },
                )),
            Row(
              children: <Widget>[
                Text('Don\'t you have account?',
                style: TextStyle(
                  fontSize: 15,
                  color: darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],
                ),),
                TextButton(
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => RunSign(),
                        transitionDuration: Duration(milliseconds: 300),
                        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                      ),

                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
