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
  DetailsProvider? providerr;
  DetailsProvider? providerw;

  @override
  Widget build(BuildContext context) {
    providerw = context.watch<DetailsProvider>();
    providerr = context.read<DetailsProvider>();
    HomeModel l1 = ModalRoute.of(context)!.settings.arguments as HomeModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: providerr!.language == 'Gujarati'
              ? Text(l1.nameModel!.gujarati)
              : providerr!.language == 'Hindi'
                  ? Text(l1.nameModel!.hindi)
                  : Text(l1.nameModel!.english),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          l1.image,
                          fit: BoxFit.fill,
                        ),
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
                          providerr!.language == 'Gujarati'
                              ? Text('${l1.shlokaModel!.shlokaGujarati}',
                                  style: Theme.of(context).textTheme.titleLarge)
                              : providerr!.language == 'Hindi'
                                  ? Text('${l1.shlokaModel!.shlokaHindi}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge)
                                  : Text('${l1.shlokaModel!.shlokaEnglish}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                          const SizedBox(height: 30),
                          providerr!.language == 'Gujarati'
                              ? Text(l1.titleModel!.titleG,
                                  style: Theme.of(context).textTheme.titleSmall)
                              : providerr!.language == 'Hindi'
                                  ? Text(l1.titleModel!.titleH,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall)
                                  : Text(l1.titleModel!.titleE,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall),
                          const SizedBox(height: 30),
                          providerr!.language == 'Gujarati'
                              ? Text(l1.meaning,
                                  style:
                                      Theme.of(context).textTheme.titleMedium)
                              : providerr!.language == 'Hindi'
                                  ? Text(l1.hindi,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium)
                                  : Text(l1.english,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium)
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
