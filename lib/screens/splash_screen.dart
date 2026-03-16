import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/providers/toggle_provider.dart';
import 'package:qr_plus/screens/home_screen.dart';
import 'package:vibration/vibration.dart';

import 'package:qr_plus/core/constants/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 182, 35, 1),
      body: Stack(
        children: [
          Image.asset(
            "assets/splash/Intersect.png",
          ),
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/splash/logo.png",
                  width: 160.r,
                  height: 160.r,
                ),
                SizedBox(height: 25.h),
                Column(
                  children: [
                    Text(
                      "Get Started",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontSize: 43.r,
                          ),
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Text(
                        "Go and enjoy our features for free and make your life easy with us.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.black54,
                              fontSize: 17.r,
                            ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/splash/lowerIntersect.png",
            ),
          ),
          Align(
            alignment: const Alignment(0.8, 0.9),
            child: InkWell(
              onTap: () async {
                bool hasVibrator = false;
                try {
                  hasVibrator = await Vibration.hasVibrator();
                } catch (_) {
                  hasVibrator = false;
                }

                if (!context.mounted) return;
                context.read<ToggleProvider>().setHasVibration(hasVibrator);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColor.goldColor,
                  boxShadow: [
                    BoxShadow(color: CustomColor.goldColor, blurRadius: 10.r)
                  ],
                ),
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
