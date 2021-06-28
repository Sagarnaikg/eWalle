import 'package:ewalle/pages/auth/screen.dart';
import 'package:ewalle/pages/home/bloc.dart';
import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:ewalle/resources/media.dart';
import 'package:ewalle/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 600),
            reverseTransitionDuration: Duration(milliseconds: 600),
            pageBuilder: (context, animation, secondaryanimation) => SignIn(),
            transitionsBuilder:
                (context, animation, secondaryanimation, child) {
              return SlideTransition(
                child: child,
                position: animation.drive(
                  Tween(
                    begin: Offset(-1, 0),
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
        Auth.setAuthState(false);
      },
      child: Row(
        children: [
          SvgPicture.asset(
            AppMedia.getIcon("logout.svg"),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Logout",
            style: TextStyle(
              color: AppColor.COLOR_1B1D28,
              fontSize: 20,
              fontWeight: AppFontWeight.semiBold,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: ElevatedButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Color(0x153A4276)),
              elevation: MaterialStateProperty.all(0),
              foregroundColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(AppColor.COLOR_F1F3F6),
            ),
            onPressed: () {
              bloc.setPositionStream!(
                  PositionOffset(x: 0, y: 0, scale: 1, angle: 0));
              bloc.setmenuStateStream!(MENU_STATE.CLOSE);
            },
            child: SvgPicture.asset(
              AppMedia.getIcon("close.svg"),
              height: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: EdgeInsets.all(20),
        color: AppColor.COLOR_FFAC30,
        child: SvgPicture.asset(
          AppMedia.getIcon("add.svg"),
          height: 16,
        ),
      ),
    );
  }
}
