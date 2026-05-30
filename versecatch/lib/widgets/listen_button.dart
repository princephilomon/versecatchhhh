import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ListenButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;

  const ListenButton({
    super.key,
    this.onTap,
    this.size = 160,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const RadialGradient(
            colors: [AppColors.gold, AppColors.mutedGold],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withValues(alpha: 0.3),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mic, size: size * 0.3, color: AppColors.deepNavy),
            const SizedBox(height: 8),
            Text(
              'Start\nListening',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size * 0.1,
                fontWeight: FontWeight.bold,
                color: AppColors.deepNavy,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
