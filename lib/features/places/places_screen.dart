import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/core/widget/custom_card.dart';
import 'package:citiquiz/features/core/widget/title_card.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 24.0),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24.0,
              ),
              TitleCard(),
              const SizedBox(height: 32.0),
              ListView(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: [
                  CustomCard(
                    name: 'ВСК «Медео»',
                    description:
                        'Медео — высокогорный спортивный комплекс в Алматы, расположенный в высокогорном урочище Медеу на высоте 1691 м.',
                    date: 'ул. Горная 465 Алматы',
                    image: Image.asset(
                      "asset/images/place1.jpg",
                    ),
                  ),
                  CustomCard(
                    name: ' Озеро «Иссык»',
                    description:
                        'Иссык — озеро в Иссыкском ущелье Заилийского Алатау, примерно в 40 км восточнее Алма-Аты.',
                    date: 'Енбекшиказахский район, Алматинская область',
                    image: Image.asset(
                      "asset/images/place2.jpg",
                    ),
                  ),
                  CustomCard(
                    name: 'Чарынский каньон',
                    description:
                        'Чарынский каньон — протянувшийся на 154 км каньон вдоль реки Чарын в Казахстане.',
                    date: 'дорога на Чарынский Каньон, Алматинская область',
                    image: Image.asset(
                      "asset/images/place3.jpg",
                    ),
                  ),
                  CustomCard(
                    name: 'Озеро «Каинды»',
                    description:
                        'Каинды — озеро Алматинской области Казахстана, популярное туристическое место в одном из ущелий Кунгей Алатау.',
                    date: 'Кегенский район, Алматинская область',
                    image: Image.asset(
                      "asset/images/place4.jpg",
                    ),
                  ),
                  CustomCard(
                    name: 'БАО',
                    description:
                        'Большое Алматинское озеро — высокогорный водоём в Заилийском Алатау на высоте 2510 метров над уровнем моря.',
                    date: 'БАО, Алматинская область',
                    image: Image.asset(
                      "asset/images/place5.jpg",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
