import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moon/main.dart';
import 'package:moon/mainPage.dart';

class RunSign extends StatelessWidget {
  const RunSign({Key? key}) : super(key: key);
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
        body: SingleChildScrollView(child: SignUpPage()),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

String userName = 'Amirmahdi';

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String _log="";

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
                      color: darkMode
                          ? Colors.blueGrey[100]
                          : Colors.blueGrey[800],
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color:
                        darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],
                  ),
                )),
            Container(
              height: 65,
              margin: EdgeInsets.symmetric(vertical: 10),
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
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueGrey.shade200),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Email address',
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    // Define a regular expression pattern for email validation
                    // This pattern checks if the entered text matches the email format
                    // You can use any valid email regex pattern you prefer
                    final emailRegex = RegExp(
                        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

                    // Check if the entered text matches the regex pattern
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    } else if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null; // Return null if the input is valid
                  },
                )),
            Container(
                height: 65,
                padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueGrey.shade200),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    final RegExp passwordRegex =
                        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

                    if (!passwordRegex.hasMatch(value!)) {
                      return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and be at least 8 characters long.';
                    }
                    return null;
                  },
                )

                // TextFormField(
                //   keyboardType: TextInputType.text,
                //   controller: passwordController,
                //   obscureText: !_passwordVisible,
                //   decoration: InputDecoration(
                //     border: InputBorder.none,
                //     labelText: 'Password',
                //     hintText: 'Enter your password',
                //     suffixIcon: IconButton(
                //       icon: Icon(
                //         _passwordVisible
                //             ? Icons.visibility
                //             : Icons.visibility_off,
                //         color: Colors.blueGrey[900],
                //       ),
                //       onPressed: () {
                //         setState(() {
                //           _passwordVisible = !_passwordVisible;
                //         });
                //       },
                //     ),
                //   ),
                // ),
                ),
            Container(
                width: 350,
                height: 50,
                margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: TextButton(
                  child: Text(
                    'Sign up',
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
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ),
                    );
                  },
                )),
                      Text(_log),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 15,
                    color:
                        darkMode ? Colors.blueGrey[100] : Colors.blueGrey[800],
                  ),
                ),
                TextButton(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    sendRequest("signup");
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => RunLog(),
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ));
  }
    // send() async{
    // String request ="singup\nusername:$userNameController,,password:$passwordController,,email:$emailController,,salary:0\u0000";
    // await Socket.connect("10.0.2.2", 8000).then((serverSocket){
    //   serverSocket.write(request);
    //   serverSocket.flush();
    //   serverSocket.listen((response) {
    //     setState(() {
    //       _log+=String.fromCharCode(response as int)+"\n";
    //     });
    //   });
    // });
    // }
  static Future<String> sendRequest(String request) async {
    String res = "";
    request += '\u0000';
    var socket = await Socket.connect("10.0.2.2", 8000);
    socket.write(request);
    socket.flush();
    var subscription = socket.listen((response) {
      res += String.fromCharCodes(response);
    });
    await subscription.asFuture<void>();
    return res;
  }

}
