import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/main/main_screen.dart';
import 'package:citiquiz/features/support/support_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:story_view/story_view.dart";

import 'news/news_screen.dart';
import 'places/places_screen.dart';
import 'play/play_screen.dart';
import 'profil/profil_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

getAppbarTitle(int index) {
  switch (index) {
    case 0:
      return null;
    case 1:
      return "Новости";
    case 2:
      return "Категория";
    case 3:
      return "Места";
    case 4:
      return "Профиль";
    default:
      return "";
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int navIndex = 0;
  bool isGameSelected = false;
  List<Widget> pages = [];
  @override
  @override
  void initState() {
    super.initState();
    pages = [
      MainScreen(
        newsCallback: () {
          setState(() {
            navIndex = 1;
          });
        },
        placesCallback: () {
          setState(() {
            navIndex = 2;
          });
        },
        profilCallback: () {
          setState(() {
            navIndex = 3;
          });
        },
      ),
      NewsScreen(),
      const PlayScreen(),
      const PlacesScreen(),
      const ProfilScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbarTitle(navIndex) == null
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  getAppbarTitle(navIndex),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorsUI.black,
                        fontSize: 32,
                      ),
                ),
              ),
            ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       isGameSelected = true;
      //     });
      //     Navigator.of(context).push(
      //       PageRouteBuilder(
      //         pageBuilder: (_, __, ___) => const PlayScreen(),
      //         transitionDuration: const Duration(milliseconds: 370),
      //         transitionsBuilder: (_, a, __, c) =>
      //             FadeTransition(opacity: a, child: c),
      //       ),
      //     );
      //   },
      //   backgroundColor: ColorsUI.lime,
      //   shape: const CircleBorder(),
      //   child: Padding(
      //     padding: const EdgeInsets.all(6.0),
      //     child: SvgPicture.asset(
      //       "asset/icons/game_outline.svg",
      //       colorFilter: (isGameSelected)
      //           ? const ColorFilter.mode(
      //               ColorsUI.lime,
      //               BlendMode.srcIn,
      //             )
      //           : const ColorFilter.mode(
      //               ColorsUI.black,
      //               BlendMode.srcIn,
      //             ),
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navIndex,
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            navIndex = value;
            isGameSelected = false;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.newspaper,
              ),
            ),
            label: 'Новости   ',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.timer,
              ),
            ),
            label: 'Играть',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.location_on,
              ),
            ),
            label: 'Места',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Профиль',
          ),
        ],
      ),
      body: IndexedStack(
        index: navIndex,
        children: pages,
      ),
    );
  }
}
