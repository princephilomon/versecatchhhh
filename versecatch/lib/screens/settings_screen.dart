import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();

    return Scaffold(
      backgroundColor: AppColors.darkBg,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSection(
            title: 'Language',
            children: [
              _buildToggleTile(
                title: 'Auto-detect language',
                subtitle: 'Automatically detect sermon language',
                value: state.autoDetect,
                onChanged: (v) => state.setAutoDetect(v),
              ),
              if (!state.autoDetect)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceDark,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: state.preferredLanguage,
                      dropdownColor: AppColors.surfaceDark,
                      isExpanded: true,
                      items: [
                        _langItem('en', 'English'),
                        _langItem('te', 'Telugu'),
                        _langItem('hi', 'Hindi'),
                        _langItem('ta', 'Tamil'),
                        _langItem('ml', 'Malayalam'),
                        _langItem('kn', 'Kannada'),
                        _langItem('bn', 'Bengali'),
                        _langItem('gu', 'Gujarati'),
                        _langItem('mr', 'Marathi'),
                        _langItem('pa', 'Punjabi'),
                        _langItem('or', 'Odia'),
                      ],
                      onChanged: (v) {
                        if (v != null) state.setPreferredLanguage(v);
                      },
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSection(
            title: 'Appearance',
            children: [
              _buildToggleTile(
                title: 'Dark Theme',
                subtitle: 'Always use dark theme',
                value: true,
                onChanged: (_) {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSection(
            title: 'Privacy',
            children: [
              _buildInfoTile(
                icon: Icons.security,
                title: 'Audio Processing',
                subtitle: 'Audio is processed in real time and never stored.',
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSection(
            title: 'About',
            children: [
              _buildInfoTile(
                icon: Icons.info_outline,
                title: 'Version',
                subtitle: '1.0.0',
              ),
              _buildInfoTile(
                icon: Icons.menu_book_rounded,
                title: 'VerseCatch',
                subtitle: 'Never lose the sermon again.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.gold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildToggleTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: AppColors.softWhite)),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 13,
          color: AppColors.softWhite.withValues(alpha: 0.5),
        ),
      ),
      value: value,
      activeColor: AppColors.gold,
      onChanged: onChanged,
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.gold, size: 24),
      title: Text(title, style: const TextStyle(color: AppColors.softWhite)),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 13,
          color: AppColors.softWhite.withValues(alpha: 0.5),
        ),
      ),
    );
  }

  DropdownMenuItem<String> _langItem(String code, String name) {
    return DropdownMenuItem(
      value: code,
      child: Text(name, style: const TextStyle(color: AppColors.softWhite)),
    );
  }
}
