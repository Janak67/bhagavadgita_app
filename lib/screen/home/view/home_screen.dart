import 'package:bhagavadgita_app/screen/home/model/home_model.dart';
import 'package:bhagavadgita_app/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    providerw = context.watch<HomeProvider>();
    providerr = context.read<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(
            'શ્રીમદ ભગવદ ગીતા',
            style: GoogleFonts.anekGujarati(fontSize: 25),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/img/bg.jpg', fit: BoxFit.cover),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/img/bhagavad gita.jpeg',
                      height: MediaQuery.sizeOf(context).height * 0.2,
                    ),
                  ),
                ),
                Expanded(
                  child: Scrollbar(
                    child: ListView.builder(
                      itemCount: providerw!.homeList.length,
                      itemBuilder: (context, index) {
                        HomeModel bhagavadGitaList = providerr!.homeList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'detail',
                                arguments: bhagavadGitaList);
                          },
                          child: Card(
                            elevation: 3,
                            child: Container(
                              height: 70,
                              alignment: Alignment.center,
                              child: ListTile(
                                leading: Text('${bhagavadGitaList.title}   -',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                                title: Text(bhagavadGitaList.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Setting'),
          ],
          selectedItemColor: Colors.blue.shade300,
          unselectedIconTheme:
              IconThemeData(color: Theme.of(context).iconTheme.color),
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        ),
      ),
    );
  }
}
