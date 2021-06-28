import 'package:ewalle/pages/home/bloc.dart';
import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  MenuWidget({
    Key? key,
    required this.context,
    required this.bloc,
  }) : super(key: key);

  final BuildContext context;
  final HomeBloc bloc;
  final List<String> menuList = [
    "Home",
    "Profile",
    "Accounts",
    "Transactions",
    "Stats",
    "Settings",
    "Help"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        Expanded(
          flex: MediaQuery.of(context).size.height < 590 ? 10 : 4,
          child: StreamBuilder<dynamic>(
              stream: bloc.homePageStream,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: menuList
                        .map(
                          (e) => getNavigationOption(e, snapshot.data),
                        )
                        .toList(),
                  );
                }
                return Container();
              }),
        ),
        Spacer(),
        /*   Expanded(child: Container()), */
      ],
    );
  }

  Widget getNavigationOption(String title, int selectedIndex) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case "Home":
            bloc.setHomePageStream!(0);
            break;
          case "Profile":
            bloc.setHomePageStream!(1);
            break;
          case "Accounts":
            bloc.setHomePageStream!(2);
            break;
          case "Transactions":
            bloc.setHomePageStream!(3);
            break;
          case "Stats":
            bloc.setHomePageStream!(4);
            break;
          case "Settings":
            bloc.setHomePageStream!(5);
            break;
          case "Help":
            bloc.setHomePageStream!(6);
            break;
        }
        bloc.setPositionStream!(PositionOffset(x: 0, y: 0, scale: 1, angle: 0));
        bloc.setmenuStateStream!(MENU_STATE.CLOSE);
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 20,
          top: 7,
          bottom: 7,
        ),
        decoration: BoxDecoration(
            border: Border(
          left: BorderSide(
            width: 5,
            color: title == menuList[selectedIndex]
                ? AppColor.COLOR_FFAC30
                : AppColor.COLOR_F1F3F6,
          ),
        )),
        child: Text(
          title,
          style: TextStyle(
            color: AppColor.COLOR_1B1D28,
            fontSize: 18,
            fontWeight: AppFontWeight.semiBold,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}
