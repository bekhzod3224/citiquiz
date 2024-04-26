import 'package:citiquiz/features/core/colors.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  final String text;

  const NewsWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            image: DecorationImage(
                image: AssetImage(
                  "asset/images/almaty2.jpg",
                ),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(4.0)),
              ),
              child: Text(
                text,
                maxLines: 1,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
