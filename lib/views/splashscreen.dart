import 'package:flutter/material.dart';
import 'package:project1/views/mainscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Movie App",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset("assets/Movie-Hollywood-No-Background.webp"),
              CircularProgressIndicator(
                color: Colors.red,
              ),
            ]),
          ),
        ));
  }

  void timer() {
    Future.delayed(Duration(seconds: 3), () {
      navigatorKey.currentState!.pushReplacement(
          MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
    });
  }
}
