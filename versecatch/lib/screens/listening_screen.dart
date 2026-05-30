import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../theme/app_theme.dart';
import '../models/verse.dart';

class ListeningScreen extends StatefulWidget {
  const ListeningScreen({super.key});

  @override
  State<ListeningScreen> createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppState>().startListening();
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),
            Expanded(child: _buildCenterContent(context)),
            _buildTranscriptSection(context),
            _buildBottomActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    final state = context.watch<AppState>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.softWhite),
            onPressed: () {
              context.read<AppState>().stopListening();
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          _buildLiveBadge(),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.surfaceDark,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              state.detectedLanguage.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.softWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveBadge() {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.liveRed.withValues(
                alpha: 0.2 + _pulseController.value * 0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.liveRed,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'LIVE',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.liveRed.withValues(
                      alpha: 0.8 + _pulseController.value * 0.2),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCenterContent(BuildContext context) {
    final state = context.watch<AppState>();
    final verse = state.currentVerse;

    if (state.isProcessing && verse == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                color: AppColors.gold,
                strokeWidth: 3,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Listening...',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.softWhite.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      );
    }

    if (verse != null) {
      return _buildVerseCard(verse);
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.hearing_outlined,
            size: 64,
            color: AppColors.gold.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 20),
          Text(
            'Listening for verses...',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.softWhite.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Speak or type a verse to test',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.softWhite.withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerseCard(VerseMatch verse) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surfaceDark,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: verse.isHighConfidence
                    ? AppColors.gold
                    : AppColors.gold.withValues(alpha: 0.4),
                width: 1.5,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: verse.isHighConfidence
                        ? AppColors.success.withValues(alpha: 0.2)
                        : AppColors.gold.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${verse.confidence.toStringAsFixed(0)}% ${verse.confidenceLabel}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: verse.isHighConfidence
                          ? AppColors.success
                          : AppColors.gold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  verse.reference,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.gold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  verse.text,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: AppColors.softWhite.withValues(alpha: 0.9),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTranscriptSection(BuildContext context) {
    final state = context.watch<AppState>();
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.short_text,
                  size: 16,
                  color: AppColors.softWhite.withValues(alpha: 0.5)),
              const SizedBox(width: 6),
              Text(
                'Transcript',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.softWhite.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                state.currentTranscript.isEmpty
                    ? 'Waiting for audio...'
                    : state.currentTranscript,
                style: TextStyle(
                  fontSize: 14,
                  color: state.currentTranscript.isEmpty
                      ? AppColors.softWhite.withValues(alpha: 0.3)
                      : AppColors.softWhite.withValues(alpha: 0.7),
                  fontStyle: state.currentTranscript.isEmpty
                      ? FontStyle.italic
                      : FontStyle.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    final state = context.watch<AppState>();
    final verse = state.currentVerse;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ActionButton(
            icon: Icons.bookmark_outline,
            label: 'Save',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Verse saved!'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
          _ActionButton(
            icon: Icons.copy_outlined,
            label: 'Copy',
            onTap: verse != null
                ? () {
                    Clipboard.setData(
                      ClipboardData(
                        text: '${verse.reference} - ${verse.text}',
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Copied!'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                : null,
          ),
          _ActionButton(
            icon: Icons.keyboard,
            label: 'Type',
            onTap: () => _showTextInputDialog(context),
          ),
          _ActionButton(
            icon: Icons.stop_rounded,
            label: 'Stop',
            onTap: () {
              state.stopListening();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _showTextInputDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surfaceDark,
        title: const Text('Type a verse', style: TextStyle(color: AppColors.softWhite)),
        content: TextField(
          controller: controller,
          autofocus: true,
          style: const TextStyle(color: AppColors.softWhite),
          decoration: InputDecoration(
            hintText: 'e.g. For God so loved the world...',
            hintStyle: TextStyle(color: AppColors.softWhite.withValues(alpha: 0.4)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.gold.withValues(alpha: 0.5)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.gold),
            ),
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cancel', style: TextStyle(color: AppColors.softWhite.withValues(alpha: 0.7))),
          ),
          ElevatedButton(
            onPressed: () {
              final text = controller.text.trim();
              if (text.isNotEmpty) {
                context.read<AppState>().simulateTextInput(text);
              }
              Navigator.pop(ctx);
            },
            child: const Text('Detect'),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: (onTap != null
                      ? AppColors.gold
                      : AppColors.softWhite.withValues(alpha: 0.1))
                  .withValues(alpha: onTap != null ? 0.15 : 0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: onTap != null
                  ? AppColors.gold
                  : AppColors.softWhite.withValues(alpha: 0.2),
              size: 22,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: onTap != null
                  ? AppColors.softWhite.withValues(alpha: 0.8)
                  : AppColors.softWhite.withValues(alpha: 0.2),
            ),
          ),
        ],
      ),
    );
  }
}
