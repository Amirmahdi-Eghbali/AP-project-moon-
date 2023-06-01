import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey[200],
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
        body: LoginPage(),
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
        child: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  'moon liberary',
                  style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 25),
                )),
            Container(
              height: 65,
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueGrey.shade300
              ),
              child: TextFormField(

                keyboardType: TextInputType.text,
                controller: userNameController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  border: InputBorder.none,
                    labelText: 'User Name', hintText: 'Enter your Email'),
              ),
            ),
            Container(
              height: 65,
              padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
              margin: EdgeInsets.symmetric(vertical: 0),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blueGrey.shade300
              ),
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
            TextButton(
              style: TextButton.styleFrom(
                shadowColor: Colors.black
              ),
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password!',

              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextButton(
                  child: Text('Login'),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(10)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black54),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey.shade200),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blueGrey.shade600)))),
                  onPressed: () {
                    print(userNameController.text);
                    print(passwordController.text);
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 22),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
