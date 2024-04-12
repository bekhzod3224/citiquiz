import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  // Функция для открытия телефона по нажатию на иконку
  void _callNumber() async {
    const phoneNumber = '+77077020121';
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  // Функция для открытия сайта по нажатию на иконку
  void _openWebsite() async {
    const url = 'https://www.citiquiz.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Связаться',
          style: textTheme.headline4!.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromRGBO(43, 43, 43, 1),
        padding: EdgeInsets.all(24.0),
        child: Center(
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.0, 36.0, 24.0, 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "asset/images/citiquiz.png",
                    width: MediaQuery.of(context).size.width * 0.28,
                  ),
                  SizedBox(height: 40),
                  Text(
                    "CITIQUIZ - новый и быстроразвивающийся стартап, который нацелен на привлечение старых-новых жителей нашего города отгадывать увлекательные квизы и викторины и тратить бонусы у наших партнеров",
                    style: textTheme.headline5!.copyWith(fontSize: 18, height: 1.5, color: Colors.black),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: _callNumber,
                    child: Row(
                      children: [
                        Icon(Icons.phone, color: Colors.black),
                        SizedBox(width: 10),
                        Text(
                          "+7 (707) 702-01-21",
                          style: textTheme.bodyText1!.copyWith(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: _openWebsite,
                    child: Row(
                      children: [
                        Icon(Icons.language, color: Colors.black),
                        SizedBox(width: 10),
                        Text(
                          "www.citiquiz.com",
                          style: textTheme.bodyText1!.copyWith(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Логика для открытия Instagram
                        },
                        child: Row(
                          children: [
                            Icon(Icons.camera_alt, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              "@citiquiz",
                              style: textTheme.bodyText1!.copyWith(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
