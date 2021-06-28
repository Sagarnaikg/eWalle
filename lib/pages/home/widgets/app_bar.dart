import 'package:ewalle/pages/home/bloc.dart';
import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:ewalle/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'buttons.dart' as CB;

class ManuDrawerAppBar extends StatelessWidget {
  const ManuDrawerAppBar({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 70,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.COLOR_FFFFFF,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: SafeArea(
                child: ProfileWidget(bloc: bloc),
              ),
            ),
          ),
          Expanded(
            flex: 40,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.only(right: 25),
                alignment: Alignment.centerRight,
                child: CB.CloseButton(bloc: bloc),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.bloc,
    required this.context,
  }) : super(key: key);

  final HomeBloc bloc;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppMedia.getIcon("logo.svg"),
              height: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "eWalle",
              style: TextStyle(
                color: AppColor.COLOR_1B1D28,
                fontSize: 30,
                fontWeight: AppFontWeight.bold,
              ),
            ),
            Spacer(),
            Container(
              width: 50,
              height: 50,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Color(0x153A4276)),
                      elevation: MaterialStateProperty.all(0),
                      foregroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.COLOR_FFFFFF),
                    ),
                    onPressed: () {
                      double x = MediaQuery.of(context).size.width * 0.5;
                      double y = MediaQuery.of(context).size.height * 0.23;

                      bloc.setPositionStream!(PositionOffset(
                          x: x, y: y, scale: 0.6, angle: -0.261799));
                      bloc.setmenuStateStream!(MENU_STATE.OPEN);
                    },
                    child: SvgPicture.asset(
                      AppMedia.getIcon("menu.svg"),
                      height: 40,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            bloc.setHomePageStream!(1);
            bloc.setPositionStream!(
                PositionOffset(x: 0, y: 0, scale: 1, angle: 0));
            bloc.setmenuStateStream!(MENU_STATE.CLOSE);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              color: AppColor.COLOR_F1F3F6,
              child: SvgPicture.asset(
                AppMedia.getImage("avatar01.svg"),
                width: 50,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 13,
        ),
        GestureDetector(
          onTap: () {
            bloc.setHomePageStream!(1);
            bloc.setPositionStream!(
                PositionOffset(x: 0, y: 0, scale: 1, angle: 0));
            bloc.setmenuStateStream!(MENU_STATE.CLOSE);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Carol Black",
                style: TextStyle(
                  color: AppColor.COLOR_1B1D28,
                  fontSize: 20,
                  fontWeight: AppFontWeight.semiBold,
                  height: 1.4,
                ),
              ),
              Text(
                "Seattle,Washington",
                style: TextStyle(
                  color: AppColor.COLOR_7B7F9E,
                  fontSize: 14,
                  fontWeight: AppFontWeight.regular,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
