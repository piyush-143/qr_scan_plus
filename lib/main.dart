import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/provider/gallery_image_provider.dart';
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
        ChangeNotifierProvider(create: (_) => GalleryImageProvider()),
        ChangeNotifierProvider(create: (_) => ToggleProvider()),
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
              primaryColor: CustomColor.goldColor),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
