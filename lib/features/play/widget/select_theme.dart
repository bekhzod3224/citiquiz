import 'package:citiquiz/features/splash/splash.dart';
import 'package:flutter/material.dart';

class SelectTheme extends StatefulWidget {
  const SelectTheme({super.key});

  @override
  State<SelectTheme> createState() => _SelectThemeState();
}

class _SelectThemeState extends State<SelectTheme> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text("Выберите тему"),
    ),
     body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CategoryList(),
              CategoryList(),
              CategoryList(),
              CategoryList(),
            ],
          ),
        ),
      ),
   );
  }

  Widget CategoryList() {
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return Splash();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 10,),
                    
                    Text(
                      "Улицы города",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text("Доступ для прохождения",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                                Container(
                                        decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 11, 255, 19),
                                    borderRadius: BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.apple,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                              Text(
                                                "100",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                      ],
                    ),
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