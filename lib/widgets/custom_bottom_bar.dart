import 'package:flutter/material.dart';
import 'package:qr_plus/screen/generate_screen.dart';
import 'package:qr_plus/screen/history_screen.dart';
import 'package:qr_plus/widgets/uihelper/color.dart'; // Assuming color.dart is in utils

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
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColor.barBgColor,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomBarButton(
            icon: Icons.qr_code_2_outlined,
            text: 'Generate',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => GenerateScreen()),
              );
            },
          ),
          // Highlighted middle button - elevated with Transform
          Transform.translate(
            offset: const Offset(-4, -25),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColor.goldColor,
                boxShadow: [
                  BoxShadow(color: CustomColor.goldColor, blurRadius: 10),
                ],
              ),
              child: Image.asset(
                'assets/splash/logo.png', // Replace with your image path
                width: 35,
                height: 35,
              ),
            ),
          ),
          _BottomBarButton(
            icon: Icons.history,
            text: 'History',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HistoryScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BottomBarButton extends StatelessWidget {
  const _BottomBarButton({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 17,
                ),
          ),
        ],
      ),
    );
  }
}
