import 'package:flutter/material.dart';

class LanguageListWidget extends StatelessWidget {
  final String selectedLang;
  final Function(String) onLangSelected;

  const LanguageListWidget({
    super.key,
    required this.selectedLang,
    required this.onLangSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _LanguageItem(
          title: 'العربية',
          code: 'ar',
          isSelected: selectedLang == 'ar',
          onTap: () => onLangSelected('ar'),
        ),
        _LanguageItem(
          title: 'English',
          code: 'en',
          isSelected: selectedLang == 'en',
          onTap: () => onLangSelected('en'),
        ),
      ],
    );
  }
}

class _LanguageItem extends StatelessWidget {
  final String title;
  final String code;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageItem({
    required this.title,
    required this.code,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: isSelected ? const Icon(Icons.check, color: Colors.green) : null,
      onTap: onTap,
    );
  }
}
