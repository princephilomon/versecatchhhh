import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LiveIndicator extends StatelessWidget {
  final bool isListening;

  const LiveIndicator({super.key, this.isListening = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isListening
            ? AppColors.liveRed.withValues(alpha: 0.2)
            : AppColors.softWhite.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isListening ? AppColors.liveRed : AppColors.softWhite.withValues(alpha: 0.4),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            isListening ? 'LIVE' : 'OFF',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isListening
                  ? AppColors.liveRed
                  : AppColors.softWhite.withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    );
  }
}
