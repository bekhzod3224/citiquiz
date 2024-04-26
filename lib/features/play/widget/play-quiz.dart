import 'package:citiquiz/features/play/widget/end-quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayQuiz extends StatefulWidget {
  const PlayQuiz({super.key});

  @override
  State<PlayQuiz> createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  "Ответьте на вопрос",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(10, (index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8)),
                                child: Center(child: Text("2", style: TextStyle(color: Colors.white),)),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("Категория ло лоло",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("+205",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("6768",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("Категория ло лоло",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "Ответьте на вопрос вопрос вопрос вопрос вопрос?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                      height: 200,
                      child: Image.asset("asset/images/almaty2.jpg")),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        text("Аба/Масанчи"),
                        text("ул.Фурмонова "),
                      ],
                    ),
                    Column(
                      children: [
                        text("Аба/Масанчи"),
                        text("Аба/Масанчи"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textnext("Предыдущий"),
                    textnext("Пропустить"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizResult()));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        "Дострочно выйти из квиза",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget text(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue.withOpacity(0.8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ))),
    );
  }
  Widget textnext(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
          child: Container(
             width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.orange,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ))),
    );
  }
}
