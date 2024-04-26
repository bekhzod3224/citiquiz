import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/play/widget/select_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            CategoryList(context),
            CategoryList(context),
            CategoryList(context),
            CategoryList(context),
          ],
        ),
      ),
    );
  }

  Widget CategoryList(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return SelectTheme();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Облики города",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("Базавый вопросы про города",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              SizedBox(
                  width: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      child: Image.asset(
                        "asset/images/almaty2.jpg",
                        fit: BoxFit.cover,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
