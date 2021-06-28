import 'package:ewalle/pages/home/screen.dart';
import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:ewalle/resources/media.dart';
import 'package:ewalle/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingUpButton extends StatelessWidget {
  const SingUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Auth.setAuthState(true);
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 600),
            reverseTransitionDuration: Duration(milliseconds: 600),
            pageBuilder: (context, animation, secondaryanimation) => HomePage(),
            transitionsBuilder:
                (context, animation, secondaryanimation, child) {
              return SlideTransition(
                child: child,
                position: animation.drive(
                  Tween(
                    begin: Offset(1, 0),
                    end: Offset(0, 0),
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
      },
      child: Text(
        "Create an account",
        style: TextStyle(
          color: AppColor.COLOR_212330,
          fontSize: 18,
          fontWeight: AppFontWeight.semiBold,
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          overlayColor: MaterialStateProperty.all(Color(0xaaFF9900)),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 600),
              reverseTransitionDuration: Duration(milliseconds: 600),
              pageBuilder: (context, animation, secondaryanimation) =>
                  HomePage(),
              transitionsBuilder:
                  (context, animation, secondaryanimation, child) {
                return SlideTransition(
                  child: child,
                  position: animation.drive(
                    Tween(
                      begin: Offset(1, 0),
                      end: Offset(0, 0),
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
          Auth.setAuthState(true);
        },
        child: Container(
          decoration: BoxDecoration(
            /*  color: AppColor.COLOR_FFAC30, */
            borderRadius: BorderRadius.circular(11),
          ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign in",
                style: TextStyle(
                  color: AppColor.COLOR_212330,
                  fontSize: 18,
                  fontWeight: AppFontWeight.semiBold,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              SvgPicture.asset(
                AppMedia.getIcon("arrow-right.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
