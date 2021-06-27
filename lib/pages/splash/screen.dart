import 'package:ewalle/pages/auth/screen.dart';
import 'package:ewalle/pages/home/screen.dart';
import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:ewalle/resources/media.dart';
import 'package:ewalle/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    setState(() {
      selected = !selected;
    });

    super.initState();
  }

  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              TweenAnimationBuilder(
                curve: Curves.fastOutSlowIn,
                tween: Tween<double>(begin: 0, end: 85),
                duration: const Duration(milliseconds: 1700),
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value / 90,
                    child: Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(
                        left: value,
                      ),
                      child: child,
                    ),
                  );
                },
                child: Text(
                  "eWalle",
                  style: TextStyle(
                    color: AppColor.COLOR_1B1D28,
                    fontSize: 30,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
                onEnd: () {
                  getAuthState();
                },
              ),
              TweenAnimationBuilder(
                curve: Curves.fastOutSlowIn,
                tween: Tween<double>(begin: 0, end: 85),
                duration: const Duration(milliseconds: 1700),
                builder: (context, double value, child) {
                  return Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(
                      right: value,
                    ),
                    child: child,
                  );
                },
                child: SvgPicture.asset(
                  AppMedia.getIcon("logo.svg"),
                  width: 60,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getAuthState() async {
    bool? state = await Auth.getAuthSate();
    if (state == true) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 600),
          reverseTransitionDuration: Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryanimation) => HomePage(),
          transitionsBuilder: (context, animation, secondaryanimation, child) {
            return FadeTransition(
              child: child,
              opacity: animation.drive(
                Tween(
                  begin: 0.0,
                  end: 1.0,
                ).chain(
                  CurveTween(
                    curve: Curves.easeInCubic,
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 600),
          reverseTransitionDuration: Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryanimation) => SignIn(),
          transitionsBuilder: (context, animation, secondaryanimation, child) {
            return FadeTransition(
              child: child,
              opacity: animation.drive(
                Tween(
                  begin: 0.0,
                  end: 1.0,
                ).chain(
                  CurveTween(
                    curve: Curves.easeInCubic,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
