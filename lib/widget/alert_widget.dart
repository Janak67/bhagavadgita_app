import 'package:bhagavadgita_app/screen/details/provider/details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showWebDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              title: const Text('Gujarati'),
              value: 'Gujarati',
              groupValue: context.read<DetailsProvider>().language,
              onChanged: (value) {
                context
                    .read<DetailsProvider>()
                    .languageStatus(value.toString());
                Navigator.pop(context);
              },
            ),
            RadioListTile(
              title: const Text('Hindi'),
              value: 'Hindi',
              groupValue: context.read<DetailsProvider>().language,
              onChanged: (value) {
                context
                    .read<DetailsProvider>()
                    .languageStatus(value.toString());
                Navigator.pop(context);
              },
            ),
            RadioListTile(
              title: const Text('English'),
              value: 'English',
              groupValue: context.read<DetailsProvider>().language,
              onChanged: (value) {
                context
                    .read<DetailsProvider>()
                    .languageStatus(value.toString());
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
