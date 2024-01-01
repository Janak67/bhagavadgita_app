import 'package:bhagavadgita_app/screen/details/provider/details_provider.dart';
import 'package:bhagavadgita_app/screen/home/model/home_model.dart';
import 'package:bhagavadgita_app/utils/share_helper.dart';
import 'package:bhagavadgita_app/widget/alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    HomeModel l1 = ModalRoute.of(context)!.settings.arguments as HomeModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(l1.name),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        showWebDialog(context);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.language_outlined),
                          SizedBox(width: 10),
                          Text('Language'),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        const Icon(Icons.light_mode_outlined),
                        const SizedBox(width: 8),
                        const Text('Theme'),
                        Consumer<DetailsProvider>(
                          builder: (context, value1, child) => Switch(
                            value: value1.isLight,
                            onChanged: (value) {
                              ShareHelper shr = ShareHelper();
                              shr.setTheme(value);
                              value1.changeTheme();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () {
                        context
                            .read<DetailsProvider>()
                            .copyToClipboard(l1.english);
                        Navigator.pop(context);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.copy_outlined),
                          SizedBox(width: 10),
                          Text('Copy'),
                        ],
                      ),
                    ),
                  ),
                  const PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.favorite_outline),
                        SizedBox(width: 10),
                        Text('Favorite'),
                      ],
                    ),
                  ),
                ];
              },
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Image.asset(
            //   'assets/img/bg1.jpg',
            //   fit: BoxFit.cover,
            // ),
            Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/img/bhagavadgita.jpg',
                        height: MediaQuery.sizeOf(context).height * 0.3,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '🙏 જય શ્રી કૃષ્ણ 🙏',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SelectableText(
                            l1.shloka,
                            style: Theme.of(context).textTheme.titleLarge,
                            enableInteractiveSelection: true,
                            contextMenuBuilder: (context, editableTextState) {
                              return PopupMenuButton(
                                itemBuilder: (context) {
                                  return [
                                    const PopupMenuItem(
                                      value: 'copy',
                                      child: Text('Copy'),
                                    ),
                                    const PopupMenuItem(
                                      value: 'select',
                                      child: Text('Select'),
                                    ),
                                  ];
                                },
                                onSelected: (value) {
                                  if (value == 'copy') {
                                  } else if (value == 'select') {}
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          Text(l1.meaning,
                              style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 30),
                          Text(l1.hindi,
                              style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 30),
                          Text(l1.english,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
