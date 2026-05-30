import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/verse.dart';

class VerseCard extends StatelessWidget {
  final VerseMatch verse;
  final VoidCallback? onCopy;
  final VoidCallback? onSave;

  const VerseCard({
    super.key,
    required this.verse,
    this.onCopy,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: verse.isHighConfidence
              ? AppColors.gold
              : AppColors.gold.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                verse.reference,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gold,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: verse.isHighConfidence
                      ? AppColors.success.withValues(alpha: 0.2)
                      : AppColors.softWhite.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${verse.confidence.toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: verse.isHighConfidence
                        ? AppColors.success
                        : AppColors.softWhite,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            verse.text,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: AppColors.softWhite.withValues(alpha: 0.85),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (onCopy != null)
                IconButton(
                  icon: const Icon(Icons.copy_outlined,
                      color: AppColors.gold, size: 20),
                  onPressed: onCopy,
                ),
              if (onSave != null)
                IconButton(
                  icon: const Icon(Icons.bookmark_outline,
                      color: AppColors.gold, size: 20),
                  onPressed: onSave,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
