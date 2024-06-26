import 'package:flutter/material.dart';

class Shop2 extends StatefulWidget {
  const Shop2({super.key});

  @override
  State<Shop2> createState() => _Shop2State();
}

class _Shop2State extends State<Shop2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
            )
          ),
          child: TextField(
            
            decoration: InputDecoration(
              border: InputBorder.none,
              
              suffixIcon: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 31, 219, 31),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(Icons.search))
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 19, 27, 234),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: Text(
                  "Вчера",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ),
           
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 31, 219, 31),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            child: Text(
              "Ваш счет: 100",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Row(
          children: [
            card(),
            
          ],
        ),
      ],
    );
  }

  Widget card() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Container(
            width: 120,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "asset/images/almaty2.jpg",
                  height: 90,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Заказ #23423423",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      Text(
                        "TOO Компания",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 31, 219, 31)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 80,
              right: 15,
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 31, 219, 31),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                  ),
                  child: Text(
                    "100",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 10),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
