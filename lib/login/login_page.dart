import 'package:flutter/material.dart';
import '../main field/main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
                width: sizeQuery.width * 0.8,
                child: Image.asset('assets/main_logo.png')),
            Container(
              height: sizeQuery.height * 0.06,
              width: sizeQuery.width * 0.8,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.yellow[700]))),
                keyboardType: TextInputType.name,
              ),
            ),
            SizedBox(
              height: sizeQuery.height * 0.05,
            ),
            Container(
                height: sizeQuery.height * 0.06,
                width: sizeQuery.width * 0.8,
                child: TextField(
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue))),
                )),
            SizedBox(
              height: sizeQuery.height * 0.05,
            ),
            Container(
              width: sizeQuery.width * 0.8,
              child: RaisedButton(
                color: Colors.yellow[600],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
