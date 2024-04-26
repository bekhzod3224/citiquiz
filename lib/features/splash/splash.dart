import 'package:citiquiz/features/auth/view/auth_screen.dart';
import 'package:citiquiz/features/play/widget/play-quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  "asset/images/almaty2.jpg",
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 80,),
                      Text('Выбранная категория \n<<Глазами туриста>>',style: TextStyle(
                        fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold,height: 1.8
                      ),),
                      SizedBox(height: 80,),
                  
                      Text('Ответьте на все 10\nпар вопроса из квиза\nи получит +250\nна ваш счет!',style: TextStyle(
                        fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                   Padding(
                     padding: const EdgeInsets.only(bottom: 40),
                     child: GestureDetector(
                                         onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                      return PlayQuiz();
                     }));
                                         },
                                         child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 32.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 12, 237, 19),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          "Начать квис",
                          style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                                         ),
                                       ),
                   ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
