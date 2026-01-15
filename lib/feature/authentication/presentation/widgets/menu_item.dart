import 'package:fitnessai/l10n/app_localization.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _item(
            context,
            title: AppLocalizations.of(context)!.languagevn,
            onTap: () {
              Navigator.pop(context);
              debugPrint('Change to VI');
            },
          ),
          _item(
            context,
            title: AppLocalizations.of(context)!.languageuk,
            onTap: () {
              Navigator.pop(context);
              debugPrint('Change to EN');
            },
          ),
        ],
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
