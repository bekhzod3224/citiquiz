import 'dart:ui';

import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/main/story.dart';
import 'package:citiquiz/features/main/widgets/partner_widget.dart';
import 'package:citiquiz/features/main/widgets/story_widget.dart';
import 'package:citiquiz/features/qr/bloc/qr_bloc.dart';
import 'package:citiquiz/features/qr/qr_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'widgets/news_widget.dart';
import "package:story_view/story_view.dart";

class MainScreen extends StatelessWidget {
  final Function() newsCallback;
  final Function() placesCallback;
  final Function() profilCallback;
  final StoryController controller = StoryController();
  MainScreen(
      {super.key,
      required this.newsCallback,
      required this.placesCallback,
      required this.profilCallback});

  @override
  Widget build(BuildContext context) {
    List<StoryItem> storyItems = [
      StoryItem.pageImage(
        url:
            "https://mykaleidoscope.ru/x/uploads/posts/2022-09/1663200247_14-mykaleidoscope-ru-p-gorod-almati-kazakhstan-oboi-15.jpg",
        controller: controller,
      ),
      StoryItem.pageImage(
        url:
            "https://static.tildacdn.com/tild3561-3066-4965-b234-636538356561/_3.jpg",
        controller: controller,
      ),
      StoryItem.pageImage(
        url:
            "https://mykaleidoscope.ru/x/uploads/posts/2022-09/1663219067_19-mykaleidoscope-ru-p-kazakhstan-stolitsa-almati-pinterest-19.jpg",
        controller: controller,
      ),
      StoryItem.pageImage(
        url:
            "https://sportishka.com/uploads/posts/2022-04/1650612019_66-sportishka-com-p-gorod-almati-kazakhstan-krasivo-foto-72.jpg",
        controller: controller,
      ),
    ];

    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(
              "asset/images/almaty.png",
            ),
          ),
        ),
        child: FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              String? nick = snapshot.data!.getString('nick');
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 50),
                    child: Row(
                      children: [
                        Image.asset(
                          "asset/images/citiquiz.png",
                          width: size.width * 0.3,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            profilCallback();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: RichText(
                                  text: TextSpan(
                                    text: "Привет, ",
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "${nick ?? "-"}!",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          // Другие желаемые свойства стиля...
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Container(
                              //   padding: EdgeInsets.all(8.0),
                              //   margin: EdgeInsets.only(left: 16, top: 0, right: 32), // Добавлен отступ справа
                              //   decoration: BoxDecoration(
                              //     color: Colors.black.withOpacity(0.6), // Черная полупрозрачная плашка
                              //     borderRadius: BorderRadius.circular(4.0),
                              //   ),
                              //   child: Stack(
                              //     alignment: Alignment.centerLeft,
                              //     children: [
                              //       Icon(
                              //         Icons.account_circle, // Иконка профиля
                              //         color: Colors.white,
                              //         size: 24.0,
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.only(left: 32.0),
                              //         child: Text(
                              //           "Профиль",
                              //           style: textTheme.bodyLarge!.copyWith(fontSize: 14, color: Colors.white), // Текст белого цвета
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 30),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Мои коины",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.apple,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        Text(
                                          "10",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<QrBloc, QrState>(
                          builder: (context, state) {
                            if (state is QrInitial) {
                              if (state.qr == null || state.qr == "") {
                                return GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          QrViewScreeen(),
                                      transitionDuration:
                                          Duration(milliseconds: 370),
                                      transitionsBuilder: (_, a, __, c) =>
                                          FadeTransition(opacity: a, child: c),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5.0),
                                        margin: EdgeInsets.only(
                                            left: 10, bottom: 0),
                                        decoration: BoxDecoration(
                                          color: ColorsUI.lime,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0.0),
                                                child: Text(
                                                  "Отсканировать",
                                                  style: textTheme.bodyLarge!
                                                      .copyWith(
                                                          color: ColorsUI.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.qr_code,
                                                    color: ColorsUI.black,
                                                    size: 25.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: Text(
                                                      "QR",
                                                      style: textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                              color: ColorsUI
                                                                  .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 22),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return GestureDetector(
                                onTap: () => (
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          QrViewScreeen(),
                                      transitionDuration:
                                          Duration(milliseconds: 370),
                                      transitionsBuilder: (_, a, __, c) =>
                                          FadeTransition(opacity: a, child: c),
                                    ),
                                  ),
                                ),
                                child: QrImageView(
                                  size: size.width * 0.2,
                                  data: state.qr!,
                                  backgroundColor: Colors.white,
                                ),
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 25.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.15,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => StoryWidget(
                                  storyItems: storyItems,
                                  controller: controller,
                                ),
                                transitionDuration:
                                    const Duration(milliseconds: 370),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(opacity: a, child: c),
                              ),
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          border: Border.all(
                                            color: Colors.pink.withOpacity(0.7),
                                            width:
                                                3.0, // Увеличенная толщина обводки
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: CircleAvatar(
                                            child: Container(),
                                            maxRadius: 35,
                                            backgroundImage: AssetImage(
                                                "asset/images/almaty.jpg"),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Алматы 1',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.0,
                        ),
                       Container(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100
                        ),
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                            children: [
                               Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Новости стартапа",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: ColorsUI.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    newsCallback();
                                  },
                                  child: Text(
                                    "См. все >",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 130,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return NewsWidget(text: " Новость 1");
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                          color: Colors.grey.shade100
                        ),
                              child: Column(
                                children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Партнеры",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: ColorsUI.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      newsCallback();
                                    },
                                    child: Text(
                                      "См. все >",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              SizedBox(
                                height: 130,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return PartnerWidget(text: "Партнер 1");
                                  },
                                ),
                              ),
                                ],
                              ),
                            ),
                            
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Достопримечательности ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: ColorsUI.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    Icon(Icons.location_on_sharp),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    placesCallback();
                                    ;
                                  },
                                  child: Text(
                                    "См. все >",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(
                              height: 130,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return NewsWidget(text: " Место 1 ");
                                },
                              ),
                            ),
                            ],
                           ),
                         ),
                       )
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
