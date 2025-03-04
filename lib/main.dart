import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/provider/db_provider.dart';
import 'package:qr_plus/provider/images_provider.dart';
import 'package:qr_plus/provider/toggle_provider.dart';
import 'package:qr_plus/screen/splash_screen.dart';
import 'package:qr_plus/widgets/uihelper/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImagesProvider()),
        ChangeNotifierProvider(create: (_) => ToggleProvider()),
        ChangeNotifierProvider(create: (_) => DBProvider()),
      ],
      child: SafeArea(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
            appBarTheme: AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
            ),
            primaryColor: CustomColor.goldColor,
            textTheme: TextTheme(
              bodyLarge: GoogleFonts.itim(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: CustomColor.goldColor,
              ),
              bodyMedium: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              bodySmall: GoogleFonts.roboto(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: CustomColor.goldColor,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
