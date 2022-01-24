import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:payment_screen/atm_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF008b8b),
          canvasColor: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Image.asset(
            "assets/newwl.png",
            //width: 500,
            //height: 1000,
            fit: BoxFit.fill,
          ),
          nextScreen: HomePage(),
          splashTransition: SplashTransition.rotationTransition,
          backgroundColor: Colors.black,
          animationDuration: Duration(
            seconds: 2,
          ),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Image(
                image: AssetImage(
              "assets/new.png",
            )),
            width: MediaQuery.of(context).size.width,
            height: 400,
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 0, right: 100),
            child: Column(
              children: [
                Text(
                  " Make Paying \n Easier With \n Wallet",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 15, left: 30),
                      child: Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        right: 20,
                      ),
                      child: Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 20),
                      child: Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 15,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 0, right: 200, top: 15),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AtmScreen()));
              },
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 4,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                primary: Theme.of(context).canvasColor,
                onPrimary: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
