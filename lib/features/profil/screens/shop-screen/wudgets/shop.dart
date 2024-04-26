import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
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
                  "Компания",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 19, 27, 234),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: Text(
                  "С начала дешевле",
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
            InkWell(
              onTap: (){
                showDialogs(context);
              },
              child: card(1)),
            InkWell(
              onTap: (){
                showDialogs(context);
              },
              child: card(2)),
              InkWell(
              onTap: (){
                showDialogs(context);
              },
              child: card(3)),
          ],
        ),
      ],
    );
  }

  Widget card(int index) {
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
                        "Разработка веб сайт на Tilda",
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
                      InkWell(
                        onTap: (){
                         index == 1 ? showDialogError(context) : showDialogSuccess(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 19, 27, 234),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            child: Text(
                              "Купить",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                            ),
                          ),
                        ),
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

  showDialogs(context){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            // title: Text('TOO <<COMPANY>>', style: TextStyle(fontSize: 16),),
            actions:[ Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TOO <<COMPANY>>', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close),)
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text('Компания представлает широкий спектр IT-услуг для среднего бизнеса', style: TextStyle(fontWeight: FontWeight.bold),)),
                Image.asset(
                  "asset/images/almaty2.jpg",
                  height: 100,
                  fit: BoxFit.cover,
                ),
                  ],
                )
                
              ],
            ),]
        )
    );
  }

    showDialogError(context){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            // title: Text('TOO <<COMPANY>>', style: TextStyle(fontSize: 16),),
            actions:[ Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     SizedBox(),
                      IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close),)
                    ],
                  ),
                ),
                
                Center(
                  child: Icon(Icons.error, color: Colors.red,),
                ),
                SizedBox(
                  height: 10,
                ),
               Center(
                 child: Container(
                        width: 190,
                        child: Text('Ошибка у Вас недостаточно коинов', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),)),
               ),
               
                
              ],
            ),]
        )
    );
  }

  showDialogSuccess(context){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            // title: Text('TOO <<COMPANY>>', style: TextStyle(fontSize: 16),),
            actions:[ Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     SizedBox(),
                      IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close),)
                    ],
                  ),
                ),
                Center(
                  child: Icon(Icons.check_circle_outline, color: Colors.green,size: 40,),
                ),
                SizedBox(
                  height: 10,
                ),
               Center(
                 child: Container(
                        width: 190,
                        child: Text('Ваш заказ #723487 готов', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),)),
               ),
               Center(
                 child: Container(
                        width: 190,
                        child: Text('Ваш ваучер', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)),
               ),
               SizedBox(
                height: 10,
               ),

               Center(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                   child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("QRTWIUW", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          Icon(Icons.copy, color: Colors.grey,size: 20,),
                        ],
                      ),
                    ),
                   ),
                 ),
               )
               
                
              ],
            ),]
        )
    );
  }

}
