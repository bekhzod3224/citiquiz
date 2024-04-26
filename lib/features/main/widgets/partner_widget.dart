import 'package:citiquiz/features/core/colors.dart';
import 'package:flutter/material.dart';

class PartnerWidget extends StatelessWidget {
  final String text;

  const PartnerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Container(
        height: size.width * 0.30,
        width: size.width * 0.30,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "asset/images/almaty2.jpg",
              ),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: ColorsUI.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
