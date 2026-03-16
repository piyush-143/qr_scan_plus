import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/core/constants/color.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/providers/db_provider.dart';
import 'package:qr_plus/providers/qr_code_provider.dart';
import 'package:qr_plus/providers/save_image_provider.dart';
import 'package:qr_plus/providers/tab_index_provider.dart';
import 'package:qr_plus/providers/toggle_provider.dart';
import 'package:qr_plus/screens/splash_screen.dart';

void main() {
  runApp(
    AppSizer(
      builder: (context, constraints, orientation) {
        return const MyApp();
      },
    ),
  );
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
          appBarTheme: const AppBarTheme(
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
        home: const SplashScreen(),
      ),
    );
  }
}
