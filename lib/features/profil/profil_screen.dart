import 'package:citiquiz/features/auth/view/auth_screen.dart';
import 'package:citiquiz/features/auth/view/bloc/authentication_bloc.dart';
import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/support/support_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false || snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsUI.lime,
                ),
              );
            }
            String? email;
            if (state is AuthSuccess) {
              email = state.email;
            }
            String? nick = snapshot.data!.getString('nick');
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Positioned(
                          top: 45,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                          ),
                                          child: SizedBox(
                                              width: 70,
                                              height: 70,
                                              child: Image.asset(
                                                  "asset/images/almaty2.jpg")),
                                        ),
                                      ),
                                    ),
                                     Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("Alexander", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                        Text("s", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Text("игрок", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  ],
                                )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                    color: Colors.green,
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
                                      ),
                                      SizedBox(height: 5,),
                                      Container(
                                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(4)),
                                        child: Text("изменить информацию", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                title(
                                    "Магазин", Icon(Icons.shopping_bag_rounded)),
                                title("Новости", Icon(Icons.newspaper)),
                                title("Достопримечательности",
                                    Icon(Icons.location_on)),
                                title("Партнеры",
                                    Icon(Icons.person_pin_circle_rounded)),
                                title("О нас", Icon(Icons.error)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.qr_code,
                          color: ColorsUI.white,
                          size: 25.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Center(
                          child: Text(
                            "Отсканировать QR-код",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(LogOut());
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const AuthScreen(),
                          transitionDuration: const Duration(milliseconds: 370),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 32.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 54, 54),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          "Выход",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget title(String name, Icon icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: icon,
          title: Text(
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
       
      ],
    );
  }
}
