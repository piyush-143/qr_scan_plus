import 'package:flutter/material.dart';
import 'package:qr_plus/screen/generate_screen.dart';
import 'package:qr_plus/screen/history_screen.dart';
import 'package:qr_plus/widgets/uihelper/concat_string.dart';
import 'uihelper/color.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.barBgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border(
            bottom: BorderSide(
          color: CustomColor.goldColor,
          width: 4,
        )),
        boxShadow: [BoxShadow(color: CustomColor.barBgColor, blurRadius: 8)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildButton(
            icon: Icons.qr_code_2_outlined,
            text: 'Generate',
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => GenerateScreen(),
                ),
              );
            },
            context: context,
          ),
          // Highlighted middle button - elevated with Transform
          Transform.translate(
            offset: const Offset(-4, -25),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColor.goldColor,
                boxShadow: [
                  BoxShadow(color: CustomColor.goldColor, blurRadius: 10)
                ],
              ),
              child: Image.asset(
                'assets/splash/logo.png', // Replace with your image path
                width: 35,
                height: 35,
              ),
            ),
          ),
          _buildButton(
            icon: Icons.history,
            text: 'History',
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryScreen(),
                ),
              );
            },
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
