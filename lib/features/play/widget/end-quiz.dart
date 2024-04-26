import 'package:citiquiz/features/auth/view/auth_screen.dart';
import 'package:citiquiz/features/play/widget/play-quiz.dart';
import 'package:citiquiz/features/profil/profil_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({super.key});

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
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
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        'Квиз заврешен',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.8),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 12, 237, 19),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Правильные \nответы",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "4",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30),
                                          ),
                                          Text(
                                            "/10",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 12, 237, 19),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Коинов \nначислено",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                      Text(
                                        "100",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                       SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: Text(
                          '*Если Вы не сргласны \nс результаом квиза, то \nсвяжитесь с нами через ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      
                      InkWell(
                        onTap:() {
                          // Navigator.push(context,MaterialPageRoute(builder:(context){
                          //   return ProfilScreen();
                          // }));
                        },
                        child: Text(
                          'Профиль',
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              height: 1.8),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PlayQuiz();
                        }));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 32.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 12, 237, 19),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: Text(
                            "Продолжить",
                            style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
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
