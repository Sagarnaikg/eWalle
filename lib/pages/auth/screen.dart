import 'package:ewalle/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/buttons.dart';
import 'widgets/intro.dart';
import 'widgets/time_date_weather.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            SvgPicture.asset(
              AppMedia.getImage("illustration.svg"),
              height: MediaQuery.of(context).size.height,
            ),
            Expanded(
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                child: Column(
                  children: [
                    Expanded(
                      flex: 25,
                      child: TimeDateWeatherWidget(),
                    ),
                    Expanded(
                      flex: 50,
                      child: IntroWidget(),
                    ),
                    Expanded(
                      flex: 25,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(height: 1),
                            SignInButton(),
                            SingUpButton(),
                            SizedBox(height: 1),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
