import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_plus/screen/show_qr_screen.dart';
import '../widgets/color.dart';
import '../widgets/custom_cross_container.dart';
import '../widgets/custom_share_save_button.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final String code;
  const ResultScreen({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 65),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  CustomCrossContainer(
                    icon: Icons.arrow_back_ios_sharp,
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    },
                    size: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                      "Result",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CustomColor.barBgColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: CustomColor.barBgColor,
                    blurRadius: 15,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Row(
                      spacing: 20,
                      children: [
                        Image.asset("assets/result/resultIcon.png"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Data",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Date",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.white30,
                      thickness: 1,
                    ),
                    SizedBox(height: 8),
                    Text(
                      code,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowQRScreen(code: code),
                            ));
                      },
                      child: Text(
                        'Show QR Code',
                        style: TextStyle(
                            color: CustomColor.goldColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 40,
              children: [
                CustomShareSaveButton(
                    icon: Icons.share, onTap: () {}, text: "Share"),
                CustomShareSaveButton(
                    icon: Icons.file_copy,
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: code));
                    },
                    text: "Copy"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
