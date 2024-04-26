import 'package:citiquiz/features/profil/screens/shop-screen/wudgets/shop.dart';
import 'package:citiquiz/features/profil/screens/shop-screen/wudgets/shop2.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
              decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1)
      ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Row(
                  children: [
                     InkWell(
                      onTap: () {
                        setState(() {
                          isActive = false;
                        });
                      },
                      child: Text(
                        "Магазин",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight:
                                isActive ? FontWeight.w400 : FontWeight.bold),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          isActive = true;
                        });
                      },
                      child: Text(
                        "Покупки",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight:
                                !isActive ? FontWeight.w400 : FontWeight.bold),
                      )),
                  ],
                 ),
                 IconButton(onPressed: (){}, icon: Icon(Icons.tune, color: Color.fromARGB(255, 31, 219, 31),))
                ],
              ),
              isActive ? Shop2() : Shop(),
        
            ],
          ),
        ),
      ),
    );
  }
}
