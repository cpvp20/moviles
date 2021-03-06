import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/login.dart';
import 'package:estructura_practica_1/register.dart';
import 'package:flutter/material.dart';

class BeginPage extends StatelessWidget {
  const BeginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            blue,
            black,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 100.0, horizontal: 60.0),
            child: Image.asset('images/cupping.png'),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [darkgrey, grey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: GestureDetector(
              child: Container(
                height: 60,
                child: Center(
                  child: Text(
                    "REGISTRATE",
                    style: TextStyle(
                        fontSize: 14,
                        color: black,
                        fontFamily: 'AkzidenzGrotesk BQ Medium',
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [darkgrey, grey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: GestureDetector(
              child: Container(
                height: 60,
                child: Center(
                  child: Text(
                    "INGRESA",
                    style: TextStyle(
                        fontSize: 14,
                        color: black,
                        fontFamily: 'AkzidenzGrotesk BQ Medium',
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ),
        ],
      ),
    ));
  }
}
