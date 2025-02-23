import 'package:flutter/material.dart';
import 'package:qr_plus/screen/home_screen.dart';

import '../widgets/uihelper/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 182, 35, 1),
      body: Stack(
        children: [
          Image.asset("assets/splash/Intersect.png"),
          Align(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/splash/logo.png",
                width: 180,
                height: 180,
              ),
              SizedBox(height: 30),
              Image.asset("assets/splash/getStarted.png"),
            ],
          )),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/splash/lowerIntersect.png",
            ),
          ),
          Align(
            alignment: Alignment(0.8, 0.9),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColor.goldColor,
                  boxShadow: [
                    BoxShadow(color: CustomColor.goldColor, blurRadius: 10)
                  ],
                ),
                child: Icon(Icons.arrow_forward),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
