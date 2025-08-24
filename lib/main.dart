import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/provider/db_provider.dart';
import 'package:qr_plus/provider/qr_code_provider.dart';
import 'package:qr_plus/provider/save_image_provider.dart';
import 'package:qr_plus/provider/tab_index_provider.dart';
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
        ChangeNotifierProvider(create: (_) => SaveImageToGalleryProvider()),
        ChangeNotifierProvider(create: (_) => ToggleProvider()),
        ChangeNotifierProvider(create: (_) => DBProvider()),
        ChangeNotifierProvider(create: (_) => TabIndexProvider()),
        ChangeNotifierProvider(create: (_) => QrCodeProvider()),
      ],
      child: MaterialApp(
        title: 'QR Scan+',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
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
    );
  }
}
