import 'package:flutter/material.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/screens/generate_screen.dart';
import 'package:qr_plus/screens/history_screen.dart';
import 'package:qr_plus/core/constants/color.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.barBgColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border(
          bottom: BorderSide(
            color: CustomColor.goldColor,
            width: 4.h,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColor.barBgColor,
            blurRadius: 8.r,
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
            offset: Offset(-4.w, -25.h),
            child: Container(
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColor.goldColor,
                boxShadow: [
                  BoxShadow(color: CustomColor.goldColor, blurRadius: 10.r),
                ],
              ),
              child: Image.asset(
                'assets/splash/logo.png',
                width: 35.w,
                height: 35.h,
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
            size: 25.r,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 17.r,
                ),
          ),
        ],
      ),
    );
  }
}
